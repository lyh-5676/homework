#!/usr/bin/perl -w
#use strict;

#open(IN,"/mnt/ge-jbod/ucasj/ucasj28/mydata/number.txt") or die ("can not open number.txt for reading: $!");
#open(OUT, ">/mnt/ge-jbod/ucasj/ucasj28/mydata/sum.txt")or die ("can not write to sum.txt: $!");
open(IN,"$ARGV[0]") or die ("can not open number.txt for reading: $!");
open(OUT,">$ARGV[1]") or die ("failed!");

while ($number=<IN>){
  chomp $number;
  $sum+=$number;
}
print OUT "$sum\n";
close (IN) or die ("can not close IN:$!");
close (OUT) or die ("can not close OUT: $!"); 













