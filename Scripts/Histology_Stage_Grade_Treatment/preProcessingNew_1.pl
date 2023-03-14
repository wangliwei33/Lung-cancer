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
   		
   		 $file="$outputdir/$infile";
  		
 
         chomp;
      	 #($text)=($_=~/DIAGNO(.*)/i);
      	 
      	 if ($_ =~/\d+(\/|\-)\d+(\/|\-)\d+\)/ )  {     	 
      	 	@date = split(/\d+\)/, $_);  
      	 
			 if (@date >2) {
				$j=0;
				foreach $date (@date) {
				$j=$j+1;
				if ($_ =~/\\par\s*\\par\s*/) {
		  #	print $text. "\n";
	  
					#$text=~s/\\par\s*\\par\s*/\t/g;
			#print $text. "\n";
					#@chunk =split(/\t/, $text);
					@chunk =split(/\\par\s*\\par\s*/, $_);
					$i=0;
					foreach $chunk (@chunk) {
						$i=$i+1;
				 		
						next if ($chunk=~/^\s*$/);
						next if ($chunk!~/\w+/);
						next if ($chunk!~/\S+/);
						# if ($chunk=~/\\par\s*\d+/) {
# 							$chunk=~s/\\par\s*//g;
# 						}
						 
						$chunk=~s/\\par\s*//g;
						 
						$file=$infile."_".$j."_".$i;
						#print $file. "\t". $chunk. "\n";
						
						$myfile="$outputdir/$file";
						 open(OUT, ">$myfile"); 
				 
						print OUT $chunk. "\n";
   
					}
				}
			  }	
			}
		
			if (@date <=2) {
		
				open(OUT, ">$file"); 
				#  if ($_=~/\\par\s*\d+/) {
# 						$_=~s/\\par\s*//g;
# 					}
					 
						$_=~s/\\par//g;
					 
					 print OUT $_. "\n";
		
		
	 		}
	 	
	 	}	
		elsif ($_ !~/\d+\/\d+\/\d+\)/ && $_ !~/\d+\-\d+\-\d+\)/) {
			# if ($_=~/\\par\s*\d+/) {
# 				$_=~s/\\par\s*//g;
# 			}
			 
				$_=~s/\\par//g;
			 
			open(OUT, ">$file"); 
			print OUT $_. "\n";
		}
	
	
		}
		
	close IFILE;
	
}

}
 