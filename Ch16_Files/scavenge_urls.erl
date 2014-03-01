-module(scavenge_urls).
-export([url_html/2]).
-import(lists, [reverse/1, reverse/2, map/2]).

url_html(Urls, File) ->
	file:write_file(File, urlify(Urls)).

urlify(Urls) -> [h1("Urls"), make_list(Urls)].

h1(Title) -> ["<h1>", Title, "</h1>\n"].

make_list(List) ->
	[
		"<ul>\n",
		map(fun(I) -> ["<li>", I, "</li>\n"] end, List),
		"</ul>\n"
	].
