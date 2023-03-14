while (<>) {
	chomp;
	@e=split/\t/;
	if ($e[1]=~/^\d{4}$/ || $e[1]=~/spring|summer|fall|autumn|winter|early|end|late|middle/){
	
		print $_. "\n";
	
	}
	if ($e[1]=~/this year|last year/){
	
		print $_. "\n";
	
	}
}