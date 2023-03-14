#my $file = "/projects/HongFang/BioBank/CN/6144081.txt";
#my $path = "/projects/HongFang/BioBank/CN";

#plan(Impression / Report / Plan:20112:)
#history (History of Present Illness:20103:)
#20104	20104	Current_Medications



my $path = "/home/m095909/Projects/U24/Pharmacology_Epidemiology/missing_data/out_CN";

 opendir( DIR, $path );

my @files = readdir(DIR);

#closedir(DIR);
foreach my $infile (@files) {
 
 	next if ($infile=~/\.$/);
	next if ($infile=~/\..$/);
	 
	 
	if (defined($infile)) {
		open (IFILE, "<$path/$infile") or die "Can't open $infile: $!";
		while (<IFILE>) {
   		 
						chomp;
						next if ($_ eq "");
						print $infile. "\t". $_. "\n";
					}
				 
			}
}