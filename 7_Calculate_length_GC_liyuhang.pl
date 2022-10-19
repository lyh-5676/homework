#!/usr/bin/perl -w
use strict;
#处理一个.fa文件。要求：从Athaliana.cds.subset.fa文件中仅提取cds ID，将id 中的T和G改成小写，同时将id后面的内容去除（AT2G9999.1->At2g99999)，并计算序列的长度以及序列中的GC含量。

my ($infile,$outfile)=@ARGV;
open IN, $infile||die("no such file.\n");
open OUT,">$outfile"||die("can not write.\n");


my %hash_seq;
my $id="";
while(<IN>){
    chomp;
#   print "NO.1,$_\n";
    if(/>(\w+)/){
        $id=$1;
        $id=~tr/TG/tg/;
#       print "NO.2,$id\n";
    }else{
        $hash_seq{$id}.=$_;#为何能够沿用最新的$id啊
#       print "NO.3,$id\t$hash_seq{$id}\n";
    }
}

foreach my $gene_id (sort keys(%hash_seq)){
    my $sequence=$hash_seq{$gene_id};
    my $G=$sequence=~tr/G/g/;
    my $C=$sequence=~tr/C/c/;
    my $A=$sequence=~tr/A/a/;
    my $T=$sequence=~tr/T/t/;
    my $gene_length=$G+$C+$A+$T;
    my $GC_portion=sprintf "%.2f",($G+$C)/($G+$C+$A+$T);
    print OUT "$gene_id\t$gene_length\t$GC_portion\n";

}


close IN, $infile||die("no such file.\n");
close OUT, $outfile||die("can not write.\n");

































