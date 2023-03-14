#!/usr/bin/perl
## perl ../MedEx_Dist_Linux/ouput1/clean.pl ../rrf/RXNCONSO.RRF hypo-med.csv allMed
$infile1 = $ARGV[0]; ## ../rrf/RXNCONSO.RRF
$infile2 = $ARGV[1]; ## hypo-med.csv
 
### 
### perl map.pl tumor_cosmic_SM_sentence tumor_sentenceID > negativePool
  
#############################################
open( FI1, "<$infile1" );
while (<FI1>) {
	chomp;
	$_ =~ s/\r//g;
	$_=~s/\s+$//g;
	$_=~s/\-//g;
	
	@e = split /\t/;
 
	 
	 
	$t{$e[1]}= 1;
	#$t{$_}= 1;
	 
 
 	
 
}
open( FI2, "<$infile2" );
while (<FI2>) {
chomp;
	$_ =~ s/\r//g;
	$_=~s/\s+$//g;
	
	 
	@x = split /\t/;
	#$x[1]=~s/\"//g;
	$x[0]=~s/\-//g;
	#print $x[0]. "\n";
	  
#	if ( exists ( $t{ $_})) { 
	
	next if ( exists ( $t{ $x[0]})) ;
	#next if ( exists ( $t{ $x[0]})) ;
	 
			print   $_.  "\n";
		#	print $x[2]. "\n"; 
			#print   $_. "\t". $norm[0]. "\n";
		 
	 
	 
	 
}



 