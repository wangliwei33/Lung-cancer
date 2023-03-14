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
	
	#print $_. "\n";
	$_ =~ s/\r//g;
	$_=~s/\s+$//g;
	
	@e = split /\t/;
	@f = split (/\-/, $e[1]);
 
	 
	#$t{$e[3]}{$e[1]}= 1;
	$e[0]=~s/^0//g;
	$e[0]=~s/^0//g;
	($y,$m,$d)=split(/\-/,$e[0]);
  	$day=$y*365.25+$m*30.5+$d;
	
	$e[2]=~s/\-//g;
	#print $e[1] . "\n";
	
	$t{$f[1]}{$day} = 1;
	#$t{$e[0]}= 1;
	
	#print $f[1].  "\t". $e[0]. "\n";
 
}
open( FI2, "<$infile2" );
while (<FI2>) {
	chomp;
	$_ =~ s/\r//g;
	$_=~s/\s+$//g;
	
	 
	@x = split /\t/;
	
	
  	$_=~s/\r//g;
	$_=~s/\*//g;
	$_=~s/\*//g;
	chomp;
	#print $_. "\n";
  	@e=split(/\t/);
  	#@f=split(/\//, $e[1]);
  	#@g=split(/\//, $e[2]);
  	
  	($mm,$dd,$yy)=split(/\//,$e[2]);
  	$EGLC=$yy*365.25+$mm*30.5+$dd;
  	# print $x[0]. "\t". $dd. "\n";
   # $ACE= $f[2]. $f[0]. $f[1];
   # $EGLC= $g[2]. $g[0]. $g[1];
   # print  $x[0]. "\t". $EGLC. "\t".   "\n";
    if ( exists ( $t{ $x[0]})) { 
   	 	@date =  keys %{ $t{ $x[0] } } ;
   	 	@date =  sort(@date);
   # print $x[0]. "\t". $date[0]. "\t". $EGLC."\n";
   		if ($date[0] == $EGLC) {
   			print "Exact match". "\t". $_. "\n";
   		}
    	elsif (abs($date[0] - $EGLC) <= 3) {
    		print "match_Within_3_Days". "\t". $_. "\n";
    	}
     	#elsif (abs($date[0] - $EGLC) <=30) {
     		#print "match_Within_30_Days". "\t". $_. "\n";
     	#}
     	#else {print "no_match". "\t". $_. "\n";}
    	#else {print $x[0]. "\t". $date[0]. "\t". $_. "\n";}
    }
    
   # else {print "no_match". "\t".$_. "\n";}
}
 	 