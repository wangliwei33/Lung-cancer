 
while (<>) {
	$_=~s/\r//g;
	$_=~s/\*//g;
	$_=~s/\*//g;
	chomp;
	#print $_. "\n";
  	@e=split(/\t/);
  	@f=split(/\//, $e[1]);
  	@g=split(/\//, $e[2]);
  	 
  	 print $e[2]. "\n";
    $ACE= $f[2]. $f[0]. $f[1];
    $EGLC= $g[2]. $g[0]. $g[1];
    #print   $EGLC. "\t". $ACE. "\n";
    if ($ACE == $EGLC) {print "Exact match". "\t". $_. "\n";}
    
    elsif (abs($ACE - $EGLC) <=3) {print "match_Within_3_Days". "\t". $_. "\n";}
     elsif (abs($ACE - $EGLC) <=30) {print "match_Within_30_Days". "\t". $_. "\n";}
      elsif (abs($ACE - $EGLC) <=60) {print "match_Within_60_Days". "\t". $_. "\n";}
      else {print "not_match". "\t". $_. "\n";}
    
	 

}

 