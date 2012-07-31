#!/usr/bin/env perl
###############################################################################
# S12CBase - Test Builder (Mini-BDM-Pod)                                      #
###############################################################################
#    Copyright 2012 Dirk Heisswolf                                            #
#    This file is part of the S12CBase framework for Freescale's S12C MCU     #
#    family.                                                                  #
#                                                                             #
#    S12CBase is free software: you can redistribute it and/or modify         #
#    it under the terms of the GNU General Public License as published by     #
#    the Free Software Foundation, either version 3 of the License, or        #
#    (at your option) any later version.                                      #
#                                                                             #
#    S12CBase is distributed in the hope that it will be useful,              #
#    but WITHOUT ANY WARRANTY; without even the implied warranty of           #
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            #
#    GNU General Public License for more details.                             #
#                                                                             #
#    You should have received a copy of the GNU General Public License        #
#    along with S12CBase.  If not, see <http://www.gnu.org/licenses/>.        #
###############################################################################
# Description:                                                                #
#    This perl script generates the assembler source of a RAM based test case #
#    puts it into a command file, that can be directly uploaded onto a        #
#    D-Bug12 debugger.                                                        #
###############################################################################
# Version History:                                                            #
#    31 July, 2012                                                            #
#      - Initial release                                                      #
###############################################################################

#################
# Perl settings #
#################
use 5.005;
#use warnings;
use File::Basename;
use FindBin qw($RealBin);
use lib $RealBin;
use lib "$RealBin/../HSW12/Perl";
require hsw12_asm;

###############
# global vars #
###############
@src_files         = ();
@lib_files         = ();
%defines           = ();
$output_path       = ();
$prog_name         = "";
$arg_type          = "src";
$srec_format       = $hsw12_asm::srec_def_format;
$srec_data_length  = $hsw12_asm::srec_def_data_length;
$srec_add_s5       = $hsw12_asm::srec_def_add_s5;
$srec_word_entries = 1;
$command_file_name = "";
$code              = {};
$comp_symbols      = {};
$pag_addrspace     = {};
$initial_pc;

##########################
# read command line args #
##########################
#printf "parsing args: count: %s\n", $#ARGV + 1;
foreach $arg (@ARGV) {
    #printf "  arg: %s\n", $arg;
    if ($arg =~ /^\s*\-L\s*$/i) {
	$arg_type = "lib";
    } elsif ($arg =~ /^\s*\-D\s*$/i) {
	$arg_type = "def";
    } elsif ($arg =~ /^\s*\-/) {
	#ignore
    } elsif ($arg_type eq "src") {
	#sourcs file
	push @src_files, $arg;
    } elsif ($arg_type eq "lib") {
	#library path
	if ($arg !~ /\/$/) {$arg = sprintf("%s/", $arg);}
	unshift @lib_files, $arg;
        $arg_type          = "src";
    } elsif ($arg_type eq "def") {
	#precompiler define
	if ($arg =~ /^\s*(\w+)=(\w+)\s*$/) {
	    $defines{uc($1)} = $2;
	} elsif ($arg =~ /^\s*(\w+)\s*$/) {
	    $defines{uc($1)} = "";
	}
        $arg_type          = "src";
    }
}

###################
# print help text #
###################
if ($#src_files < 0) {
    printf "usage: %s [-L <library path>] [-D <define: name=value or name>] <src files> \n", $0;
    print  "\n";
    exit;
}

###################
# add default lib #
###################
#printf "libraries:    %s (%s)\n",join("\", \"", @lib_files), $#lib_files;
#printf "source files: %s (%s)\n",join("\", \"", @src_files), $#src_files;
if ($#lib_files < 0) {
  foreach $src_file (@src_files) {
    #printf "add library:%s/\n", dirname($src_file);
    push @lib_files, sprintf("%s/", dirname($src_file));
  }
}

#######################################
# determine program name and location #
#######################################
$prog_name   = basename($src_files[0], ".s");
$output_path = dirname($src_files[0], ".s");

#######################
# compile source code #
#######################
#printf STDERR "src files: \"%s\"\n", join("\", \"", @src_files);  
#printf STDERR "lib files: \"%s\"\n", join("\", \"", @lib_files);  
#printf STDERR "defines:   \"%s\"\n", join("\", \"", @defines);  
$code = hsw12_asm->new(\@src_files, \@lib_files, \%defines, "S12", 1);

#####################
# check code status #
#####################
if ($code->{problems}) {
    printf STDERR "Problem summary: %s\n", $code->{problems};
} else {
    #####################################
    # read symbol table and address map #
    #####################################
    $comp_symbols  = $code->{comp_symbols};
    $pag_addrspace = $code->{pag_addrspace};
    
    ######################
    # write command file #
    ######################
    $command_file_name = sprintf("%s.txt", $prog_name);
    if (open (FILEHANDLE, sprintf("+>%s", $command_file_name))) {
	printf FILEHANDLE "reset\n";     # reset the target MCU
	printf FILEHANDLE "nobr\n";      # remove all breakpoints
	printf FILEHANDLE "load\n";      # load S-Record
	$out_string = $code->print_pag_srec(uc($prog_name),
					    $srec_format,
					    $srec_data_length,
					    $srec_add_s5,
					    $srec_word_entries);
	print FILEHANDLE $out_string;

	#printf STDOUT "comp symbpls: %s\n", join(", ", keys %{$self->{comp_symbols}} 

	if (defined $code->{comp_symbols}->{"START_OF_CODE"}) {
	    $initial_pc = $code->{comp_symbols}->{"START_OF_CODE"};
	    printf FILEHANDLE "pc %4x\n", $initial_pc;      # set PC
	    printf FILEHANDLE "g\n";                        # run program
	    #printf STDOUT "START_OF_CODE found\n";
	} elsif (exists $code->{comp_symbols}->{"START_OF_TEST"}) {
	    $initial_pc = $code->{comp_symbols}->{"START_OF_TEST"};
	    printf FILEHANDLE "pc %4x\n", $initial_pc;      # set PC
	    printf FILEHANDLE "g\n";                        # run program
	    #printf STDOUT "START_OF_TEST found\n";
	} elsif ((exists $code->{pag_addrspace}->{0xFFFE}) &&
		 (exists $code->{pag_addrspace}->{0xFFFF})) {
	    $initial_pc = (($code->{pag_addrspace}->{0xFFFE}->[0]) << 8) + 
		           ($code->{pag_addrspace}->{0xFFFF}->[0]);
	    printf FILEHANDLE "pc %4x\n", $initial_pc;      # set PC
	    printf FILEHANDLE "g\n";                        # run program
	    
	} else {
	    #printf STDERR "No start address found\n";
	    printf FILEHANDLE "device\n";                   # show device info
	    printf FILEHANDLE "rd\n";                       # show register info
	}
	
	close FILEHANDLE;
    } else {
	printf STDERR "Can't open command file \"%s\"\n", $command_file_name;
	exit;
    }
}

1;













