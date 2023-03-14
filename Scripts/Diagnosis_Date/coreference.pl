$infile1 = $ARGV[0]; ## ../rrf/RXNCONSO.RRF
$infile2 = $ARGV[1]; ## hypo-med.csv

 

  
#############################################
open( FI1, "<$infile1" );
while (<FI1>) {
	chomp;
	
	#print $_. "\n";
	#next if ($_!~/\"Negated\"/);
	next if ($_!~/Diagnosis_Cancer|Histology|Examination|Diagnosis_Malignancy|Symptom/);
	
	#print $_. "\n";
	$_ =~ s/\r//g;
	$_=~s/\s+$//g;
	@e = split /\t/;
	@f = split (/\"/, $e[13]);
	#print $f[2]. "\t". $f[0]. "\t". $f[1]. "\n";
 
	 
		$f[1]=~s/^\s*//g;
		$t{ $e[0] }{ $f[1] }= 1;
	 
#print $e[0]. "\t". $f[1]. "\n";

}
open( FI2, "<$infile2" );
open( FO,  ">$ofile" );
while (<FI2>) {
	chomp;
	
	next if ($_=~/\"Negated\"/);
	 
	@g = split (/\t/);
	@h = split (/\./, $g[1]);
	
	#
	for ( $i =0; $i < @h; $i++) {
		 $h[$i]=~s/^\s*//g;
		 $h[$i]=$h[$i]. ".";
		 
		# next if ($h[$i+1] eq "");
		#  $h[$i+1]=~s/^\s*//g;
		  #$h[$i+1]=$h[$i+1]. ".";
	
		#print $g[0]. "\t". $h[$i]. "\n";
   		if ( exists( $t{ $g[0] }{ $h[$i] }) ) {
	#  print $_. "\n";
	  	next if ($h[$i+1] eq "");
	  	next if ($h[$i+2] eq "");
	  	$new =  $h[$i-1]. "|". $h[$i].  "|". $h[$i+1];
	  	
	  		if ($new =~/(\d+|January|Jan|February|Feb|March|Mar|April|Apr|May|June|Jun|July|Jul|August|Aug|September|Sept|Sep|October|Oct|November|Nov|December|Dec|spring|summer|autumn|winter)/i) {
   	 			print $g[0]. "\t". $new. "\n";
   	 		 }
 		}
 		
 
 	}
 	
 	}
  