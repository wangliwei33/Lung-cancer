$infile1 = $ARGV[0]; ## ../rrf/RXNCONSO.RRF
$infile2 = $ARGV[1]; ## hypo-med.csv

 

  
#############################################
open( FI1, "<$infile1" );
while (<FI1>) {
	chomp;
	
	print $_. "\n";
	#next if ($_=~/\"Negated\"/);
	$_ =~ s/\r//g;
	$_=~s/\s+$//g;
	@e = split /\t/;
	@f = split (/\"/, $e[11]);
	#print $e[11]. "\n";
	#print $_. "\n";
	next if ($e[11]=~/\b(January|Jan|February|Feb|March|Mar|April|Apr|May|June|Jun|July|Jul|August|Aug|September|Sept|Sep|October|Oct|November|Nov|December|Dec)\b/i );
	next if ($e[11]=~/\d+(\/|\-)\d+/) ;
	next if ($e[11]=~/ \d{4} / );
	next if ($e[11]=~/spring|summer|fall|autumn|winter/i );
	
	#print $_. "\n";
	$_ =~ s/\r//g;
	$_=~s/\s+$//g;
	@e = split /\t/;
	@f = split (/\"/, $e[11]);
	#print $f[2]. "\t". $f[0]. "\t". $f[1]. "\n";
 #	print $e[0]. "\t". $f[1]. "\n";
		$f[1]=~s/^\s*//g;
		$t{ $e[0] }{ $f[1] }= 1;
	 
#print $e[0]. "\t". $f[1]. "\n";

}
open( FI2, "<$infile2" );
open( FO,  ">$ofile" );
while (<FI2>) {
	chomp;
	
#	next if ($_=~/\"Negated\"/);
	 
	@g = split (/\t/);
	@h = split (/\./, $g[1]);
	
	print $_. "\n";
	for ( $i =0; $i < @h; $i++) {
		 $h[$i]=~s/^\s*//g;
		 $h[$i]=$h[$i]. ".";
		 
		# next if ($h[$i+1] eq "");
		#  $h[$i+1]=~s/^\s*//g;
		  #$h[$i+1]=$h[$i+1]. ".";
	
		#print $g[0]. "\t". $h[$i]. "\n";
   		if ( exists( $t{ $g[0] }{ $h[$i] }) ) {
	#  print $_. "\n";
	  	#next if ($h[$i+1] eq "");
	  	#next if ($h[$i+2] eq "");
	  	 
	  	$new =  $h[$i-1]. "|". $h[$i].  "|". $h[$i+1]. "|". $h[$i+2];
	  	
	  		if ( $new =~/(\d+|January|Jan|February|Feb|March|Mar|April|Apr|May|June|Jun|July|Jul|August|Aug|September|Sept|Sep|October|Oct|November|Nov|December|Dec|spring|summer|autumn|winter|this year|last year)/i) {
   	 			print $g[0]. "\t". $new. "\n";
   	 		 }
 		}
 		
 
 	}
 	
 	}
  