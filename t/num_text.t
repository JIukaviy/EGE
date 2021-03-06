use strict;
use warnings;
use utf8;

use Test::More tests => 17;

use lib '..';
use EGE::NumText;

is num_bytes(1), '1 байт', 'num_bytes 1';
is num_bytes(3), '3 байта', 'num_bytes 3';
is num_bytes(7), '7 байтов', 'num_bytes 7';

is num_by_words(0), 'ноль', 'w 0';
is num_by_words(1, 1), 'одна', 'w 1';
is num_by_words(22, 1), 'двадцать две', 'w 22';
is num_by_words(40), 'сорок', 'w 40';
is num_by_words(105), 'сто пять', 'w 105';
is num_by_words(712), 'семьсот двенадцать', 'w 712';

is num_by_words(1, 1, 'genitive'), 'одной', 'w 1 g';
is num_by_words(934, 0, 'genitive'), 'девятисот тридцати четырёх', 'w 1 g';

{
    my @t = map
        EGE::NumText::num_by_words_text($_, 1, 'genitive', [ qw(штуки штук штук) ]),
        1 .. 3;
    is $t[0], 'одной штуки', 'nwt 1';
    is $t[1], 'двух штук', 'nwt 2';
    is $t[2], 'трёх штук', 'nwt 3';
}

{
    my @t = map
        EGE::NumText::num_by_words_text($_, 0, 'nominative', [ qw(раз раза раз) ]),
        51, 22, 5;
    is $t[0], 'пятьдесят один раз', 'nwtn 1';
    is $t[1], 'двадцать два раза', 'nwtn 2';
    is $t[2], 'пять раз', 'nwtn 3';
}    
