#!usr/bin/perl -w
use strict;

my ($inputfile1,$inputfile2,$length_threshold,$exp_threshold)=@ARGV;
my %hash_seq;
my $geneid="";
my %gene_exp;

open IN1,$inputfile1||die("no such file $inputfile1 !\n"); 
open IN2,$inputfile2||die("no such file $inputfile2 !\n"); 




while(<IN1>){
    chomp;
    if(/>(\S+)/){
        $geneid=$1;
        $geneid=~tr/tg/TG/;
    }else{
        $hash_seq{$geneid}.=$_;
    }
#    print "$geneid\t$hash_seq{$geneid}\n";
}
while(<IN2>){
    chomp;
    my @array=split /\t/;
    my $allgeneid=$array[0];
    $gene_exp{$allgeneid}=$array[1];
#    print "$allgeneid\t$gene_exp{$allgeneid}\n";
}





#match "TTTTCAGG" in file1
my $location=0;
my $f_location;
my $gene_length;
foreach my $id(keys(%hash_seq)){
    my $sequence=$hash_seq{$id};
    if($sequence=~/\S+TTTTCAGG\S+/){
        $gene_length=$sequence=~tr/ATCG/atcg/;
#print "$sequence\n";
        $sequence=~s/ttttcagg/\t/;
        my @array2=split(/\t/,$sequence);
        $location=length($array2[0]);
        $f_location=1+$location;
        if($gene_length>$length_threshold && $gene_exp{$id}>$exp_threshold){
            print "$id\t$gene_length\t$f_location\t$gene_exp{$id}\n";
        }
    }
}

close IN1||die;
close IN2||die;


