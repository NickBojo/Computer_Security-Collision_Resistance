use strict;
use warnings;
use Digest::CRC qw(crc32);
use Time::HiRes qw(time);

my $startTime;
my $endTime;
my $runTime;
my $i;
my @chars = ('a'..'z');
my $string;
my $crc;

#Set the target string and its crc32
my $targetString = "032b1d3943f47e31b17d8cf9128e869c";
my $targetCrc = crc32($targetString);

BEGIN {$startTime = time();}

#First string to try is 1
$string = "1";

#Begin a Loop that only stops when a collision is found
for ($i = 1;; $i++)
{	
	#Take the crc32 of the current string
	$crc = crc32($string);
	
	#If the crc32 of the current string matches the target crc32, collision has been found
	if ($crc == $targetCrc)
	{
		$endTime = time();;
		$runTime = $endTime - $startTime;
		
		print "\nCollision Found:\n\n";
		print "Target String = $targetString\n";
		print "Input String  = $string\n\n";
		printf "CRC32 Value = %#x\n\n", $crc;
		print "$i Strings Attempted\n\n";
		printf "Weak Collision Found in %.3f seconds.\n", $runTime;
		
		last;
	}	
	
	#Increment the string
	$string++;
	
	print "Strings Attempted: $i\n" unless ($i % 10000);	
}
system("pause");