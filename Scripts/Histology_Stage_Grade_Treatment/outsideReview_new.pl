while (<>) {
	chomp;
	
	next if ($_=~/\b(Pancreas|NOT DIAGNOSTIC OF MALIGNANCY|worrisome|bladder|prostate|thyroid|glossectomy|lymphoma|prostat|brain|breast|colon|ear|tongue|head|neck|papilloma|esophag)\b/i);
  
  ####
  	#next if ($_=~/Negative for malignan/i);
  	#next if ($_=~/Histology_Diagnosis/);
  	if($_=~/chest|Retroperitoneum|interlobar|SUPRACLAVICULAR|trachea|Bronchus|lung|lobe|Needle|sputum|bronchi|Pleura/i){
		#if ($_=~/review of outside/i) {
		$date="";
		@date="";
		if ( ($_=~/Histology/ || $_=~/Positive for malignancy/i ) && ($_=~/\d+\/\d+\/\d+/) ) {
			$_=~s/\-/\//g;
		
			($date) = ($_=~/\;\s*(\d+\/\d+\/\d+)\)/); push (@date, $date); 
			($date) = ($_=~/\,\s*(\d+\/\d+\/\d+)\)/); push (@date, $date);
		
			 
			@e=split/\t/;
			@f=split(/\_/, $e[0]);
			 
	
			@g=split(/\//, $date);
	 
	#if ($g[0]<10) {$g[0]="0".$g[0];}
	#if ($g[1]<10) {$g[1]="0".$g[1];}
	#$diagDate = $g[2]. $g[0]. $g[1];
	
			#$p{$f[0]} = 1;
			
			$t{$f[0]}{$f[1]} = 1;
			
			
			#if ($e[9] !~ /Diagnosis/) {
				
			#}
			foreach $date (@date) {
    						 	
    			next if ($date eq "");
    			
    			$m{$f[0]}{$e[0]}{$date}=1;
				#print $f[0]. "\t". $date.  "\t". $_. "\n";
			}
		}
		
		elsif ( $_=~/\;\s*(\d+\/\d+\/\d+)\)/ || $_=~/\,\s*\d+\/\d+\/\d+\)/ ) {
			@ee=split/\t/;
    		@ff=split(/\_/, $ee[0]);				 	
    		if ($ee[7] =~/Diagnosis_Date/) {
    			$nn{$ff[0]}{$ee[0]}{$ee[1]}=1;
    			#$n{$f[0]}=1;
				#print $ff[0]. "\t". $ee[0].  "\t". $ee[1]. "\t". $_. "\n";
			}
		
		}
		
		
		elsif ( $_!~/\d+\/\d+\/\d+/  && $_=~/Histology/) {
 						 	
    		 	@eee=split/\t/;
    		 	@fff=split(/\_/, $eee[0]);
    			$ll{$fff[0]}{$eee[0]}{$eee[1]}=1;
    			#$n{$f[0]}=1;
				#print $fff[0]. "\t". $eee[0].  "\t". $eee[1]. "\t". $_.  "\n";
			 
		
		}
		
		
		
		}
	#}
}

@mcn=(keys %m);

foreach $mcn (@mcn){
	@doc =  keys %{ $m{ $mcn } } ;
	foreach $doc (@doc) {
		@date =  keys %{ $m{ $mcn } { $doc } } ;
		@date = sort(@date);
		foreach $date (@date) {
			#print $mcn. "\t". $date. "\n";
		}
	}
}

 

@mcnAdd=(keys %ll);

foreach $mcnAdd (@mcnAdd){
	@docAdd =  keys %{ $ll{ $mcnAdd } } ;
	foreach $docAdd (@docAdd) {
	#print $mcnAdd. "\t". $docAdd. "\n";
		@dateAdd =  keys %{ $nn{ $mcnAdd } { $docAdd } } ;
		@hisAdd =  keys %{ $ll{ $mcnAdd } { $docAdd } } ;
		print $mcnAdd. "\t". $dateAdd. "\t". $hisAdd[0]. "\n";
		next if ($hisAdd[0] eq "") ;
		@dateAdd = sort(@dateAdd);
		foreach $dateAdd (@dateAdd) {
			#print $mcnAdd. "\t". $dateAdd. "\n";
		}
	}
}




		