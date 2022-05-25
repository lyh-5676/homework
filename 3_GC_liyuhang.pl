#!/usr/bin/perl -w
#use strict;
#
#
#
#
#print "please enter a filename:";
#chomp($filename=<STDIN>);
open(IN,"$ARGV[0]")|| die "no such file";
open(OUT,">$ARGV[1]")||die "can't find the path!";
@line=<IN>;                                                        #按行读取
#print "$line[0]\n";                                               #测试 

$i=0;
$length_of_line=@line;

for($i=0;$i<$length_of_line;$i++){                                 #采用for循环    
@splited=split(/\t/,$line[$i]);                                    #将@line数组的每个元素，用制表符切割  
chomp($splited[0]);                                                #除去可能的“\n”
chomp($splited[2]);                                                #除去第3个元素后的“\n”
$final_scalar=join("\t",$splited[0],$splited[2]);                  #联合第1、3个元素为一个标量
#print "$final_scalar\n\n\n\n\n";
if($splited[2]>0.45){		                                   #if判断是否输出到“OUT”文件
print OUT"$final_scalar\n";
}
#print $every_line;

}
#print @GC;
#@sorted_GC=sort{$a<=>$b}(@GC);




close(IN)|| die "can't close the file";
close(OUT)|| die "can't keep the file:$ARGV[1]";























