-module(lesson3_task1).

-export([first_word/1]).

first_word(Bin) ->
    first_word(Bin, <<>>).

first_word(<<$\s, _/binary>>, Acc) ->
    Acc;
first_word(<<X/utf8, Bin/binary>>, Acc) ->
    first_word(Bin, <<Acc/binary, X/utf8>>);
first_word(<<>>,Acc) ->
    Acc.