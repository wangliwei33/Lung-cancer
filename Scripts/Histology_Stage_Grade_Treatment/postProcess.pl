###treatment_histology_grade_remv1



#my $path = "/Users/m095909/Documents/Projects/Pharmacology_Epidemiology/missing_data/medtagger_out_CN";

#opendir( DIR, $path );
#my @files = readdir(DIR);
#closedir(DIR);
 
#foreach my $infile (@files) {
   
#					open (IFILE, "<$path/$infile") or die "Can't open $infile: $!";
#					@content="";
#					while (<IFILE>){




while (<>) {
   chomp;
   @e=split/\t/;
   # @ee =split(/\-/, $e[0]);  ## notes 
   @ee =split(/\_/, $e[0]);   ## path, surgery
   next if ($_=~/Negated/i);
   next if ($_=~/DOC_LINK_ID/i);
    	
   if ($e[6]=~/Histology/) {
   	 next if ($_=~/bladder/i);
     next if ($_=~/polyp/i);
     next if ($_=~/prostate/i);
     next if ($_=~/thyroid/i);
     next if ($_=~/tongue/i);
     next if ($_=~/colon/i);
     next if ($_=~/prostatic/i);
     next if ($_=~/brain/i);
     next if ($_=~/breast/i);
     next if ($_=~/head/i);
     next if ($_=~/neck/i);
     next if ($_=~/lymphoma/i);
     next if ($_=~/glossectomy/i);
     next if ($_=~/rule out/i);
     
     
     next if ($e[6]=~/\_Small cell/i && $e[10]=~/non/i) ;
 	 #($his)=~($e[6]=~/norm=\"Histology\_(.*)\"/);
 	 @f=split(/\_/, $e[6]);
 	 $f[1]=~s/\"//g;
   	 #print $ee[1]. "\t". $f[1]. "\n";
   	 
   	#  $t{$ee[1]}{$f[1]}{$e[5]}= 1;  ## notes
   	  $t{$ee[0]}{$f[1]}{$e[5]}= 1;  ##path
   #	 push (@his,  $ee[1]. "\t". $f[1]);
   	 
    }
        
     if ($e[6]=~/Grade/) {
   	 next if ($_=~/bladder/i);
     next if ($_=~/polyp/i);
     next if ($_=~/prostate/i);
     next if ($_=~/thyroid/i);
     next if ($_=~/tongue/i);
     next if ($_=~/colon/i);
     next if ($_=~/prostatic/i);
     next if ($_=~/brain/i);
     next if ($_=~/breast/i);
     next if ($_=~/head/i);
     next if ($_=~/neck/i);
     next if ($_=~/lymphoma/i);
     next if ($_=~/glossectomy/i);
     next if ($_=~/rule out/i);
     #next if ($e[6]=~/\_Small cell/i && $e[10]=~/non/i) ;
 	 #($his)=~($e[6]=~/norm=\"Histology\_(.*)\"/);
 	 @f=split(/\_/, $e[6]);
 	 $f[1]=~s/\"//g;
 	 $f[1]=~s/\_/ /g;
   	 #print $ee[1]. "\t". $f[1]. "\n";
   	 
    	# $p{$ee[1]}{$f[1]}{$e[5]}= 1; ##notes
   	 $p{$ee[0]}{$f[1]}{$e[5]}= 1;  ## path, surg
   #	 push (@his,  $ee[1]. "\t". $f[1]);
   	 
    }
    
     if ($e[6]=~/Stage/) {
   	 next if ($_=~/bladder/i);
     next if ($_=~/polyp/i);
     next if ($_=~/prostate/i);
     next if ($_=~/thyroid/i);
     next if ($_=~/tongue/i);
     next if ($_=~/colon/i);
     next if ($_=~/prostatic/i);
     next if ($_=~/brain/i);
     next if ($_=~/breast/i);
     next if ($_=~/head/i);
     next if ($_=~/neck/i);
     next if ($_=~/lymphoma/i);
     next if ($_=~/glossectomy/i);
     next if ($_=~/rule out/i);
     next if ($_=~/IV sedation/i);
     next if ($_=~/limited to/i);
     next if ($_=~/(IV hydration|IV fluid|IV antibiotics|IV therapy|IV for|peripheral IV|IV every|Heparin IV|IV q)/i);
     next if ($_=~/(continue IV|discontinue IV|IV site|mg IV|are limited|IIB hyperlipidemia|Limited support|Limited exam)/i);
     next if ($_=~/(limited to|limited by|limited in|limited with|limited at|limited resection|limited lung)/i);
     next if ($_=~/(extensive necrosis|IA \d+|extensive workup)/i);
    
     #next if ($e[6]=~/\_Small cell/i && $e[10]=~/non/i) ;
 	 #($his)=~($e[6]=~/norm=\"Histology\_(.*)\"/);
 	 @f=split(/\_/, $e[6]);
 	 $f[1]=~s/\"//g;
 	 $f[1]=~s/\_/ /g;
   	# print $ee[1]. "\t". $f[1]. "\n";
   	 
    #	 $r{$ee[1]}{$f[1]}{$e[5]}= 1; ##notes
   	   $r{$ee[0]}{$f[1]}{$e[5]}= 1;  ## path, surg
   #	 push (@his,  $ee[1]. "\t". $f[1]);
   	 
    }
    
    if ($e[9]=~/Chemo/i) {
   # print $_. "\n";
   	 next if ($_=~/bladder/i);
     next if ($_=~/polyp/i);
     next if ($_=~/prostate/i);
     next if ($_=~/thyroid/i);
     next if ($_=~/tongue/i);
     next if ($_=~/colon/i);
     next if ($_=~/prostatic/i);
     next if ($_=~/brain/i);
     next if ($_=~/breast/i);
     next if ($_=~/head/i);
     next if ($_=~/neck/i);
     next if ($_=~/lymphoma/i);
     next if ($_=~/glossectomy/i);
    next if ($_=~/rule out/i);
     next if ($_=~/(discuss|will|would|recommend|consider|should|evaluate|option|if|lymphoma|prostatic|palliative|opinion|unsuitable|felt|not|possibility|attempt|no
 )/i);
     
 	 @f=split(/\"/, $e[9]);
 	 
   		# print $ee[0]. "\t". $f[1]. "\t". "Surgery report". "\n";
    	#print $ee[0]. "\t". $f[1]. "\t". "Pathology report". "\n";
    	#print $ee[1]. "\t". $f[1]. "\t". "Clinical notes". "\n";
   	 
    }
    
    
    if ($e[9]=~/Radio/i) {
   	 next if ($_=~/bladder/i);
     next if ($_=~/polyp/i);
     next if ($_=~/prostate/i);
     next if ($_=~/thyroid/i);
     next if ($_=~/tongue/i);
     next if ($_=~/colon/i);
     next if ($_=~/prostatic/i);
     next if ($_=~/brain/i);
     next if ($_=~/breast/i);
     next if ($_=~/head/i);
     next if ($_=~/neck/i);
     next if ($_=~/lymphoma/i);
     next if ($_=~/glossectomy/i);
     next if ($_=~/(discuss|will|would|recommend|consider|should|evaluate|option|if|lymphoma|prostatic|palliative|opinion|unsuitable|felt|not|possibility|attempt|no
 )/i);
     
 	 @f=split(/\"/, $e[9]);
 	 
   	 #print $ee[0]. "\t". $f[1]. "\t". "Surgery report". "\n";
   	# print $ee[0]. "\t". $f[1]. "\t". "Pathology report". "\n";
   #	print $ee[1]. "\t". $f[1]. "\t". "Clinical notes". "\n";
   
   	 
    }
    
    


    
    if ($e[6]=~/Surgery/i) {
    #if ($e[7]=~/(Surgery1|Surgery2|Surgery11)/i) {   
   # print $_. "\n";
   	 next if ($_=~/bladder/i);
     next if ($_=~/polyp/i);
     next if ($_=~/prostate/i);
     next if ($_=~/thyroid/i);
     next if ($_=~/tongue/i);
     next if ($_=~/colon/i);
     next if ($_=~/prostatic/i);
     next if ($_=~/brain/i);
     next if ($_=~/breast/i);
     next if ($_=~/head/i);
     next if ($_=~/neck/i);
     next if ($_=~/lymphoma/i);
     next if ($_=~/glossectomy/i);
     next if ($_=~/rule out/i);
     next if ($_=~/(discuss|will|would|recommend|consider|should|evaluate|option|if|lymphoma|prostatic|palliative|opinion|unsuitable|felt|not|possibility|attempt|no)/i);
   #  print $_. "\n";
 	  @f=split(/\"/, $e[6]);
 	# $f[1]=~s/\"//g;
 	# $f[1]=~s/\_/ /g;
   	 	# print $ee[0]. "\t". $f[1]. "\t". "Surgery report". "\n";
   	 	 #print $ee[0]. "\t". $f[1]. "\t". "Pathology report". "\n";  ## no result
   	 	# print $ee[1]. "\t". $f[1]. "\t". "Clinical notes". "\n";
   	 
   	 
   	 
    }

    
}



######histology;

 @mcn = keys %t;
 foreach $mcn (@mcn) {
 	 
 	@his = keys %{$t{$mcn}};
 	
 		if ( @his ==1) {
 		#print $mcn. "\t". $his[0]. "\t". "Pathology report". "\n";
 		#print $mcn. "\t". $his[0]. "\t". "Clinical notes". "\n";
 		print $mcn. "\t". $his[0]. "\t". "Surgery report". "\n";
 	}
 	else {
 		@hisCount="";
 		%hh="";
 		foreach $his (@his) {
 			@hisCount=keys %{$t{$mcn}{$his}};
 			$hisCount=@hisCount;
 			$hh{$hisCount}{$his}= 1;
 			#print $mcn. "\t". $his. "\t". $hisCount. "\n";
 		}
 		
 		
 			@histologyCount = keys %hh;
 			@sort = sort{ $b <=> $a } @histologyCount;
 		 
 		
 		  	@histologySort = keys %{$hh{$sort[0]}};
 	 	
 			#print $mcn. "\t". $histologySort[0]. "\t". "Pathology report".  "\n";
 			#print $mcn. "\t". $histologySort[0]. "\t".  "Clinical notes".  "\n";
 			print $mcn. "\t". $histologySort[0]. "\t". "Surgery report". "\n";
 			#print $mcn. "\t". $sort[1]. "\n";

		 
	

	}
}


#####grade

 @mcn = keys %p;
 foreach $mcn (@mcn) {
 	 
 	@grade = keys %{$p{$mcn}};
 	if ( @grade ==1) {
 		#print $mcn. "\t". $grade[0]. "\t". "Pathology report". "\n";
 		#print $mcn. "\t". $grade[0]. "\t". "Clinical notes". "\n";
 		#print $mcn. "\t". $grade[0].  "\t". "Surgery report". "\n";
 	}
 	else {
 		@hisCount="";
 		%gg="";
 		foreach $his (@grade) {
 			@hisCount=keys %{$p{$mcn}{$his}};
 			$hisCount=@hisCount;
 			$gg{$hisCount}{$his}= 1;
 			#print $mcn. "\t". $his. "\t". $hisCount. "\n";
 		}
 		
 		
 			@histologyCount = keys %gg;
 			@sort = sort{ $b <=> $a } @histologyCount;
 		 
 		
 		  	@histologySort = keys %{$gg{$sort[0]}};
 	 	
 			#print $mcn. "\t". $histologySort[0]. "\t". "Pathology report".  "\n";
 			#print $mcn. "\t". $histologySort[0]. "\t".  "Clinical notes".  "\n";
 			#print $mcn. "\t". $histologySort[0]. "\t". "Surgery report". "\n";
 			#print $mcn. "\t". $sort[1]. "\n";

		 
	
	}
}



#####stage

 @mcn = keys %r;
 foreach $mcn (@mcn) {
 	 
 	@stage = keys %{$r{$mcn}};
 	if ( @stage ==1) {
 		#print $mcn. "\t". $stage[0]. "\t". "Pathology report". "\n";
 		#print $mcn. "\t". $stage[0]. "\t". "Clinical notes". "\n";
 		#print $mcn. "\t". $stage[0].  "\t". "Surgery report". "\n";
 	}
 	else {
 		@hisCount="";
 		%ss="";
 		foreach $his (@stage) {
 			@hisCount=keys %{$r{$mcn}{$his}};
 			$hisCount=@hisCount;
 			$ss{$hisCount}{$his}= 1;
 			#print $mcn. "\t". $his. "\t". $hisCount. "\n";
 		}
 		
 		
 			@histologyCount = keys %ss;
 			@sort = sort{ $b <=> $a } @histologyCount;
 		 
 		
 		  	@histologySort = keys %{$ss{$sort[0]}};
 	 	
 			#print $mcn. "\t". $histologySort[0]. "\t". "Pathology report".  "\n";
 			#print $mcn. "\t". $histologySort[0]. "\t".  "Clinical notes".  "\n";
 			#print $mcn. "\t". $histologySort[0]. "\t". "Surgery report". "\n";
 			#print $mcn. "\t". $sort[1]. "\n";

		 
	
	}
}

 