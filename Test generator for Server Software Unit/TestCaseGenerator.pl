use strict;
use warnings; 

my $fname='[ServerSoftware]Tests.txt';
open (my $fid1,'>',$fname) or die;

print "Enter the number of tests you want:";
my $num_cases = <>;

if ($num_cases > 0)
{
	print "S M K N T D\n";
}
else
{
	close $fid1;
	printf "No test will be generated\n";
	die;
}

for(my $ii = 0; $ii < $num_cases ; $ii++)
{
	AGAIN:
	my $S = int(rand(100)) + 1;
	my $M = int(rand(100)) + 1;
	my $K = int(rand($M)) + 1;
	my $N = int(rand(2*$S)) + 1;
	my $D = int(rand(100)) + 1;
	my $T = int($D + rand(10*$D)); 
	my @TestCase = ($S, $M, $K, $N, $T, $D);
	if($S*$K > $M*$N)
	{
		goto AGAIN;
	}
	
	print $fid1 "@TestCase\n";	
} 

print "Done!\n";
close($fid1);

