-module(lesson3_task02).

-export([words/1, reverse/1]).

-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

-endif.


words(Bin) ->
    words(Bin,<<>>,[]).


words(<<$\s, Rest/binary>>, Acc,List) ->
    words(Rest, <<>> ,[Acc|List]);
words(<<X/utf8, Rest/binary>>,Acc,List) ->
    words(Rest, <<Acc/binary, X/utf8>>, List);
words(<<>>,Acc, List) ->
    reverse([Acc|List]).


reverse(L) ->
    reverse(L,[]).

reverse([],Acc) ->
    Acc;
reverse([H|T],Acc) ->
    reverse(T,[H|Acc]).

-ifdef(TEST).

words_test_() -> [
    ?_assert(words(<<"Text with four words">>) == [<<"Text">>, <<"with">>, <<"four">>, <<"words">>]),
    ?_assert(words(<<"Перевірка ютф8 в дії">>) == [<<"Перевірка">>, <<"ютф8">>, <<"в">>, <<"дії">>]),
    ?_assert(words(<<>>) == [<<>>])
].

-endif.