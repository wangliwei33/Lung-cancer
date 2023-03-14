while (<>) {
	chomp;
	@e=split/\t/;
	@f=split(/\-/, $e[0]);
	
	#if ($e[1]=~/\d+\-\d+\-/){
	
	if ($e[1]=~/^\d{4}$/ ) {
		print $e[1]. "-07-01". "\t". $_. "\n";
	}
### early 1999	
	if ($e[1]=~/early \d+/ ) {
		print $e[1]. "-02-15". "\t". $_. "\n";
	
	}
	 
	if ($e[1]=~/middle of \d+/ ) {
		print $e[1]. "-07-01". "\t". $_. "\n";
	
	}
	 
	if ($e[1]=~/end of \d+/ ) {
		($year) = ($e[1]=~/(\d+)/);
		print $year. "-12-15". "\t". $_. "\n";
	
	}
	if ($e[1]=~/late \d+/ ) {
		($year) = ($e[1]=~/(\d+)/);	
		print $year. "-11-15". "\t". $_. "\n";
	
	#|| $e[1]=~/spring|summer|fall|autumn|winter|early|end|late|middle/){
	
	#	print $_. "\n";
	
	}

# spring 2015


	if ($e[1]=~/spring(\s+\S+){0,2} \d{4}/ ) {
		next if ($e[1]=~/(early|late|middle|end)(\s+\S+){0,2} spring(\s+\S+){0,2} \d{4}/);
		print $e[1]. "-04-15". "\t". $_. "\n";
	
	}
	 
	if ($e[1]=~/summer(\s+\S+){0,2} \d{4}/ ) {
		next if ($e[1]=~/(early|late|middle|end)(\s+\S+){0,2} summer(\s+\S+){0,2} \d{4}/);
		print $e[1]. "-07-15". "\t". $_. "\n";
	
	}
	 
	if ($e[1]=~/(autumn|fall)(\s+\S+){0,2} \d{4}/ ) {
		next if ($e[1]=~/(early|late|middle|end)(\s+\S+){0,2} (autumn|fall)(\s+\S+){0,2} \d{4}/);
		print $e[1]. "-11-15". "\t". $_. "\n";
	
	}
	 
	if ($e[1]=~/winter(\s+\S+){0,2} \d{4}/ ) {
		next if ($e[1]=~/(early|late|middle|end)(\s+\S+){0,2} winter(\s+\S+){0,2} \d{4}/);
		print $e[1]. "-02-15". "\t". $_. "\n";
	
	}
	
	#|| $e[1]=~/spring|summer|fall|autumn|winter|early|end|late|middle/){
	
	#	print $_. "\n";
	
	 

### late spring 2013	
	if ($e[1]=~/late spring(\s+\S+){0,2} \d+/ ) {
		($year) = ($e[1]=~/(\d+)/);
		print $year. "-05-01". "\t". $_. "\n";
	}
	
		
	if ($e[1]=~/late summer(\s+\S+){0,2} \d+/ ) {
		($year) = ($e[1]=~/(\d+)/);
		 print $year. "-08-01". "\t". $_. "\n";	
	}
	
	if ($e[1]=~/late (autumn|fall)(\s+\S+){0,2} \d+/ ) {
		($year) = ($e[1]=~/(\d+)/);
		 print $year. "-11-01". "\t". $_. "\n";	
	}
	if ($e[1]=~/late winter(\s+\S+){0,2} \d+/ ) {
		($year) = ($e[1]=~/(\d+)/);
		 print $year. "-02-01". "\t". $_. "\n";	
	
	}
	
### early spring 2013	
	if ($e[1]=~/early spring(\s+\S+){0,2} \d+/ ) {
		($year) = ($e[1]=~/(\d+)/);
		 print $year. "-03-31". "\t". $_. "\n";
	}	
		
	if ($e[1]=~/early summer(\s+\S+){0,2} \d+/ ) {
		($year) = ($e[1]=~/(\d+)/);
		 print $year. "-06-31". "\t". $_. "\n";	
	}
	
	if ($e[1]=~/early (autumn|fall)(\s+\S+){0,2} \d+/ ) {
		($year) = ($e[1]=~/(\d+)/);
		 print $year. "-9-31". "\t". $_. "\n";	
	}
	if ($e[1]=~/early winter(\s+\S+){0,2} \d+/ ) {
		($year) = ($e[1]=~/(\d+)/);
		 print $year. "-12-31". "\t". $_. "\n";	
	
	}
	
### middle of spring 2013	
	if ($e[1]=~/middle of spring(\s+\S+){0,2} \d+/ ) {
		($year) = ($e[1]=~/(\d+)/);
		 print $year. "-04-15". "\t". $_. "\n";
	}
	if ($e[1]=~/middle of spring/ ) {
		next if ($e[1]=~/middle of spring(\s+\S+){0,2} \d+/ ) ;
		($year) = ($f[3]=~/(\d{4})/);
		 print $year. "-04-15". "\t". $_. "\n";
	}	
	
	if ($e[1]=~/spring of this year/ ) {
		next if ($e[1]=~/middle of spring(\s+\S+){0,2} \d+/ ) ;
		next if ($e[1]=~/middle of spring/ ) ;
		($year) = ($f[3]=~/(\d{4})/);
		 print $year. "-04-15". "\t". $_. "\n";
	}	
	
	if ($e[1]=~/spring of last year/ ) {
		next if ($e[1]=~/middle of spring(\s+\S+){0,2} \d+/ ) ;
		next if ($e[1]=~/middle of spring/ ) ;
		($year) = ($f[3]=~/(\d{4})/);
		$year=$year-1;
		 print $year. "-04-15". "\t". $_. "\n";
	}	
		
	if ($e[1]=~/middle of summer(\s+\S+){0,2} \d+/ ) {
		($year) = ($e[1]=~/(\d+)/);
		 print $year. "-07-15". "\t". $_. "\n";	
	}
	if ($e[1]=~/middle of summer/ ) {
		next if ($e[1]=~/middle of summer(\s+\S+){0,2} \d+/ ) ;
		($year) = ($f[3]=~/(\d{4})/);
		 print $year. "-07-15". "\t". $_. "\n";	
	}
	if ($e[1]=~/summer of this year/ ) {
		next if ($e[1]=~/middle of summer(\s+\S+){0,2} \d+/ ) ;
		next if ($e[1]=~/middle of summer/ ) ;
		($year) = ($f[3]=~/(\d{4})/);
		 print $year. "-07-15". "\t". $_. "\n";
	}	
	
	if ($e[1]=~/summer of last year/ ) {
		next if ($e[1]=~/middle of summer(\s+\S+){0,2} \d+/ ) ;
		next if ($e[1]=~/middle of summer/ ) ;
		($year) = ($f[3]=~/(\d{4})/);
		$year=$year-1;
		 print $year. "-07-15". "\t". $_. "\n";
	}	
	if ($e[1]=~/middle of (autumn|fall)(\s+\S+){0,2} \d+/ ) {
		($year) = ($e[1]=~/(\d+)/);
		 print $year. "-10-15". "\t". $_. "\n";	
	}
	
	if ($e[1]=~/middle of (autumn|fall)/ ) {
		next if ($e[1]=~/middle of (autumn|fall)(\s+\S+){0,2} \d+/ ) ;
		($year) = ($f[3]=~/(\d{4})/);
		 print $year. "-10-15". "\t". $_. "\n";	
	}
	
	if ($e[1]=~/(autumn|fall)(\s+\S+){0,1} \d+/ ) {
		next if ($e[1]=~/middle of (autumn|fall)(\s+\S+){0,1} \d+/ ) ;
		next if ($e[1]=~/middle of (autumn|fall)/ ) ;
		($year) = ($e[1]=~/(\d+)/);
		 print $year. "-10-15". "\t". $_. "\n";	
	}
	
	if ($e[1]=~/(autumn|fall) of this year/ ) {
		next if ($e[1]=~/middle of (autumn|fall)(\s+\S+){0,1} \d+/ ) ;
		next if ($e[1]=~/middle of (autumn|fall)/ ) ;
		next if ($e[1]=~/(autumn|fall)(\s+\S+){0,1} \d+/ );
		($year) = ($f[3]=~/(\d{4})/);
		 print $year. "-10-15". "\t". $_. "\n";	
	}
	
	if ($e[1]=~/(autumn|fall) of last year/ ) {
		next if ($e[1]=~/middle of (autumn|fall)(\s+\S+){0,1} \d+/ ) ;
		next if ($e[1]=~/middle of (autumn|fall)/ ) ;
		next if ($e[1]=~/(autumn|fall)(\s+\S+){0,1} \d+/ );
		($year) = ($f[3]=~/(\d{4})/);
		$year=$year-1;
		 print $year. "-10-15". "\t". $_. "\n";	
	}
	
	if ($e[1]=~/middle of winter(\s+\S+){0,2} \d+/ ) {
		
		($year) = ($e[1]=~/(\d+)/);
		 print $year. "-01-15". "\t". $_. "\n";	
	
	}
	
	if ($e[1]=~/middle of winter/ ) {
		next if ($e[1]=~/middle of winter(\s+\S+){0,2} \d+/ ) ;
		($year) = ($f[3]=~/(\d{4})/);
		 print $year. "-01-15". "\t". $_. "\n";	
	
	}
	
	if ($e[1]=~/winter of this year/ ) {
		next if ($e[1]=~/middle of winter(\s+\S+){0,1} \d+/ ) ;
		next if ($e[1]=~/middle of winter/ ) ;
		next if ($e[1]=~/winter(\s+\S+){0,1} \d+/ );
		($year) = ($f[3]=~/(\d{4})/);
		 print $year. "-01-15". "\t". $_. "\n";		
	}

	if ($e[1]=~/winter of last year/ ) {
		next if ($e[1]=~/middle of winter(\s+\S+){0,1} \d+/ ) ;
		next if ($e[1]=~/middle of winter/ ) ;
		next if ($e[1]=~/winter(\s+\S+){0,1} \d+/ );
		($year) = ($f[3]=~/(\d{4})/);
		$year=$year-1;
		print $year. "-01-15". "\t". $_. "\n";		
	}


### end of spring 2013	
	if ($e[1]=~/end of spring(\s+\S+){0,2} \d+/ ) {
		($year) = ($e[1]=~/(\d+)/);
		 print $year. "-05-15". "\t". $_. "\n";
	}	
		
	if ($e[1]=~/end of summer(\s+\S+){0,2} \d+/ ) {
		($year) = ($e[1]=~/(\d+)/);
		 print $year. "-08-15". "\t". $_. "\n";	
	}
	
	if ($e[1]=~/end of (autumn|fall)(\s+\S+){0,2} \d+/ ) {
		($year) = ($e[1]=~/(\d+)/);
		 print $year. "-11-15". "\t". $_. "\n";	
	}
	if ($e[1]=~/end of winter(\s+\S+){0,2} \d+/ ) {
		($year) = ($e[1]=~/(\d+)/);
		 print $year. "-02-15". "\t". $_. "\n";	
	
	}

### late spring 	
	if ($e[1]=~/late spring/) {
		next if ($e[1]=~/late spring(\s+\S+){0,2} \d+/ );
		
		($year) = ($f[3]=~/(^\d{4})/);
		 print $year. "-05-01". "\t". $_. "\n";
	}
	
		
	if ($e[1]=~/late summer/ ) {
		next if ($e[1]=~/late summer(\s+\S+){0,2} \d+/ );
		($year) = ($f[3]=~/(\d{4})/);
		 print $year. "-08-01". "\t". $_. "\n";	
	}
	
	if ($e[1]=~/late (autumn|fall)/ ) {
		next if ($e[1]=~/late (autumn|fall)(\s+\S+){0,2} \d+/ );
		($year) = ($f[3]=~/(\d{4})/);
		 print $year. "-11-01". "\t". $_. "\n";	
	}
	if ($e[1]=~/late winter/ ) {
		next if ($e[1]=~/late winter(\s+\S+){0,2} \d+/ );
		($year) = ($f[3]=~/(\d{4})/);
		 print $year. "-02-01". "\t". $_. "\n";	
	
	}

## last spring
	if ($e[1]=~/last spring/) {
		
		($year) = ($f[3]=~/(^\d{4})/);
		$year=$year-1;
		 print $year. "-05-01". "\t". $_. "\n";
	}
	
		
	if ($e[1]=~/last summer/ ) {
		 
		($year) = ($f[3]=~/(\d{4})/);
		$year=$year-1;
		 print $year. "-08-01". "\t". $_. "\n";	
	}
	
	if ($e[1]=~/last (autumn|fall)/ ) {
		 
		($year) = ($f[3]=~/(\d{4})/);
		$year=$year-1;
		 print $year. "-11-01". "\t". $_. "\n";	
	}
	if ($e[1]=~/last winter/ ) {
		 
		($year) = ($f[3]=~/(\d{4})/);
		$year=$year-1;
		 print $year. "-02-01". "\t". $_. "\n";	
	
	}
### early spring  	
	if ($e[1]=~/early spring/ ) {
		next if ($e[1]=~/early spring(\s+\S+){0,2} \d+/ );
		($year) = ($f[3]=~/(\d{4})/);
		 print $year. "-03-31". "\t". $_. "\n";
	}	
		
	if ($e[1]=~/early summer/ ) {
		next if ($e[1]=~/early summer(\s+\S+){0,2} \d+/ );
		($year) = ($f[3]=~/(\d{4})/);
		 print $year. "-06-31". "\t". $_. "\n";	
	}
	
	if ($e[1]=~/early (autumn|fall)/ ) {
		next if ($e[1]=~/early (autumn|fall)(\s+\S+){0,2} \d+/ ) ;
		($year) = ($f[3]=~/(\d{4})/);
		 print $year. "-9-31". "\t". $_. "\n";	
	}
	if ($e[1]=~/early winter/ ) {
		next if ($e[1]=~/early winter(\s+\S+){0,2} \d+/ ) ;
		($year) = ($f[3]=~/(\d{4})/);
		 print $year. "-12-31". "\t". $_. "\n";	
	
	}
	
### middle of spring  
	if ($e[1]=~/(middle)?\s*(of)?\s*spring/ ) {
		next if ($e[1]=~/(middle)?\s*(of)?\s*spring(\s+\S+){0,2} \d+/ ) ;
		($year) = ($f[3]=~/(\d{4})/);
		 print $year. "-04-15". "\t". $_. "\n";
	}	
		
	if ($e[1]=~/(middle)?\s*(of)?\s*summer/ ) {
		next if ($e[1]=~/(middle)?\s*(of)?\s*summer(\s+\S+){0,2} \d+/ ) ;
		($year) = ($f[3]=~/(\d{4})/);
		 print $year. "-07-15". "\t". $_. "\n";	
		 
	}
	
	if ($e[1]=~/middle of (autumn|fall)/ ) {
	 	next if ($e[1]=~/(middle)?\s*(of)?\s*(autumn|fall)(\s+\S+){0,2} \d+/ ) ;
		($year) = ($f[3]=~/(\d{4})/);
		 print $year. "-10-15". "\t". $_. "\n";	
	}
	if ($e[1]=~/(middle)?\s*(of)?\s*winter/ ) {
		next if ($e[1]=~/(middle)?\s*(of)?\s*winter(\s+\S+){0,2} \d+/ ) ;
		($year) = ($f[3]=~/(\d{4})/);
		 print $year. "-01-15". "\t". $_. "\n";	
	
	}

### end of spring  
	if ($e[1]=~/(end)?\s*(of)?\s*spring/ ) {
		next if ($e[1]=~/end of spring(\s+\S+){0,2} \d+/ ) ;
		($year) = ($f[3]=~/(\d{4})/);
		 print $year. "-05-15". "\t". $_. "\n";
	}	
		
	if ($e[1]=~/(end)?\s*(of)?\s*summer/ ) {
		next if ($e[1]=~/end of summer(\s+\S+){0,2} \d+/ ) ;
		($year) = ($f[3]=~/(\d{4})/);
		 print $year. "-08-15". "\t". $_. "\n";	
	}
	
	if ($e[1]=~/end of (autumn|fall)/ ) {
		next if ($e[1]=~/end of (autumn|fall)(\s+\S+){0,2} \d+/ ) ;
		($year) = ($f[3]=~/(\d{4})/);
		 print $year. "-11-15". "\t". $_. "\n";	
	}
	if ($e[1]=~/(end)?\s*(of)?\s*winter/ ) {
		next if ($e[1]=~/end of winter(\s+\S+){0,2} \d+/ ) ;
		($year) = ($f[3]=~/(\d{4})/);
		 print $year. "-02-15". "\t". $_. "\n";	
	}


##late October 2008	
	
	
	if ($e[1]=~/(late|end of) (January|Jan|February|Feb|March|Mar|April|Apr|May|June|Jun|July|Jul|August|Aug|September|Sept|Sep|October|Oct|November|Nov|December|Dec)(\s+\S+){0,2} \d+/ ) {
		($year) = ($e[1]=~/(\d+)/);
		if ($e[1]=~/\bJanuary|Jan\b/) {$month ="01";}
		if ($e[1]=~/\bFebruary|Feb\b/) {$month ="02";}
		if ($e[1]=~/\bMarch|Mar\b/) {$month ="03";}
		if ($e[1]=~/\bApril|Apr\b/) {$month ="04";}
		if ($e[1]=~/\bMay\b/) {$month ="05";}
		if ($e[1]=~/\bJune|Jun\b/) {$month ="06";}
		if ($e[1]=~/\bJuly|Jul\b/) {$month ="07";}
		if ($e[1]=~/\bAugust|Aug\b/) {$month ="08";}
		if ($e[1]=~/\bSeptember|Sept\b/) {$month ="09";}
		if ($e[1]=~/\bOctober|Oct\b/) {$month ="10";}
		if ($e[1]=~/\bNovember|Nov\b/) {$month ="11";}
		if ($e[1]=~/\bDecember|Dec\b/) {$month ="12";}
		
		 print $year. "-". $month. "-25". "\t". $_. "\n";
	}
	
		
	if ($e[1]=~/(early|beginning of|start) (January|Jan|February|Feb|March|Mar|April|Apr|May|June|Jun|July|Jul|August|Aug|September|Sept|Sep|October|Oct|November|Nov|December|Dec)(\s+\S+){0,2} \d+/ ) {
		($year) = ($e[1]=~/(\d+)/);
		if ($e[1]=~/\bJanuary|Jan\b/) {$month ="01";}
		if ($e[1]=~/\bFebruary|Feb\b/) {$month ="02";}
		if ($e[1]=~/\bMarch|Mar\b/) {$month ="03";}
		if ($e[1]=~/\bApril|Apr\b/) {$month ="04";}
		if ($e[1]=~/\bMay\b/) {$month ="05";}
		if ($e[1]=~/\bJune|Jun\b/) {$month ="06";}
		if ($e[1]=~/\bJuly|Jul\b/) {$month ="07";}
		if ($e[1]=~/\bAugust|Aug\b/) {$month ="08";}
		if ($e[1]=~/\bSeptember|Sept\b/) {$month ="09";}
		if ($e[1]=~/\bOctober|Oct\b/) {$month ="10";}
		if ($e[1]=~/\bNovember|Nov\b/) {$month ="11";}
		if ($e[1]=~/\bDecember|Dec\b/) {$month ="12";}
		
		 print $year. "-". $month. "-05"."\t". $_.  "\n";
	}
	
	if ($e[1]=~/middle of (January|Jan|February|Feb|March|Mar|April|Apr|May|June|Jun|July|Jul|August|Aug|September|Sept|Sep|October|Oct|November|Nov|December|Dec)(\s+\S+){0,2} \d+/ ) {
		($year) = ($e[1]=~/(\d+)/);
		if ($e[1]=~/\bJanuary|Jan\b/) {$month ="01";}
		if ($e[1]=~/\bFebruary|Feb\b/) {$month ="02";}
		if ($e[1]=~/\bMarch|Mar\b/) {$month ="03";}
		if ($e[1]=~/\bApril|Apr\b/) {$month ="04";}
		if ($e[1]=~/\bMay\b/) {$month ="05";}
		if ($e[1]=~/\bJune|Jun\b/) {$month ="06";}
		if ($e[1]=~/\bJuly|Jul\b/) {$month ="07";}
		if ($e[1]=~/\bAugust|Aug\b/) {$month ="08";}
		if ($e[1]=~/\bSeptember|Sept\b/) {$month ="09";}
		if ($e[1]=~/\bOctober|Oct\b/) {$month ="10";}
		if ($e[1]=~/\bNovember|Nov\b/) {$month ="11";}
		if ($e[1]=~/\bDecember|Dec\b/) {$month ="12";}
		
		 print $year. "-". $month.  "-15"."\t". $_.  "\n";
	}
	
	
 
	
##late October 2012
	
	
	if ($e[1]=~/(late|end of) (January|Jan|February|Feb|March|Mar|April|Apr|May|June|Jun|July|Jul|August|Aug|September|Sept|Sep|October|Oct|November|Nov|December|Dec)/ ) {
		next if ($e[1]=~/(late|end of) (January|Jan|February|Feb|March|Mar|April|Apr|May|June|Jun|July|Jul|August|Aug|September|Sept|Sep|October|Oct|November|Nov|December|Dec)(\s+\S+){0,2} \d+/ ); 

		($year) = ($f[3]=~/(\d{4})/);
		if ($e[1]=~/\bJanuary|Jan\b/) {$month ="01";}
		if ($e[1]=~/\bFebruary|Feb\b/) {$month ="02";}
		if ($e[1]=~/\bMarch|Mar\b/) {$month ="03";}
		if ($e[1]=~/\bApril|Apr\b/) {$month ="04";}
		if ($e[1]=~/\bMay\b/) {$month ="05";}
		if ($e[1]=~/\bJune|Jun\b/) {$month ="06";}
		if ($e[1]=~/\bJuly|Jul\b/) {$month ="07";}
		if ($e[1]=~/\bAugust|Aug\b/) {$month ="08";}
		if ($e[1]=~/\bSeptember|Sept\b/) {$month ="09";}
		if ($e[1]=~/\bOctober|Oct\b/) {$month ="10";}
		if ($e[1]=~/\bNovember|Nov\b/) {$month ="11";}
		if ($e[1]=~/\bDecember|Dec\b/) {$month ="12";}
		
		 print $year. "-". $month. "-25". "\t". $_. "\n";
	}
	
		
	if ($e[1]=~/(early|beginning of) (January|Jan|February|Feb|March|Mar|April|Apr|May|June|Jun|July|Jul|August|Aug|September|Sept|Sep|October|Oct|November|Nov|December|Dec)/ ) {
		next if ($e[1]=~/(early|beginning of) (January|Jan|February|Feb|March|Mar|April|Apr|May|June|Jun|July|Jul|August|Aug|September|Sept|Sep|October|Oct|November|Nov|December|Dec)(\s+\S+){0,2} \d+/ ) ;

		($year) = ($f[3]=~/(\d{4})/);
		if ($e[1]=~/\bJanuary|Jan\b/) {$month ="01";}
		if ($e[1]=~/\bFebruary|Feb\b/) {$month ="02";}
		if ($e[1]=~/\bMarch|Mar\b/) {$month ="03";}
		if ($e[1]=~/\bApril|Apr\b/) {$month ="04";}
		if ($e[1]=~/\bMay\b/) {$month ="05";}
		if ($e[1]=~/\bJune|Jun\b/) {$month ="06";}
		if ($e[1]=~/\bJuly|Jul\b/) {$month ="07";}
		if ($e[1]=~/\bAugust|Aug\b/) {$month ="08";}
		if ($e[1]=~/\bSeptember|Sept\b/) {$month ="09";}
		if ($e[1]=~/\bOctober|Oct\b/) {$month ="10";}
		if ($e[1]=~/\bNovember|Nov\b/) {$month ="11";}
		if ($e[1]=~/\bDecember|Dec\b/) {$month ="12";}
		
		 print $year. "-". $month. "-05"."\t". $_.  "\n";
	}
	
	if ($e[1]=~/middle of (January|Jan|February|Feb|March|Mar|April|Apr|May|June|Jun|July|Jul|August|Aug|September|Sept|Sep|October|Oct|November|Nov|December|Dec)/ ) {
		next if ($e[1]=~/(middle)?\s*(of)?(January|Jan|February|Feb|March|Mar|April|Apr|May|June|Jun|July|Jul|August|Aug|September|Sept|Sep|October|Oct|November|Nov|December|Dec)(\s+\S+){0,2} \d+/ ) ;
	
		($year) = ($f[3]=~/(\d{4})/);
		if ($e[1]=~/\bJanuary|Jan\b/) {$month ="01";}
		if ($e[1]=~/\bFebruary|Feb\b/) {$month ="02";}
		if ($e[1]=~/\bMarch|Mar\b/) {$month ="03";}
		if ($e[1]=~/\bApril|Apr\b/) {$month ="04";}
		if ($e[1]=~/\bMay\b/) {$month ="05";}
		if ($e[1]=~/\bJune|Jun\b/) {$month ="06";}
		if ($e[1]=~/\bJuly|Jul\b/) {$month ="07";}
		if ($e[1]=~/\bAugust|Aug\b/) {$month ="08";}
		if ($e[1]=~/\bSeptember|Sept\b/) {$month ="09";}
		if ($e[1]=~/\bOctober|Oct\b/) {$month ="10";}
		if ($e[1]=~/\bNovember|Nov\b/) {$month ="11";}
		if ($e[1]=~/\bDecember|Dec\b/) {$month ="12";}
		
		 print $year. "-". $month.  "-15"."\t". $_.  "\n";
	}
	
## October 2012

	if ($e[1]=~/(January|Jan|February|Feb|March|Mar|April|Apr|May|June|Jun|July|Jul|August|Aug|September|Sept|Sep|October|Oct|November|Nov|December|Dec)/ ) {
		next if ($e[1]=~/(late|end of|middile of|early|beginning) (January|Jan|February|Feb|March|Mar|April|Apr|May|June|Jun|July|Jul|August|Aug|September|Sept|Sep|October|Oct|November|Nov|December|Dec)(\s+\S+){0,2} \d+/ ); 
		next if ($e[1]=~/(late|end of|middile of|early|beginning) (January|Jan|February|Feb|March|Mar|April|Apr|May|June|Jun|July|Jul|August|Aug|September|Sept|Sep|October|Oct|November|Nov|December|Dec)/ ) ;
	
		($year) = ($f[3]=~/(\d{4})/);
		if ($e[1]=~/\bJanuary|Jan\b/) {$month ="01";}
		if ($e[1]=~/\bFebruary|Feb\b/) {$month ="02";}
		if ($e[1]=~/\bMarch|Mar\b/) {$month ="03";}
		if ($e[1]=~/\bApril|Apr\b/) {$month ="04";}
		if ($e[1]=~/\bMay\b/) {$month ="05";}
		if ($e[1]=~/\bJune|Jun\b/) {$month ="06";}
		if ($e[1]=~/\bJuly|Jul\b/) {$month ="07";}
		if ($e[1]=~/\bAugust|Aug\b/) {$month ="08";}
		if ($e[1]=~/\bSeptember|Sept\b/) {$month ="09";}
		if ($e[1]=~/\bOctober|Oct\b/) {$month ="10";}
		if ($e[1]=~/\bNovember|Nov\b/) {$month ="11";}
		if ($e[1]=~/\bDecember|Dec\b/) {$month ="12";}
		
		 print $year. "-". $month. "-15". "\t". $_. "\n";
	}
	
	if ($e[1]=~/(January|Jan|February|Feb|March|Mar|April|Apr|May|June|Jun|July|Jul|August|Aug|September|Sept|Sep|October|Oct|November|Nov|December|Dec) of this year/ ) {
		next if ($e[1]=~/(late|end of|middile of|early|beginning) (January|Jan|February|Feb|March|Mar|April|Apr|May|June|Jun|July|Jul|August|Aug|September|Sept|Sep|October|Oct|November|Nov|December|Dec)(\s+\S+){0,2} \d+/ ); 
		next if ($e[1]=~/(late|end of|middile of|early|beginning) (January|Jan|February|Feb|March|Mar|April|Apr|May|June|Jun|July|Jul|August|Aug|September|Sept|Sep|October|Oct|November|Nov|December|Dec)/ ) ;
	
		($year) = ($f[3]=~/(\d{4})/);
		if ($e[1]=~/\bJanuary|Jan\b/) {$month ="01";}
		if ($e[1]=~/\bFebruary|Feb\b/) {$month ="02";}
		if ($e[1]=~/\bMarch|Mar\b/) {$month ="03";}
		if ($e[1]=~/\bApril|Apr\b/) {$month ="04";}
		if ($e[1]=~/\bMay\b/) {$month ="05";}
		if ($e[1]=~/\bJune|Jun\b/) {$month ="06";}
		if ($e[1]=~/\bJuly|Jul\b/) {$month ="07";}
		if ($e[1]=~/\bAugust|Aug\b/) {$month ="08";}
		if ($e[1]=~/\bSeptember|Sept\b/) {$month ="09";}
		if ($e[1]=~/\bOctober|Oct\b/) {$month ="10";}
		if ($e[1]=~/\bNovember|Nov\b/) {$month ="11";}
		if ($e[1]=~/\bDecember|Dec\b/) {$month ="12";}
		
		 print $year. "-". $month. "-15". "\t". $_. "\n";
	}
	
			
	 if ($e[1]=~/(January|Jan|February|Feb|March|Mar|April|Apr|May|June|Jun|July|Jul|August|Aug|September|Sept|Sep|October|Oct|November|Nov|December|Dec) of last year/ ) {
		next if ($e[1]=~/(late|end of|middile of|early|beginning) (January|Jan|February|Feb|March|Mar|April|Apr|May|June|Jun|July|Jul|August|Aug|September|Sept|Sep|October|Oct|November|Nov|December|Dec)(\s+\S+){0,2} \d+/ ); 
		next if ($e[1]=~/(late|end of|middile of|early|beginning) (January|Jan|February|Feb|March|Mar|April|Apr|May|June|Jun|July|Jul|August|Aug|September|Sept|Sep|October|Oct|November|Nov|December|Dec)/ ) ;
	
		($year) = ($f[3]=~/(\d{4})/);
		if ($e[1]=~/\bJanuary|Jan\b/) {$month ="01";}
		if ($e[1]=~/\bFebruary|Feb\b/) {$month ="02";}
		if ($e[1]=~/\bMarch|Mar\b/) {$month ="03";}
		if ($e[1]=~/\bApril|Apr\b/) {$month ="04";}
		if ($e[1]=~/\bMay\b/) {$month ="05";}
		if ($e[1]=~/\bJune|Jun\b/) {$month ="06";}
		if ($e[1]=~/\bJuly|Jul\b/) {$month ="07";}
		if ($e[1]=~/\bAugust|Aug\b/) {$month ="08";}
		if ($e[1]=~/\bSeptember|Sept\b/) {$month ="09";}
		if ($e[1]=~/\bOctober|Oct\b/) {$month ="10";}
		if ($e[1]=~/\bNovember|Nov\b/) {$month ="11";}
		if ($e[1]=~/\bDecember|Dec\b/) {$month ="12";}
		$year=$year-1;
		 print $year. "-". $month. "-15". "\t". $_. "\n";
	}
	
	
 	if ($e[1]=~/(January|Jan|February|Feb|March|Mar|April|Apr|May|June|Jun|July|Jul|August|Aug|September|Sept|Sep|October|Oct|November|Nov|December|Dec)(\s+\S+){0,2} \d+/ ) {
		next if ($e[1]=~/(late|end of|middile of|early|beginning) (January|Jan|February|Feb|March|Mar|April|Apr|May|June|Jun|July|Jul|August|Aug|September|Sept|Sep|October|Oct|November|Nov|December|Dec)(\s+\S+){0,2} \d+/ ); 
		next if ($e[1]=~/(late|end of|middile of|early|beginning) (January|Jan|February|Feb|March|Mar|April|Apr|May|June|Jun|July|Jul|August|Aug|September|Sept|Sep|October|Oct|November|Nov|December|Dec)/ ) ;
	
		($year) = ($e[1]=~/(\d+)/);
		if ($e[1]=~/\bJanuary|Jan\b/) {$month ="01";}
		if ($e[1]=~/\bFebruary|Feb\b/) {$month ="02";}
		if ($e[1]=~/\bMarch|Mar\b/) {$month ="03";}
		if ($e[1]=~/\bApril|Apr\b/) {$month ="04";}
		if ($e[1]=~/\bMay\b/) {$month ="05";}
		if ($e[1]=~/\bJune|Jun\b/) {$month ="06";}
		if ($e[1]=~/\bJuly|Jul\b/) {$month ="07";}
		if ($e[1]=~/\bAugust|Aug\b/) {$month ="08";}
		if ($e[1]=~/\bSeptember|Sept\b/) {$month ="09";}
		if ($e[1]=~/\bOctober|Oct\b/) {$month ="10";}
		if ($e[1]=~/\bNovember|Nov\b/) {$month ="11";}
		if ($e[1]=~/\bDecember|Dec\b/) {$month ="12";}
		
		 print $year. "-". $month. "-15". "\t". $_. "\n";
	}
	
	
 
	
}


#early October 2008
# end of July
# end of 2014
# fall 1998
# fall of 2002
# late April
# late April 2016
# 5/2011

