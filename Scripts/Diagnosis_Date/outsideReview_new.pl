$dir=shift;   
opendir( DIR, $dir );
my @files = readdir(DIR);

#closedir(DIR);
foreach my $infile (@files) {
	next if ($infile=~/\.$/);
	next if ($infile=~/\..$/);
	if (defined($infile)) {
		open (IFILE, "<$dir/$infile") or die "Can't open $infile: $!";
		while (<IFILE>) {
   		 
###############filter "review of outside specimen" from all path report, date format like:(HR05-35220, 07/12/2005)
###############split according to date, find lung site related chunk, and then index the chunk
      		next if ($_!~/Review of Outside/i) ;    	
     	 #next if ($_=~/\; (\d+\/\d+\/\d+)\)/);
     	   
     	    if ($_=~/DIAGNOS(.)*\\par\s*\\par\s*\\par/) { 
        	 
        		($diagSec) =($_ =~/(DIAGNOS.*)/);
        	 	
        		@diag =split(/\\par\s*\\par\s*\\par/, $diagSec);
        		$diag[0]=~s/\\par\s*//g;
        		if($diag[0]=~/FNA|lymph node|subcarinal|mediastinal|parotidectomy|Retroperitoneum|chest|interlobar|SUPRACLAVICULAR|trachea|Bronch|lung|lobe|lobar|Needle|sputum|Pleural|pulmonary/i){
					
					$t{$infile}= 1;
        			
        		}
        	}
        	
##\par   \par
			if ($_=~/DIAGNOS(.)*\\par\s*\\par\s*/) { 
        	 	next if ($_=~/DIAGNOS(.)*\\par\s*\\par\s*\\par/) ;
        		($diagSec) =($_ =~/(DIAGNOS.*)/);
        	 	
        		@diag =split(/\\par\s*\\par\s*/, $diagSec);
        		$diag[0]=~s/\\par\s*//g;
        		if($diag[0]=~/FNA|lymph node|subcarinal|mediastinal|parotidectomy|Retroperitoneum|chest|interlobar|SUPRACLAVICULAR|trachea|Bronch|lung|lobe|lobar|Needle|sputum|Pleural|pulmonary/i){
					
					$t{$infile}= 1;
        			
        		}
        	}
#####no need to chunk paragraph         
          elsif ($_!~/DIAGNOS(.)*\\par\s*\\par\s*\\par/ || $_!~/DIAGNOS(.)*\\par\s*\\par\s*/)  {
         
         		($diag) =($_ =~/((DIAGNOS).*)/);
         		$diag=~s/\\par\s*//g;
         		if($diag=~/FNA|lymph node|subcarinal|mediastinal|parotidectomy|Retroperitoneum|chest|interlobar|SUPRACLAVICULAR|trachea|Bronch|lung|lobe|lobar|Needle|sputum|Pleural|pulmonary/i){
					$t{$infile}= 1;
				}
         }
         
		
	close IFILE;
	
 	}
}
}


while (<>) {
	chomp;
			next if ($_=~/Histology_Diagnosis/);
			next if ($_=~/\b(NOT DIAGNOSTIC OF MALIGNANCY|worrisome|bladder|prostate|thyroid|glossectomy|lymphoma|prostat|brain|breast|colon|ear|tongue|head|papilloma|esophag)\b/i);
   
			@ee=split/\t/;
    		@ff=split(/\_/, $ee[0]);
    		@gg=split(/\"/, $ee[3]);   
####################files split, match to those with lung site  		
    		if ($ee[0] =~/txt\_\d+/) {
		#print $e[0]. "\n";
				@meta =split (/\_\d+$/, $ee[0]);
		#	print  $meta[0]. "\n";
				if ( exists ( $t{ $meta[0]})) { 
				#print $ff[0]. "\t".$meta[0]. "\t". $gg[1]. "\n";	
	  				if ($ee[9] =~/Diagnosis_Date/) { 
	  				
    						if ( $_=~/\;\s*\d+\/\d+\/\d+\)/ || $_=~/\,\s*\d+\/\d+\/\d+\)/ || $_=~/\;\s*\d+\-\d+\-\d+\)/ || $_=~/\,\s*\d+\-\d+\-\d+\)/) {	
    							$nn{$ff[0]}{$ee[0]}{$gg[1]}=1;    	
    							#print $ff[0]. "\t".$ee[0]. "\t". $gg[1]. "\n";		
							}				
		 			}
		
					if (  $_=~/Histology/  ) {
 						 	
    		 			@eee=split/\t/;
    		 			@fff=split(/\_/, $eee[0]);
    					$ll{$fff[0]}{$ee[0]}=1;
					}
			# 	
 				}
			}
# 			
####################files not split			
			# if ($ee[0] =~/txt$/) {
# 				if ( exists ( $t{ $ee[0]})) { 
# 				#print $ee[0]. "\n";
# 					if ($ee[9] =~/Diagnosis_Date/) {
#     					$nn{$ff[0]}{$ee[0]}{$gg[1]}=1;
# 					}
# 					if (  $_=~/Histology/  ) {
#  	 					$ll{$ff[0]}{$ee[0]}=1;
# 						#print $ff[0]. "\t". $ee[0].   "\n";
# 						 
# 					}
# 				
# 				}
# 			
# 			}

}


#########print all patient mcn and associated dates for outside specimen.

@mcnAdd=(keys %ll);

foreach $mcnAdd (@mcnAdd){
	@docAdd =  keys %{ $ll{ $mcnAdd } } ;
	foreach $docAdd (@docAdd) {
	#print $mcnAdd. "\t". $docAdd. "\n";
		 
		@dateAdd =  keys %{ $nn{ $mcnAdd } { $docAdd } } ;
		@hisAdd =  keys %{ $ll{ $mcnAdd } { $docAdd } } ;
		#print $dateAdd[0].   "\n";
		#next if ($hisAdd[0] !~/\w+/);
		
	 	#print $mcnAdd. "\t". $docAdd. "\t". $hisAdd[0]. "\n";
		#@dateAdd = sort(@dateAdd);
		foreach $dateAdd (@dateAdd) {
		#next if ($dateAdd[0] eq "") ;
			print $mcnAdd. "\t". $dateAdd. "\n";
		}
	
	}
	
}




		