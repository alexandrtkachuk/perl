#!/usr/bin/perl

print "good\n";
$count=0;$count++;$result='Итого='.$count."\n";1;

print $result;


print "$_ " for (1 ... 10);

print "\n";

@arr=(0 ... 14);

print "$_ " for @arr;

print "\n";

$" = ':'; # установим разделитель элементов
print "@arr";

#print "\n".(1...99)[0];


print "\n".shift @arr;
print "\n";
while (my $first = shift @arr) { # пока @array не опустеет
    print "Обработан элемент $first.";
    print "Осталось ", scalar @arr, " элементов\n";
}
