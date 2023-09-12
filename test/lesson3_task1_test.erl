-module(lesson3_task1_test).

-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

first_word_test_() -> [
    ?_assert(lesson3_task1:first_word(<<"Some Text">>) == <<"Some">>),
    ?_assert(lesson3_task1:first_word(<<"Якийсь Текст">>) == <<"Якийсь">>),
    ?_assert(lesson3_task1:first_word(<<>>) == <<>>)
].

-endif.