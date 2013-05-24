
#
# step 1: get a list of all the files in the tree
#

@ListOfMakeFiles = `"dir /s /b development"`;
#print "@ListOfMakeFiles";


#
# step 2: create and initialize our variables
#

$TotalCLines=0;
$TotalASPLines=0;
$TotalSQLLines=0;
$TotalXMLLines=0;
$TotalPerlLines = 0;
$TotalInstallshieldLines = 0;
$TotalVBLines = 0;
$TotalVBSLines = 0;

## File Numbers

$TotalCFiles = 0;
$TotalASPFiles = 0;
$TotalSQLFiles = 0;
$TotalXMLFiles = 0;
$TotalPerlFiles = 0;
$TotalInstallshieldFiles = 0;
$TotalVBFiles = 0;
$TotalVBSFiles = 0;

#
# LinCount is the Perl equivalent of wc -l
#

sub LineCount {
	local($FileName) = @_;
	my $lines = 0;
	open(FILE, $_) or die "Can't open `$_': $!";
	while (sysread FILE, $buffer, 4096) {
		$lines += ($buffer =~ tr/\n//);
	}
	close FILE;
	return $lines;
}

#
# step 3: open the output file for the C/C++ stats
#

$Outputfile = "> clines.out";
open(CFILELINES,$Outputfile) or die "Failed to open $Outputfile\n";

$temp;

#
# step 4 : iterate through the list of files.  If the file type is
# not C/C++, simple do a line count
#

foreach my $i (@ListOfMakeFiles) {
	$_ = $i;

	if(/(?i)^thirdparty\\/) {
		print "skipping $_\n";
	}
	

	if(/(?i)\.cpp$/ || /(?i)\.c$/ || /(?i)\.h$/) {
		$temp = `"perl clc.pl -sections TOTAL \"$i\""`;
		print CFILELINES $temp;
		$TotalCFiles++;
	}
	elsif(/(?i)\.asp$/) {
		$TotalASPLines += LineCount($i);
		$TotalASPFiles++;
	}
	elsif(/(?i)\.sql$/) {
		$TotalSQLLines += LineCount($i);
		$TotalSQLFiles++;
	}
	elsif(/(?i)\.xml$/) {
		$TotalXMLLines += LineCount($i);
		$TotalXMLFiles++;
	}
	elsif(/(?i)\.perl$/ || /(?i)\.pl$/) {
		$TotalPerlLines += LineCount($i);
		$TotalPerlFiles++;
	}
	elsif(/(?i)\.rul$/) {
		$TotalInstallshieldLines += LineCount($i);
		$TotalInstallshieldFiles++;
	}
	# VB code
	elsif(/(?i)\.bas$/ || /(?i)\.cls$/ || /(?i)\.frm$/) {
		$TotalVBLines += LineCount($i);
		$TotalVBFiles++;
	}
	# VBS code
	elsif(/(?i)\.vbs$/) {
		$TotalVBSLines += LineCount($i);
		$TotalVBSFiles++;
	}
}

close CFILELINES;

$Outputfile = "> analysis.out";

#
# step 5: print the stats to the screen and to the file
#

print "TotalASPLines: $TotalASPLines\n";
print "TotalSQLLines: $TotalSQLLines\n";
print "TotalXMLLines: $TotalXMLLines\n";
print "TotalPerlLines: $TotalPerlLines\n";
print "TotalInstallshieldLines: $TotalInstallshieldLines\n";
print "Total VB lines : $TotalVBLines\n";
print "Total VBS (script) lines: $TotalVBSLines\n";

print "Total number of C/C++ Files: $TotalCFiles\n";
print "Total number of ASP files: $TotalASPFiles\n";
print "Total number of SQL files: $TotalSQLFiles\n";
print "Total number of XML files: $TotalXMLFiles\n";
print "Total number of PERL files: $TotalPerlFiles\n";
print "Total number of Installshield files: $TotalInstallshieldFiles\n";
print "Total VB files : $TotalVBFiles\n";
print "Total VBS (script) files: $TotalVBSFiles\n";

open(OUTPUTFILE,$Outputfile) or die "failed to open $Outputfile\n";

print OUTPUTFILE "TotalASPLines: $TotalASPLines\n";
print OUTPUTFILE "TotalSQLLines: $TotalSQLLines\n";
print OUTPUTFILE "TotalXMLLines: $TotalXMLLines\n";
print OUTPUTFILE "TotalPerlLines: $TotalPerlLines\n";
print OUTPUTFILE "TotalInstallshieldLines: $TotalInstallshieldLines\n";
print OUTPUTFILE "Total VB lines : $TotalVBLines\n";
print OUTPUTFILE "Total VBS (script) lines: $TotalVBSLines\n";

print OUTPUTFILE "Total number of C/C++ Files: $TotalCFiles\n";
print OUTPUTFILE "Total number of ASP files: $TotalASPFiles\n";
print OUTPUTFILE "Total number of SQL files: $TotalSQLFiles\n";
print OUTPUTFILE "Total number of XML files: $TotalXMLFiles\n";
print OUTPUTFILE "Total number of PERL files: $TotalPerlFiles\n";
print OUTPUTFILE "Total number of Installshield files: $TotalInstallshieldFiles\n";
print OUTPUTFILE "Total VB files : $TotalVBFiles\n";
print OUTPUTFILE "Total VBS (script) files: $TotalVBSFiles\n";

close(OUTPUTFILE);



