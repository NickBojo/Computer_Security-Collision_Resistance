use strict;
use warnings;
use Digest::CRC qw(crc32);
use Time::HiRes qw(time);

my $crc;
my $i;
my $string;
my %hash;
my @chars = ('a'..'z');
my $startTime;
my $endTime;
my $runTime;

BEGIN {$startTime = time();}

#Begin a Loop that only stops when a collision is found
for ($i = 0;; $i++)
{
	#Create random 8 bit string of lowercase letters
	$string = join '', map $chars[rand @chars],0..7;
	
	#Take crc32 of that string
	$crc = crc32($string);
	
	#If the crc32 of the random string is in the hash table, collision has been found
	if ($hash{$crc})
	{
		$endTime = time();;
		$runTime = $endTime - $startTime;
		
		print "\nCollision Found:\n\n";
		print "String 1 = $hash{$crc}\n";
		print "String 2 = $string\n\n";
		printf "CRC32 Value = %#x\n\n", $crc;
		print "$i Strings Attempted\n\n";
		printf "Strong Collision Found in %.3f seconds.\n", $runTime;
		
		last;
	}	
	
	#Add random string and crc to the hash table
	$hash{$crc} = $string;
	
	print "Strings Attempted: $i\n" unless ($i % 10000);
}
system("pause");