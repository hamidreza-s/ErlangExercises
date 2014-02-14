-module(lib_misc).
-compile(export_all).

on_exit(Pid, Fun) ->
	spawn(
		fun() -> 
			Ref = monitor(process, Pid),
			receive
				{'DOWN', Ref, process, Pid, Why} -> Fun(Why)
			end
		end).