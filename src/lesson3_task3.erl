-module(lesson3_task3).

-export([split/2]).

split(Bin,Delimiter) ->
    split(Bin,list_to_binary(Delimiter),<<>>,[]).

split(<<>>,_,Acc,List) ->
    lesson3_task2:reverse([<<Acc/binary>>|List]);
split(Bin,Delimiter,Acc,List) ->
    DelSize = (byte_size(Delimiter)),
    case Bin of
        <<Delimiter:DelSize/binary, Rest/binary>> ->
            split(Rest,Delimiter,<<>>,[<<Acc/binary>>|List]);
        <<X/utf8, Rest/binary>> ->
            split(Rest,Delimiter,<<Acc/binary, X/utf8>>,List);
        _ ->
            split(Bin,Delimiter,Acc,List)
    end.