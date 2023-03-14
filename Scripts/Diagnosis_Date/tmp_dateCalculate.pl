while (<>) {
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
   	 
   	next if ($x[5] eq "");
   	($yya,$mma,$dda)=split(/\-/,$x[5]);
  	$mma=~s/^0//g;
  	$dda=~s/^0//g;
  	$date=$yya*365.25+$mma*30.5+$dda;
  #	print $date. "\t". $EGLC. "\n";
  	
   			if ($date == $EGLC) {
   				#print "Exact match". "\t". $_. "\n";
   				print   $_. "\n";
   			 
   			}
    		if (abs($date - $EGLC) <=18) {
    			#print "match_Within_3_Days". "\t". $_. "\n";
    			print   $_. "\n";
    		}
     
   
}
 	 