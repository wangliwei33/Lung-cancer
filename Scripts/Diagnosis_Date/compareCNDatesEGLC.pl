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
	
	@e = split /\t/;
 
	 
	#$t{$e[3]}{$e[1]}= 1;
	$e[0]=~s/^0//g;
	$e[0]=~s/^0//g;
	($y,$m,$d)=split(/\-/,$e[0]);
  	$day=$y*365.25+$m*30.5+$d;
	
	@f=split(/\-/, $e[1]);
	#$e[2]=~s/\-//g;
	
	
	$t{$f[1]}{$day} = $e[0];
	#$t{$e[0]}= 1;
	#print $f[1]. "\t". $day. "\t". $e[0]. "\n";
	# print $e[0].  "\t". $y. "\t". $m. "\t". $d. "\n";
 
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
  	#print $x[2]. "\t".$x[4]. "\n";
  	($mm,$dd,$yy)=split(/\//,$x[4]);
  	$mm=~s/^0//g;
  	$dd=~s/^0//g;
  	
  	$EGLC=$yy*365.25+$mm*30.5+$dd;
  	# print $x[2]. "\t". $EGLC. "\n";
   # $ACE= $f[2]. $f[0]. $f[1];
   # $EGLC= $g[2]. $g[0]. $g[1];
  #  print  $e[1]. "\t". $EGLC. "\t".   "\n";
    if ( exists ( $t{ $x[2]})) { 
   # print $_. "\n";
   	 	@date =  keys %{ $t{ $x[2] } } ;
   	 	@date =  sort(@date);
    #print $x[2]. "\t". $date[0]. "\t". $EGLC."\n";
   		foreach $date (@date) {
   		
   		#print $x[2]. "\t". $date. "\t".$t{ $x[2] }{$date}. "\t". $EGLC. "\t". $x[4]. "\n";
   			if ($date == $EGLC) {
   				#print "Exact match". "\t". $_. "\n";
   				print   $_. "\n";
   			 
   			}
    		if (abs($date - $EGLC) <=18) {
    			#print "match_Within_3_Days". "\t". $_. "\n";
    			print   $_. "\n";
    		}
    	 
     	#else {print "No match". "\t". $_. "\t". $t{$x[1]}{$date[0]}. "\n";}
      	#	else {print  $_. "\t". $t{$x[1]}{$date[0]}. "\n";}
      	}
     	 
   } 
    
   #else {print "No match". "\t". $_. "\t".  $t{$x[1]}{$date[0]}. "\n";}
  	# else {print  $_. "\t".  $t{$x[1]}{$date[0]}. "\n";}
   
}
 	 