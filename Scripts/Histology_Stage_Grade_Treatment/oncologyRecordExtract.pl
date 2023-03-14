##  <DocumentType>ONCTHP</DocumentType>
## DocumentTitle>Chemotherapy Treatment Letter
## perl chemoCheck.pl CDM_ID_lungCancer.txt > lungCancer_chemo
## If the patient has CDM report with "<DocumentType>ONCTHP</DocumentType>" and " DocumentTitle>Chemotherapy Treatment Letter", then the patient is on chemotherapy.


 

#my $path = "/infodev1/phi-projects/bsi/workspace-sf/data_retrieval/lw/u24/all_clinic_number/cdm_report/mcn1";
#my $path = "/infodev1/phi-projects/bsi/workspace-sf/data_retrieval/lw/u24/all_clinic_number/cdm_report/mcn2";
my $path = "/infodev1/phi-projects/bsi/workspace-sf/data_retrieval/lw/u24/all_clinic_number/cdm_report";


opendir( DIR, $path );
my @files = readdir(DIR);
closedir(DIR);
#print $files[2]. "\n";
foreach my $infile (@files) {
   #if($infile=~/\d+\.txt/){
 				 #$infile =~s/\.xml//g;
					#open( OUT, ">/home/m095909/lung_cancer/all.nlp.tmp" ) or die "Couldn't open the $infile file for writing. \n";
					 
				#if (( exists ( $t{ $infile} ))) {
					 
					 @maps = split(/\_/, $infile);
		 			# $infile = $infile.".xml";
					open (IFILE, "<$path/$infile") or die "Can't open $infile: $!";
					@content="";
					while (<IFILE>){
						#if ($_=~/DocumentType\>ONCTHP/) {
						#if ($_=~/DocumentTitle\>Chemotherapy/) {
						 
						chomp;
						$_=~s/\r//g;
						 
						$_=~s/\n//g;
						push (@content, $_);
						#print $_;
					}	
						
						$string = join ( '', @content );
						 
						
						if ($string =~/lung cancer/) {
						# print $string;
						@e= split(/\<\/SECTION\>/, $string );
						
						#print $e[0]. "\n";
						#
						
						for ($i=0; $i<@e; $i++) {
						
						
						if ($e[$i]=~/SECTION id\=\"_PRIMARY_TUMOR\"\>/) {
						#print $e[$i];
							 ($diagnosisDate)=($e[$i]=~/Date of Dx\<\/TH\>\<TD\>(.*)\<\/TD/);
							 ($histology)=($e[$i]=~/Histology\<\/TH\>\<TD\>(.*)\<\/TD/);
							 ($grade)=($e[$i]=~/Grade\<\/TH\>\<TD\>(.*)\<\/TD/);
							 ($staging)=($e[$i]=~/Staging\<\/TH\>\<TD\>(.*)\<\/TD/);
						
						}
						
						
						@date = split(/\</,$diagnosisDate);
						@stage = split(/\</, $staging);
						@histo = split(/\</, $histology);
						@grades = split(/\</, $grade);
						
						
						
						if ($e[$i]=~/SECTION id\=\"_SURGERY\"\>/) {
						#print $e[$i];
							 ($surgery)=($e[$i]=~/TD\>(.*)\<\/TD/);
							# print $surgery. "check". "\n";
							 if ($surgery=~/(resection|lobectomy)/) {
							 	$surgery= "Yes";
							 }
							 else {
							 	$surgery="No";
							 }
						}	 
							 
							 
							 
						if ($e[$i]=~/SECTION id\=\"_RADIOTHERAPY\"\>/) {
						#print $e[$i];
							 ($radio)=($e[$i]=~/TD\>(.*)\<\/TD/);
							 #print "check". $radio. "\n";
							 if ($radio eq "") {
							 	$radio= "No";
							 }
							 else {
							 	$radio="Yes";
							 }
						}	 
						
						
						if ($e[$i]=~/SECTION id\=\"_SYSTEMIC_CANCER_THERAPY\"\>/) {
						#print $e[$i];
							 ($chemo)=($e[$i]=~/TD\>(.*)\<\/TD/);
							 
						#	 print "check". $chemo. "\n";
							 if ($chemo eq "") {
							 	$chemo= "No";
							 }
							 else {
							 	$chemo="Yes";
							 }
						}	 
						
						
							 
						}
						
						
						
						
						 
						
						
						print $maps[0]. "\t". $infile. "\t". $date[0]. "\t". $stage[0]. "\t". $grades[0]. "\t". $histo[0]. "\t". $chemo. "\t". $surgery. "\t". $radio. "\n";
						
						
						
						
					}
					
					#print "\n";
				}
					
			


