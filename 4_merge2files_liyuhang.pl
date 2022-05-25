#! /usr/bin/perl
use strict;





my ($filename1,$filename2,$outfilename)=@ARGV;
open(F1,"$filename1")||die("can't open $filename1");
open(F2,"$filename2")||die("can't open $filename2");
open(F3,">$outfilename")||die "can't open file: $!";

my %length;
my %GC;

while(my $line1=<F1>){
    chomp $line1;
    my @array1=split(/\t/,$line1);
    $length{$array1[0]}=$array1[1];
}
while(my $line2=<F2>){
    chomp $line2;
    my @array2=split(/\t/,$line2);
    $GC{$array2[0]}=$array2[1];
}
#print %length;
#print $GC{"At1g11720"};

foreach my $gene_name1(keys(%length)){
    if(exists $GC{$gene_name1}){
        print F3 "$gene_name1\t$length{$gene_name1}\t$GC{$gene_name1}\n";
    }
}




close F1;
close F2;
close F3;






































