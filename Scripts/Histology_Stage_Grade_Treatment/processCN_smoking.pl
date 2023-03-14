$dir=shift;
$outputdir=shift;
$patientlist=shift;

open(P,$patientlist);
while(<P>){
   chomp;
   $_=~s/\r//g;
   $inpatient{$_}=1;
}

@files=`ls $dir`;
chomp(@files);
foreach $f (@files){
   ($mcn)=($f=~/(\d+)/);
   next if ($inpatient{$mcn} ne 1); 
   open(FILE, "$dir/$f");
    while(<FILE>){
     chomp;
     if($_=~/^DOC_LINK_ID/){
      $meta=$_;
    @e=split(/\|/,$meta);
# DOC_LINK_ID:147387364|DOC_REVISION_ID:1|DOC_ID:147387364|MCN:7257905|PATIENT_ID:7836832|MSH_DTM:2013-09-26 13:28:01.0|ACTIVITY_DTM:2013-09-26 10:30:00.0|ORIGINATION_DTM:2013-09-26 13:27:00.0|AUTHENTICATION_DTM:2013-0
#9-26 13:27:00.0|TRANSCRIPTION_DTM:2013-09-26 13:27:00.0|DOC_CONFIDENTIAL_IND:0|TRANSACTION_CODE:C|TRANSACTION_DTM:2013-09-26 13:28:00.9653|practice_setting:Chaplain Con|encounter_tmr:20130926T103000|cn1_event_cd:THP|
#cn1_inpatient:true|CN_CDA_MCR_EXCEPTION|birth_date:19721213|cn1_provider_login:MRH6966
($doclink)=($e[0]=~/\:(\d+)/);
 ($rev)=($e[1]=~/\:(\d+)/);
 ($mcn)=($e[3]=~/\:(\d+)/);
  
 ($eventtype)=($e[15]=~/\:(.*)/);
 ($activity)=($e[6]=~/ACTIVITY\_DTM\:(.*)/);
  $activity=~s/ /T/;
  $activity=~s/\:/\-/g;   
  ($encounter)=($e[14]=~/.+\:(.*)/);
  @encounterDate= split(/\T/, $encounter);
  $year = substr($encounterDate[0], 0, 4);
  $month = substr($encounterDate[0], 4, 2);
  $date = substr($encounterDate[0], 6, 7);
  $NoteDate = $year. "-". $month. "-". $date;
  ($practice_setting)=($e[13]=~/.+\:(.*)/);
#if(length($mcn)<8) { $t='0'x(8-length($mcn)); $mcn=$t.$mcn;}
#$file="$outputdir/$mcn"."_".$doclink."_".$rev."_".$eventtype."-".$encounter."-".$practice_setting;
$file="$outputdir/$doclink"."-".$mcn."-".$practice_setting."-".$encounter."-".$eventtype;

open(OUT, ">$file");
print OUT "NoteDate:". $NoteDate."\n";
#print OUT $_."\n";
}
 else{
 	if ($_=~/\:\d+\:/) {
 	   ($section)=($_=~/\:(\d+)/);
       print OUT $section. ":"."\n";
	}
	else {
		print OUT $_. "\n";
	}
}
}

}  
