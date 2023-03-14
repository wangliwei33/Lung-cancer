$dir=shift;

#print $dir. "\n";
#$outputdir=shift;

# @files=`ls $dir`;
# chomp(@files);
# print @files. "\n";
# foreach $f (@files){
# 	print $f. "\n";
#   	open(FILE, "$dir/$f");
 

opendir( DIR, $dir );

my @files = readdir(DIR);

#closedir(DIR);
foreach my $infile (@files) {
 
	next if ($infile=~/\.$/);
	next if ($infile=~/\..$/);
	if (defined($infile)) {
		open (IFILE, "<$dir/$infile") or die "Can't open $infile: $!";
		while (<IFILE>) {
       		chomp;
     	 	next if ($_=~/Review of Outside/i) ;    	
     	 
     	   
 			 if ($_=~/DIAGNOS(.)*\\par\s*\\par\s*\\par/) { 
        	 
        		($diagSec) =($_ =~/(DIAGNOS.*)/);
        	 
        		@diag =split(/\\par\s*\\par\s*\\par/, $diagSec);
        		$diag[0]=~s/\\par\s*//g;
        		if($diag[0]=~/FNA|lymph node|subcarinal|mediastinal|parotidectomy|Retroperitoneum|chest|interlobar|SUPRACLAVICULAR|trachea|Bronch|lung|lobe|lobar|Needle|sputum|Pleural|pulmonary/i){
					#print $infile. "\n";
					$t{$infile}= 1;
        		}
        	}
#####no need to chunk paragraph         
          elsif ($_!~/DIAGNOS(.)*\\par\s*\\par\s*\\par/)  {
         
         		($diag) =($_ =~/((DIAGNOS).*)/);
         		$diag=~s/\\par\s*//g;
         		if($diag=~/FNA|lymph node|subcarinal|mediastinal|parotidectomy|Retroperitoneum|chest|interlobar|SUPRACLAVICULAR|trachea|Bronch|lung|lobe|lobar|Needle|sputum|Pleural|pulmonary/i){
					#print $infile. "\t". $diag. "\n";
					$t{$infile}= 1;
				}
         }
         
 			
 	close IFILE;	
 	}
}

}



 while (<>) {
	chomp;
	#print $_. "\n";
	$_ =~ s/\r//g;
	next if ($_=~/Histology_Diagnosis/);
	next if ($_=~/Negated/);
	next if ($_=~/\b(NOT DIAGNOSTIC OF MALIGNANCY|worrisome|bladder|prostate|thyroid|glossectomy|lymphoma|prostat|brain|breast|colon|ear|tongue|head|papilloma|esophag)\b/i);
     	# print $_. "\n";
	@e=split/\t/;
	@ee=split(/\_/, $e[0]);
	@f=split(/\./, $ee[5]);
	@f[0]=~s/\-//g;
############TODO, index file name......


#print $_. "\n";


	
	#if ($_=~/Histology/){
	if ($_=~/Histology|Diagnosis_Cancer/){
		#print $e[0]. "\n";
		
		if ($e[0] =~/txt\_\d+$/) {
		#print $e[0]. "\n";
			@meta =split (/\_\d+$/, $e[0]);
			#print  $meta[0]. "\n";
		
	 #if($_=~/interlobar|SUPRACLAVICULAR|trachea|Bronchus|lung|lobe|Needle|sputum|bronchial|Pleural/i){
			if ( exists ( $t{ $meta[0]})) { 
				if ($f[0] >= 19970101) {
					$p{$ee[0]}{$f[0]}= 1;
			#print $e[0]. "\t". $ee[0]. "\t". $f[0]. "\n";
				}
			}

		 }
		 
		 if ($e[0] =~/txt$/ ) {
		 
		 	if (exists ( $t{ $e[0]})) { 
				if ($f[0] >= 19970101) {
					$p{$ee[0]}{$f[0]}= 1;
				#print $e[0]. "\t". $ee[0]. "\t". $f[0]. "\n";
				}
			 }
		 }
		 
	
	
}
}


####if before 1997, such as 1996-03-22, use the next date later than 1997...

@mcn=(keys %p);

foreach $mcn (@mcn){
	@date =  keys %{ $p{ $mcn } } ;
	@date = sort(@date);	 
	$y=substr ($date[0], 0, 4);
	$m=substr ($date[0], 4, 2);
	$d=substr ($date[0], 6, 2);
	$dd=  $m. "/". $d. "/". $y;
	print $mcn. "\t". $dd. "\n";

}



















		