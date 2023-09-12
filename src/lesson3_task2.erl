-module(lesson3_task2).

-export([words/1, reverse/1]).

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

