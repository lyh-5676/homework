#! /usr/bin/perl -w
use strict;
#this programe is used to select the Locus ID whose e-value less than 1e-10

open IN,"$ARGV[0]"||die;
open OUT,">$ARGV[1]"||die;

my %ID_times;
#my $i;

while(<IN>){
	chomp;
	my @array=split /\t/;
	if($array[10]<1e-10){
#		$i++;
		$ID_times{$array[0]}++;
	
	}
}

foreach my $geneid(sort keys%ID_times){
	print OUT "$geneid\t$ID_times{$geneid}\n";
}

close IN;
close OUT;









































