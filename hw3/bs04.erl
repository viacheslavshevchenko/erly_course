%%%-------------------------------------------------------------------
%%% @author irishman
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. Mar 2018 22:34
%%%-------------------------------------------------------------------
-module(bs04).
-author("irishman").

%% API
-export([decode_xml/1]).


decode_xml(Bin) when is_binary(Bin) ->
  {Tag, _} = tag(Bin),
  Tag.

%%%===================================================================
%%% Internal functions
%%%===================================================================

tag(<<"<", Bin/binary>>) ->
  [TagHeader,Rest1] = split(Bin, <<">">>),
  {Tag, Attrs} = tag_header(TagHeader),
  {Content, Rest2} = tag_content(Rest1, Tag),
  {{Tag,Attrs,Content}, Rest2}.

tag_header(TagHeader) ->
  {TagHeader, []}.

tag_content(<<"</", Bin1/binary>>, Parent) ->
  Len = size(Parent),
  <<Parent:Len/binary, ">", Bin/binary>> = Bin1,
  <<Parent:Len/binary, Bin2/binary>> = Bin1,
  <<">", Bin/binary>> = Bin2,
  {[], Bin};

tag_content(<<"<", _/binary>> = Bin, Parent) ->
  {Tag, Rest1} = tag(Bin),
  {Content, Rest2} = tag_content(Rest1, Parent),
  {[Tag|Content], Rest2};

tag_content(Bin, Parent) ->
  [Text, Rest] = split(Bin, <<"</",Parent/binary,">">>),
  {[Text],Rest}.


%%%===================================================================
%%% Helpers
%%%===================================================================
split(BinText, Sep) ->
  split(BinText, Sep, length(binary_to_list(Sep)), <<>>).

split(BinText, Sep, Len, IAcc) ->
  case BinText of
    <<Sep:Len/binary, Rest/binary>> ->
      [<<IAcc/binary>>, Rest];
    <<H, Rest/binary>> ->
      split(Rest, Sep, Len, <<IAcc/binary, H>>)
  end.