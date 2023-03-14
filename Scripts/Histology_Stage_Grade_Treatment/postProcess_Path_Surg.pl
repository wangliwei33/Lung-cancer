my $path = "/Users/m095909/Documents/Projects/Pharmacology_Epidemiology/missing_data/path";
#my $path = "/Users/m095909/Documents/Projects/Pharmacology_Epidemiology/missing_data/surg";

opendir( DIR, $path );
my @files = readdir(DIR);
closedir(DIR);
 
foreach my $infile (@files) {
   
					open (IFILE, "<$path/$infile") or die "Can't open $infile: $!";
					@content="";
					while (<IFILE>){
						chomp;
						$_=~s/\\par//g;
						$_=~s/\\par//g;
						
						$file="/Users/m095909/Documents/Projects/Pharmacology_Epidemiology/missing_data/path_inter/$infile";
						#$file="/Users/m095909/Documents/Projects/Pharmacology_Epidemiology/missing_data/surg_inter/$infile";
						open(OUT, ">$file");
						
						print OUT $_. "\n";
					}
}
						



