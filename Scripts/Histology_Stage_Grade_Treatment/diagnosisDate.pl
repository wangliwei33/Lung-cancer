
while (<>) {
	chomp;
	$_ =~ s/\r//g;
	$_=~s/\s+$//g;
	$_=~s/\^s+//g;
	@e=split/\t/;
	$e[1]=~s/\-//g; 
	 
	 	$t{$e[0]}{$e[1]}= $_;
	 
		
	 
	  
	 
		
}


 
    foreach $mcn (keys%t) {
    
    	@date = keys%{$t{ $mcn}};
    	@date =sort{ $a <=> $b }@date;
    	 
     
    				#print $mcn. "\t". $date[0]. "\t". $t{$mcn}{$date[0]}. "\n";
     
     					print  $t{$mcn}{$date[0]}. "\n";
    
      
    
    
}
 
 