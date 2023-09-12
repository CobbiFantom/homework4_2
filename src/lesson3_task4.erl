-module(lesson3_task4).

-export([decode/2]).

decode(Json, Type) ->
    case Type of
        proplist ->
            split(Json);
        map -> proplists:to_map(split(Json));
        _ ->
            undifinet
    end.

split(List) ->
    split(List, <<>>, <<>>, []).

split(<<$', Rest/binary>>, Acc, Acc2, List) ->
    split(Rest, Acc, Acc2, List);
split(<<$\s, Rest/binary>>, Acc, Acc2, List) ->
    split(Rest, Acc, Acc2, List);
split(<<$\n, Rest/binary>>, Acc, Acc2, List) ->
    split(Rest, Acc, Acc2, List);
split(<<$:, Rest/binary>>, Acc, _, List) ->
    split(Rest, <<>>, Acc, List);
split(<<$,, Rest/binary>>, Acc, Acc2, List) ->
    split(Rest, <<>>, <<>>, [{Acc2,Acc}|List]);
split(<<X, Rest/binary>>, Acc, Acc2, List) ->
    split(Rest, <<Acc/binary, X>>, Acc2, List);
split(<<>>, Acc, Acc2, List) ->
    lesson3_task2:reverse([{Acc2,Acc}|List]).
