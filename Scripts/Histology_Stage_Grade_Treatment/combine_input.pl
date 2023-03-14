#my $path = "/home/m095909/Projects/U24/Pharmacology_Epidemiology/missing_data/out_CN";
my $path = "/home/m095909/Projects/U24/Pharmacology_Epidemiology/missing_data/Surgery/CN_output";

opendir( DIR, $path );
my @files = readdir(DIR);
closedir(DIR);
#print $files[2]. "\n";
foreach my $infile (@files) {
   #if($infile=~/\d+\.txt/){
 				 
					#open( OUT, ">/home/m095909/lung_cancer/all.nlp.tmp" ) or die "Couldn't open the $infile file for writing. \n";
					 
			 
					 
				 
					open (IFILE, "<$path/$infile") or die "Can't open $infile: $!";
				 
					while (<IFILE>){
						chomp;
						next if ($_=~/^\s+$/);
						next if ($_ eq "");
						print $infile. "\t". $_. "\n";
					}
	}
						