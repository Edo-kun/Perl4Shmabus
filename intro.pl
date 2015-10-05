use strict;
use warnings;

#Example 1 - my is used for first declaration of a variable.
#$ are scalars: number, floats, strings
#@ are arrays
#% are hashes
#Most symbols are valid for identifiers, including the above for example $$
sub introduction {
	my $number = 72;
	my $string = "lol Arexus sucks";
	my $floaterino = 3.44;
	print "The $number, $string, and $floaterino";
	return;
}

#introduction();

#Example 2
#$@% for everything yey~
sub binarySearch {
	my ($searchFor, @array) = @_; #@_ is inherited array of parameters

	my $low = 0;
	my $high = scalar @array; #array sizify~
	while ($low <= $high){
		my $mid = int(($high+$low)/2);
		if ($array[$mid] == $searchFor){ #@array[3] makes a scalar so $array[3] is better
			return $mid;
		}
		elsif ($array[$mid] < $searchFor){
			$low = $mid + 1;
		}
		elsif ($array[$mid] > $searchFor){
			$high = $mid - 1;
		}
	}
}

#print binarySearch(4, 1..5);


#Example 3
#3 data types
#$ are scalars: number, floats, strings
#@ are arrays
#% are hashes
package Datatypes;

sub new{ #initializer
	my ($class, %arguments) = @_; #A hash of arguments
	return bless {%arguments}, $class; #bless = turn into object
}

sub modifyFields{
	my ($self) = @_; #inherit fields aka arguments
	$self->{number} += 1;
	print "ITERATION $self->{number}\n";
	print $self->{alex} .= $self->{alex}; #.=concatenates
	print "\n";
	push (@{$self->{array}}, $self->{array}[-1] +1); #adding to array~
	print "@{$self->{array}}\n";
}

sub printFields{
	my ($self) = @_; #inherit fields aka arguments
	print "$self->{number} $self->{alex} @{$self->{array}}";
}

my $obj = Datatypes->new(number => 0, alex =>"sucks", array => [1..5]); #should add [] around arrays for field assignment
$obj->modifyFields();
$obj->modifyFields();
$obj->printFields();

