#! /usr/bin/perl
use strict;

open(IN,"$ARGV[0]")||die;

my $i;
my $sum;

while(my $line=<IN>){
    chomp;
    my @array=split(/\t/,$line);
    if($array[1]>=3000){
        $i++;
        $sum+=$array[2];
#     print "$i\n";           
    }
}
#print "$i\n";

my $mean=$sum/$i;
print "average expression of genes those length not less than 3000bp is $mean!\n";


close IN;





















































