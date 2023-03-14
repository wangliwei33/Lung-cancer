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
 
	#$e[2]=~s/\'//;
	$e[0]=~s/^0//g;
	$e[0]=~s/^0//g;
	$e[0]=~s/^0//g;
	
	$a{$e[0]}= 1;
	if ($e[2]=~/Path/) {
		$p{$e[0]}{$e[1]}= $_;
	}
	
	if ($e[2]=~/Clinical/) {
		$c{$e[0]}{$e[1]}= $_;
	}
	
	if ($e[2]=~/CDM/) {
		$m{$e[0]}{$e[1]}= $_;
	}
	
	if ($e[2]=~/Surgery/i) {
		$s{$e[0]}{$e[1]}= $_;
	}
	#$t{$_}= 1;
	# print $e[0]. "\t";
 
}
 
### stage; histology; grade 
foreach $case (keys %a) {	

	if ( exists ( $p{ $case} )){ 
		#foreach $case (keys %p) {	
 		@his = keys %{$p{$case}};
 		#print $case. "\t". $p{$case}{$his[0]}. "\n";
 		#}
 	}
 	
 	elsif ( exists ( $m{ $case} )){ 
 	#foreach $case (keys %m) {	
 		@his = keys %{$m{$case}};
 		#print $case. "\t". $m{$case}{$his[0]}. "\n";
 		#}
 	}
 	
 	elsif ( exists ( $c{ $case} )){ 
 	#foreach $case (keys %c) {	
 		@his = keys %{$c{$case}};
 		#print $case. "\t". $c{$case}{$his[0]}. "\n";
 		#}
 	}
 	
 	
 	
 	elsif ( exists ( $s{ $case} )){ 
 	#foreach $case (keys %s) {	
 		@his = keys %{$s{$case}};
 		#print $case. "\t".$s{$case}{$his[0]}. "\n";
 		#}
 	}
 	
 	
 
 }
 
 ### chemo; radio
foreach $case (keys %a) {	

	if ( exists ( $m{ $case} )){ 
 	#foreach $case (keys %m) {	
 		@his = keys %{$m{$case}};
 		print $case. "\t". $m{$case}{$his[0]}. "\n";
 		#}
 	}
 	
 	elsif ( exists ( $p{ $case} )){ 
		#foreach $case (keys %p) {	
 		@his = keys %{$p{$case}};
 		print $case. "\t". $p{$case}{$his[0]}. "\n";
 		#}
 	}
 	
 	elsif ( exists ( $c{ $case} )){ 
 	#foreach $case (keys %c) {	
 		@his = keys %{$c{$case}};
 		print $case. "\t". $c{$case}{$his[0]}. "\n";
 		#}
 	}
 	
 	elsif ( exists ( $s{ $case} )){ 
 	#foreach $case (keys %s) {	
 		@his = keys %{$s{$case}};
 		print $case. "\t".$s{$case}{$his[0]}. "\n";
 		#}
 	}
 	
 }	
 	 ### surgery
foreach $case (keys %a) {	

	if ( exists ( $s{ $case} )){ 
 	#foreach $case (keys %s) {	
 		@his = keys %{$s{$case}};
 		print $case. "\t".$s{$case}{$his[0]}. "\n";
 		#}
 	}
 	
 	
 	elsif ( exists ( $p{ $case} )){ 
		#foreach $case (keys %p) {	
 		@his = keys %{$p{$case}};
 		print $case. "\t". $p{$case}{$his[0]}. "\n";
 		#}
 	}
 	
 	elsif ( exists ( $c{ $case} )){ 
 	#foreach $case (keys %c) {	
 		@his = keys %{$c{$case}};
 		print $case. "\t". $c{$case}{$his[0]}. "\n";
 		#}
 	}
 	
 	elsif ( exists ( $m{ $case} )){ 
 	#foreach $case (keys %m) {	
 		@his = keys %{$m{$case}};
 		print $case. "\t". $m{$case}{$his[0]}. "\n";
 		#}
 	}
 	
 	
 }
 	
 	
 	
 	
 	
 	