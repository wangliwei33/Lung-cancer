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
	
	#@e = split /\"/;
	@e = split /\t/;
 
	 
	#$t{$e[7]}{$e[11]}= 1;
	$t{$_}= 1;
	# print  $e[7]. "\n";
 
 	
 
}
open( FI2, "<$infile2" );
while (<FI2>) {
chomp;
	$_ =~ s/\r//g;
	$_=~s/\s+$//g;
	
	 
	@x = split /\t/;
	# $x[1]=~s/\"//g;
# 	#print $x[1]. "\n";
# 	  
# 	if ( exists ( $t{ $x[1]})) { 
# 
# 			 	@norm = keys%{$t{ $x[1]}};
# 			#print   $_. "\t". $norm[0]. "\n";
# 			$norm[0]=~s/\-//g;
# 			$p{$x[0]}{$norm[0]} = 1;
# 			#print   $_. "\t". $norm[0]. "\n";
# 		 
# 	 }
# 	 


	 
 	next if ( exists ( $t{ $_})) ;
 		 

	print $_. "\n";
}
 




