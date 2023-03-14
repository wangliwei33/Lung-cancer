######Extract lung related diagnosis part of path report, separated by "\par\s*\par" as input of medtagger
#############################################################################################
$dir=shift;
$outputdir=shift;

#@files=`ls $dir`;
#chomp(@files);
#print @files. "\n";
#foreach $f (@files){
	#print $f. "\n";
  # open(FILE, "$dir/$f");
    
opendir( DIR, $dir );
my @files = readdir(DIR);
#closedir(DIR);
foreach my $infile (@files) {
	next if ($infile=~/\.$/);
	next if ($infile=~/\..$/);
	if (defined($infile)) {
		open (IFILE, "<$dir/$infile") or die "Can't open $infile: $!";
		while (<IFILE>) {
        	chomp;
####chunk paragraph with diagnosis
        	if ($_=~/DIAGNOS(.)*\\par\s*\\par\s*\\par/) { 
        	 
        		($diagSec) =($_ =~/(DIAGNOS.*)/);
        	 
        		@diag =split(/\\par\s*\\par\s*\\par/, $diagSec);
        		if($diag[0]=~/FNA|lymph node|subcarinal|mediastinal|parotidectomy|Retroperitoneum|chest|interlobar|SUPRACLAVICULAR|trachea|Bronch|lung|lobe|lobar|Needle|sputum|Pleural|pulmonary/i){
					
					@chunk =split(/\\par\s*\\par\s*/, $diag[0]);
					$i=0;
					foreach $chunk (@chunk) {
						$i=$i+1;
						if ($chunk =~/\S+\\par/) {
							$chunk=~s/\\par\s*/ /g;
						}
						
						if ($chunk =~/\S+\s+\\par/) {
							$chunk=~s/\\par\s*//g;
						}
						
        				$file=$infile."_".$i;
					
						
						$myfile="$outputdir/$file";
						 open(OUT, ">$myfile"); 
				#	print $diag[0]. "\n";
        				 print OUT $chunk. "\n";  
        				#print $file. "\t". $chunk. "\n";
        			}
        		}
        	}
#####no need to chunk paragraph         
          elsif ($_!~/DIAGNOS(.)*\\par\s*\\par\s*\\par/)  {
         
         		($diag) =($_ =~/((DIAGNOS).*)/);
         		#$diag=~s/\\par\s*//g;
         		if($diag=~/FNA|lymph node|subcarinal|mediastinal|parotidectomy|Retroperitoneum|chest|interlobar|SUPRACLAVICULAR|trachea|Bronch|lung|lobe|lobar|Needle|sputum|Pleural|pulmonary/i){
					#print $infile. "\t". $diag. "\n";
					@chunk =split(/\\par\s*\\par\s*/, $diag);
					$i=0;
					foreach $chunk (@chunk) {
						$i=$i+1;
						if ($chunk =~/\S+\\par/) {
							$chunk=~s/\\par\s*/ /g;
						}
						
						if ($chunk =~/\S+\s+\\par/) {
							$chunk=~s/\\par\s*//g;
						}
						
        				$file=$infile."_".$i;
						$myfile="$outputdir/$file";
        				
						open(OUT, ">$myfile"); 
						print OUT $chunk. "\n";  
						#print $file. "\t". $chunk. "\n";  
					}
				}
         }
         
         
		 }
	close IFILE;
		
	}

}

 