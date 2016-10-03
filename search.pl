#!/usr/local/bin/perl
##############################################################
#				directory run script
#										2004/11/4
#									powered by Masashi Okada
##############################################################

$path = "/Users/okada/Desktop/"; #CHANGE root directory
@path = "/Users/okada/Desktop/"; #CHANGE root directory

$path_back = "";
$flag = "off";
$dir = "";
$directory = "";

$count = 0;
$m = 0;
$n = 0;

PATH:
$flag2 = "on";
if ($count eq 0){}
else{
	@path = split /,/,$dir;
}
$dir = "";

foreach $path (@path){
	$count = split /\//,$path;
	$count = $count - 3;		#CHANGE
	$path_back = "";
	$flag = "off";	
	print "$path\n";
	opendir(DIR,$path) or die "error";
	chdir $path;
	while ($entry = readdir DIR){
		
		if (-d $entry){
			if (($entry eq ".") or ($entry eq "..")){next;}
			else{}
			$directory = "$path/$entry";
			$dir = "$directory,$dir";
			$flag = "on";
			print "$directory \n";
		}
		else{
			@stat = stat $entry;
			$file = $file + $stat[7];
		}
	}
	for($m = 1;$m < $count;$m++){
		$path_back = "../$path_back";
	}
	print "$path_back\n";
	if ($count eq 1){}
	else {chdir $path_back;}
}
if ($flag eq "on"){
	goto PATH;
}
else{}

$file = $file / 1048576;
print "$file MB\n";

exit;
  
 