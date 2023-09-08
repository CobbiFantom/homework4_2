-module(lesson3_task03).

-export([split/2]).

-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

-endif.


split(Bin,Delimiter) ->
    split(Bin,list_to_binary(Delimiter),<<>>,[]).

split(<<>>,_,Acc,List) ->
    lesson3_task02:reverse([<<Acc/binary>>|List]);
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

-ifdef(TEST).

split_test_() -> [
    ?_assert(split(<<"Col1-:-Col2-:-Col3-:-Col4-:-Col5">>, "-:-") ==
        [<<"Col1">>, <<"Col2">>, <<"Col3">>, <<"Col4">>, <<"Col5">>]),
    ?_assert(split(<<"Col1==Col2==Col3==Col4==Col5">>, "==") ==
        [<<"Col1">>, <<"Col2">>, <<"Col3">>, <<"Col4">>, <<"Col5">>]),
    ?_assert(split(<<>>, "") == [<<>>])
].

-endif.