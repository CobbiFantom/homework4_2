-module(lesson3_task04).

-export([split/1]).

split(List) ->
    split(List, <<>>, <<>>, []).

%%split(<<$[, Rest/binary>>, _Acc, Acc2, List) ->
%%  open(Rest, <<>>, Acc2,List,[]);

split(<<$', Rest/binary>>, Acc, Acc2, List) ->
    split(Rest, Acc, Acc2, List);
split(<<$\s, Rest/binary>>, Acc, Acc2, List) ->
    split(Rest, Acc, Acc2, List);
split(<<$\n, Rest/binary>>, Acc, Acc2, List) ->
    split(Rest, Acc, Acc2, List);
split(<<$:, Rest/binary>>, Acc, <<>>, List) ->
    split(Rest, <<>>, Acc, List);
split(<<$,, Rest/binary>>, Acc, Acc2, List) ->
    split(Rest, <<>>, <<>>, [{Acc2,Acc}|List]);
split(<<X, Rest/binary>>, Acc, Acc2, List) ->
    split(Rest, <<Acc/binary, X>>, Acc2, List);
split(<<>>, Acc, Acc2, List) ->
    lesson3_task02:reverse([{Acc2,Acc}|List]).

%%open(<<X, Rest/binary>>, Acc, Acc2, List, Temp) ->
%% open(Rest, <<Acc/binary, X>>, Acc2, List, Temp);
%%open(<<$], Rest/binary>>, Acc, Acc2, List, Temp) ->
