#$dir="/home/m095909/Projects/U24/Pharmacology_Epidemiology/missing_data/diagnosis_date/Han/Medtime_output";

$dir="/home/m095909/Projects/U24/Pharmacology_Epidemiology/missing_data/diagnosis_date/MedTime_output";


while(<>){
	chomp;
	 
	@e=split /\t/;
	 
	#print $_. "\n";
	$file=$e[1];
	#next if ($e[0] !~ /\d+T\d+/);
	$e[1]=~s/\.$//g;
	$e[1]=~s/\,$//g;
	$e[1]=~s/\)$//g;
	$e[1]=~s/\($//g;
	$e[1]=~s/\;$//g;
	$e[1]=~s/\:$//g;
	$e[1]=~s/\s*$//g;
	$e[1]=~s/^\s*//g;
	
	$e[1]=~s/\s*$//g;		 
	$e[1]=~s/\W+$//g;
	
	$t{$e[0]}{$e[1]}{$_}=1;
	
	#print $e[0]. "\t". $e[1]. "\n";
	
}

 
@files=`ls $dir`;
chomp(@files);
#print @files. "\n";
foreach $f (@files){
	#print $f. "\n";
  open(FILE, "$dir/$f");
    
# opendir( DIR, $dir );
# #print $dir. "\n";
#  @files = readdir(DIR);
# print $files[0]. "\n";
# closedir(DIR);
#  
# foreach $infile (@files) {
 #print $infile. "\n";
	next if ($f=~/\.$/);
	next if ($f=~/\..$/);
	if (defined($f)) {
		open (IFILE, "<$dir/$f") or die "Can't open $infile: $!";
		while (<IFILE>) {
			#print $f. "\t". $_. "\n";
			@e=split(/\_/, $f);
			@f=split/\"/;
			next if ($f[7] =~ /Date/);
			
			
			 $f=~s/\.ann//g;
			 @a=split(/\-/, $f[11]);
			 #print $f. "\t". $_. "\t". $a[0]. "\t". $a[1]. "\t". $a[2]. "\n";
			 
			# print $f. "\t". $a[0]. "\t". $a[1]. "\t". $a[2]. "\n";
			 if (@a==2) { 
			 
			 	 $f[11]= $f[11]. "-". "15";
			 	# print $f. "\t". $f[11]. "\n";
			 	} 
			  if (@a==1) { 
			 
			 	 $f[11]= $f[11]. "-". "07". "-". "01";
			 	# print $f. "\t". $f[11]. "\n";
			 	} 
			 
			# if ()
			 #Cyclophosphamide, bortezomib and dexamethasone
			#print  $e[0]. "\t". $f[11]. "\t". $f[7]. "\t". $infile. "\n";
###MCN	Normalized date	Text date	CN_source
###4412126	2011-12-16	12/16/2011	4412126_20111216T135600_330218217_LE.txt.ann
			#print $f. "\t". $f[7]. "\n";
				if ( exists( $t{ $f }{ $f[7] }) ) {
				#print $f. "\t". $_. "\n";
					@norm = keys%{$t{ $f}{ $f[7]}};
					foreach $norm (@norm) {
					
					 
# VDT-ACE			 
			# print  $e[0]. "\t". $f[11]. "\t". $f[7]. "\t". $infile. "\n";
			
					
						print  $f[11]. "\t". $norm. "\n";
					
				}
			}
		}
	}
}
   		