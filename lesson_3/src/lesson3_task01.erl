-module(lesson3_task01).

-export([first_word/1]).

-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

-endif.



first_word(Bin) ->
    first_word(Bin, <<>>).

first_word(<<$\s, _/binary>>, Acc) ->
    Acc;
first_word(<<X, Bin/binary>>, Acc) ->
    first_word(Bin, <<Acc/binary, X>>);
first_word(<<>>, Acc) ->
    Acc.

-ifdef(TEST).

first_word_test_() -> [
    ?_assert(first_word(<<"Some Text">>) == <<"Some">>),
    ?_assert(first_word(<<"Якийсь Текст">>) == <<"Якийсь">>),
    ?_assert(first_word(<<>>) == <<>>)
].

-endif.