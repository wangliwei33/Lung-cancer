
while (<>) {
	chomp;
	@e=split/\t/;
	
###stage
 	
 	if ($e[3]=~/(IA|T1N0Mx)/i)  {
		#print $e[0]. "\t". "IA". "\n";
	
	}
 
 	if ($e[3]=~/(IB|T2N0M0)/i)  {
		#print $e[0]. "\t". "IB". "\n";
	
	}
 
 	if ($e[3]=~/(IIA|T1N1M0)/i)  {
		#print $e[0]. "\t". "IIA". "\n";
	
	}
	if ($e[3]=~/(IIB|T2\, N1\, M0|T2N0Mx|T2N1Mo)/i)  {
		#print $e[0]. "\t". "IIB". "\n";
	
	}
	
	
	if ($e[3]=~/IIIA/i)  {
		#print $e[0]. "\t". "IIIA". "\n";
	
	}
	if ($e[3]=~/(IIIB|T2N3M0)/i)  {
		#print $e[0]. "\t". "IIIB". "\n";
	
	}
	
	
	
	if ($e[3]=~/(4|IV)/i)  {
		#print $e[0]. "\t". "IV". "\n";
	
	}
	if ($e[3]=~/Limited/i)  {
		#print $e[0]. "\t". "Limited". "\n";
	
	}
	 
	if ($e[3]=~/extensive/i)  {
		#print $e[0]. "\t". "Extensive". "\n";
	
	}
	
	
	
	
	
	
	
	
	
###grade
 	
 	if ($e[4]=~/(4 |4|3\/3|high grade|high|4\/4)/i)  {
		#print $e[0]. "\t". "poorly differentiation". "\n";
	
	}
 
 	if ($e[4]=~/(3|mod differentiated)/i)  {
		#print $e[0]. "\t". "moderate differentiation". "\n";
	
	}
 	
 	if ($e[4]=~/(1|2\/|low grade|1\-2)/i)  {
		#print $e[0]. "\t". "well differentiation". "\n";
	
	}
 	




###histology
 	
 	if ($e[4]=~/(squamous cell carcinoma|)/i)  {
		print $e[0]. "\t". "squamous". "\n";
	
	}
 
 	if ($e[4]=~/(small cell)/i  && $e[4]!~/non/i)  {
		print $e[0]. "\t". "small cell". "\n";
	
	}
 	
 	if ($e[4]=~/(1|2\/|low grade|1\-2)/i)  {
		#print $e[0]. "\t". "well differentiation". "\n";
	
	}
 	
}















