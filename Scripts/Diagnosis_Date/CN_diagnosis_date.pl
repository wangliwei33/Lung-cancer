##in total, 853 patients with diagnosis dates from CN

#The patient underwent left parietal craniotomy on March 18, 1999, performed by Drs. Michael Partington and 
#Scott Marston again at the Regions Hospital in St. Paul. From the surgical report, Dr. Partington elected to 
#remove the largest part and all of the cystic area visible. Pathology report revealed poorly differentiated carcinoma. 

while (<>) {
	chomp;
	@e=split/\t/;
	@f=split(/\-/, $e[0]);
	@g=split(/\"/, $e[13]);
 	
	@h=split(/\T/, $f[3]);
	$cnYear=substr($h[0], 0,4);
	@day="";
	@startDate="";
	@stopDate="";
	$startDate="";
	$stopDate="";
	@text = split(/\"/, $g[1]);
	$text[1]=~s/\\/ /g;
	$text[1]=~s/\+/ /g;
	$text[1]=~s/\(//g;
	$text[1]=~s/\)//g;
	
	next if ($_=~/Negated/);
	
 	if ($_=~/Diagnosis_Cancer|Diagnosis_Malignancy|Histology|Examination|Diagnosis_Malignancy|Symptom/ ){
 	next if ($e[13]=~/renal|kidney|liver|hepatic|thyroid|craniotomy|brain|skin|rectal|rectum/i);
 	#next if ($_!~/Retroperitoneum|interlobar|SUPRACLAVICULAR|trachea|Bronchus|lung|lobe|Needle|sputum|bronchial|Pleural|chest|FNA/i);
   			if ($g[1]=~/\b(January|Jan|February|Feb|March|Mar|April|Apr|May|June|Jun|July|Jul|August|Aug|September|Sept|Sep|October|Oct|November|Nov|December|Dec)\b/i ){
				#print $_. "\n";
					($date) = ($g[1] =~/\b((early|end|late|middle|beginning)?(\d+)?\w{0,2}\s*(\s+\S+){0,2}\s*(January|Jan|February|Feb|March|Mar|April|Apr|May|June|Jun|July|Jul|August|Aug|September|Sept|Sep|October|Oct|November|Nov|December|Dec)(\W)?\s*(of)?\s*(this|last)?\s*(year)?(\s+\S+){0,2}\s*(\d+)?(\w{0,2})?(\W)?\s*(\d+)?)(\W)?\b/i); 		 
	#print $1. "\n";
	
	
		#($date) = ($g[1] =~/\b((January|Jan|February|Feb|March|Mar|April|Apr|May|June|Jun|July|Jul|August|Aug|September|Sept|Sep|October|Oct|November|Nov|December|Dec)(\W)?(\s+\S+){0,2}\s*(\d+)?(\w{0,2})?(\W)?\s*(\d+)?)(\W)?\b/i); 		 
	#print $1. "\n";
				($date) = ($1);
				#($startDate) = ($g[1] =~/(start|(re)?initiat|begin|began)\w{0,4}(\s+\S+){0,10} (\d+\/\d+\/\d+)/i); 	
	
	 			next if ($date eq "");
				print $e[0]. "\t". $date. "\t". $g[1]. "\n";
				
				
				
###4/2015; 55 patients			  
			  
		}
		
		if ($g[1] =~/\d+(\/|\-)\d+/ ) {

#############################################################
#######The plan is for the patient to begin Melphalan, single day as an outpatient on 6/10/2017.
#############################################################		
			 
			 
				($date) = ($g[1] =~/(\d+(\/|\-)\d+((\/|\-)\d+)?)/); 
			# print $_. "\t". $date. "\n";
	 			next if ($date eq "");
	 			 
#####2/4; 9/03;10/10? hard to be normalized...
		
				@sep=split(/\/|\-/, $date);
				$sep[1]=~s/^0//g;
				
				
				
				if (@sep==2 &&  $sep[1] <13 && $g[1]!~/\d+(\/|\-)\d+((\/|\-)\d+)? pack/i && $g[1]!~/grade(\s+\S+){0,3} \d+(\/|\-)\d+((\/|\-)\d+)?/i ) {
				#	next if ($g[1]=~/\d+(\/|\-)\d+((\/|\-)\d+)? pack/i );
					#next if ($g[1]=~/grade(\s+\S+){0,3} \d+(\/|\-)\d+((\/|\-)\d+)?/i );
					print $e[0]. "\t".  $date. "\t". $g[1]."\n";
				 
				#	$inf = $cnYear. "/". $sep[1]. "/". $sep[0]. "\n";
				 

			  }
###4/2015		  
			  if (@sep==2 &&  $sep[1] > 96) {
				
				#print $print $f[1]. "\t". $e[9]. "\t". $date. "\n";
					$inf = $sep[1]. "/". $sep[0]. "/". "15". "\n";
					print  $e[0]. "\t". $inf. "\t". $g[1]."\n";

			  }
			  
			  if (@sep==3){ 
			  	print $e[0]. "\t".  $date. "\t". $g[1]."\n";
			 
			  }
			  
			  else { 
			   print $e[0]. "\t".  $date. "\t". $g[1]."\n";
			  }
				
		}	
##in 2007		
		
		
######to be normalized with MedTime   #716 patients		
######TODO: early July
		if ($g[1]=~/(January|Jan|February|Feb|March|Mar|April|Apr|May|June|Jun|July|Jul|August|Aug|September|Sept|Sep|October|Oct|November|Nov|December|Dec)\s*(\s+\S+){0,2}\s*\d+(\w{0,2})?(\W)?\s*(\d+)?\W?/i ){
	#if ($_=~/August/) {
		
			#print $_. "\n";
				($date) = ($g[1] =~/((January|Jan|February|Feb|March|Mar|April|Apr|May|June|Jun|July|Jul|August|Aug|September|Sept|Sep|October|Oct|November|Nov|December|Dec)\s*(\s+\S+){0,2}\s*\d+(\w{0,2})?(\W)?\s*(\d+)?)\W?/i); 	
			#	($date) = ($g[1] =~/\b(early|end|late|middle|beginning|\d+(\w{0,2})?\s*(of)?\s*(January|Jan|February|Feb|March|Mar|April|Apr|May|June|Jun|July|Jul|August|Aug|September|Sept|Sep|October|Oct|November|Nov|December|Dec)(\W)?\s*(of)?\s*(this|last)?\s*(year)?(\s+\S+){0,2}\s*(\d+)?(\w{0,2})?(\W)?\s*(\d+)?)(\W)?\b/i); 		 
			
				 
				($date) = ($1);
				#($startDate) = ($g[1] =~/(start|(re)?initiat|begin|began)\w{0,4}(\s+\S+){0,10} (\d+\/\d+\/\d+)/i); 	
	
	 			next if ($date eq "");
				print $e[0]. "\t". $date. "\t". $g[1]. "\n";
				
				
				
###4/2015; 55 patients			  
			  
		}
		
		
	
		
		
		
		if ($g[1]=~/spring|summer|fall|autumn|winter(\s+\S+){0,6} \d+/i ){
				($date) = ($g[1] =~/((spring|summer|fall|autumn|winter)(\s+\S+){0,6} \d+)/i); 	

				 
				($date) = ($1);
				#($startDate) = ($g[1] =~/(start|(re)?initiat|begin|began)\w{0,4}(\s+\S+){0,10} (\d+\/\d+\/\d+)/i); 	
	
	 			next if ($1 eq "");
				print $e[0]. "\t". $date. "\t". $g[1]."\n";
		}
		
		if ($g[1]=~/ \d{4}/ ){
	 			next if ($g[1]=~/(January|Jan|February|Feb|March|Mar|April|Apr|May|June|Jun|July|Jul|August|Aug|September|Sept|Sep|October|Oct|November|Nov|December|Dec)\s*(\s+\S+){0,2}\s*\d+(\w{0,2})?(\W)?\s*(\d+)?\W?/i );
				next if ($g[1] =~/(\d+(\/|\-)\d+((\/|\-)\d+)?)/);
				next if ($g[1]=~/spring|summer|fall|autumn|winter(\s+\S+){0,6} \d+/i );
				
				($date) = ($g[1] =~/((early)?(end of)?(late)?(middle of)?\s*\d{4})/); 	
				
				
#print $date. "#####". $_.  "\n";
				 
				($date) = ($1);
				#($startDate) = ($g[1] =~/(start|(re)?initiat|begin|began)\w{0,4}(\s+\S+){0,10} (\d+\/\d+\/\d+)/i); 	
	
	 			next if ($date eq "");	 			
				print $e[0]. "\t". $date. "\t". $g[1]."\n";
		}
	 
		if ($g[1]=~/early|end|late|middle(\s+\S+){0,6} (spring|summer|fall|autumn|winter)/i ){
				($date) = ($g[1] =~/((early|end|late|middle)(\s+\S+){0,6} (spring|summer|fall|autumn|winter)(\s+\S+){0,6}\s*(\d+)?)/i); 	

				 
				($date) = ($1);
				#($startDate) = ($g[1] =~/(start|(re)?initiat|begin|began)\w{0,4}(\s+\S+){0,10} (\d+\/\d+\/\d+)/i); 	
	
	 			next if ($1 eq "");
				print $e[0]. "\t". $date. "\t". $g[1]."\n";
		}
		
		elsif ($g[1]=~/this year|last year/i ){
				($date) = ($g[1] =~/(this year|last year)/i); 	

				 
				($date) = ($1);
				#($startDate) = ($g[1] =~/(start|(re)?initiat|begin|began)\w{0,4}(\s+\S+){0,10} (\d+\/\d+\/\d+)/i); 	
	
	 			next if ($1 eq "");
				print $e[0]. "\t". $date. "\t". $g[1]."\n";
		}
		

	}
	

}


####not using coreference...



