#!/usr/bin/perl -w
#use strict;



print "please input an int number:";
$number=<STDIN>;
chomp($number);
###$odd_or_even=$number%2;
$t=T;
$a=A;
$null=" ";
$repeat=$number/2;
if($number%2==0){
  for($i=1;$i<=$repeat;$i++){
#  $null x=($repeat-$i);
#  $t x=$i;
#  $a x=$i;
  print $null=" "x($number-$i);
  print $t="T"x$i;
  print $a="A"x$i;
  print $null=" "x$i;

  print "\n";


 } 


}else{
  print "$number is a odd number!\n";
}

