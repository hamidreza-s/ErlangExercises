-module(file_info).
-compile(export_all).
-include_lib("kernel/include/file.hrl").

file_size_and_type(File) ->
	case file:read_file_info(File) of
		{ok, Facts} ->
			{Facts#file_info.type, Facts#file_info.size};
		_ -> error
	end.

ls(Dir) ->
	{ok, L} = file:list_dir(Dir),
	lists:map(fun(I) -> {I, file_size_and_type(I)}  end, lists:sort(L)).
