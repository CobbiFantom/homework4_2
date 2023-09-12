-module(lesson3_task2_test).

-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

words_test_() -> [
    ?_assert(lesson3_task2:words(<<"Text with four words">>) == [<<"Text">>, <<"with">>, <<"four">>, <<"words">>]),
    ?_assert(lesson3_task2:words(<<"Перевірка ютф8 в дії">>) == [<<"Перевірка">>, <<"ютф8">>, <<"в">>, <<"дії">>]),
    ?_assert(lesson3_task2:words(<<>>) == [<<>>])
].

-endif.