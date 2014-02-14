-module(walks).
-export([plan_route1/2, plan_route2/2]).

-spec plan_route1(From::point(), To::point()) -> route().
-spec plan_route2(From::position(), To::position()) -> route().
-spec file::open(FileName, Modes) -> {ok, Handle} | {error, Why} when
   FileName    :: string(),
   Modes       :: [Mode],
   Modes       :: read | write | ...
   Handle      :: file_handle(),
   Why         :: error_term().  
-spec file:open(string(), [read|write|...] -> {ok, Handle} | {error, Why}).

-type direction() :: north | south | east | west.
-type point()     :: {integer(), integer()}.
-type route()     :: [{go, direction(), integer()}].
-type angle()     :: {Degrees::0..360, Minutes::0..60, Seconds::0..60}.
-type position()  :: {latitude | longitude, angle()}.

-type onOff()        :: on | off.
-type person()       :: {person, name(), age()}.
-type people()       :: [person()].
-type name()         :: {firstname, string()}.
-type age()          :: integer().
-type dict(Key, Val) :: [{Key, Val}].

-type term()      :: any().
-type boolean()   :: true | false.
-type byte()      :: 0..225.
-type char()      :: 0..16#10ffff.
-type number()    :: integer() | float().
-type list()      :: [any()].
-type maybe_improper_list()   :: maybe_improper_list(any(), any()).
-type maybe_improper_list(T)  :: maybe_improper_list(T, any()).
-type string()    :: [char()].
-type nonempty_string() :: [char(),...].
-type iolist()    :: maybe_improper_list(byte() | binary() | iolist() , binary() | []).
-type module()    :: atom().
-type mfa()       :: {atom(), atom(), atom()}.
-type node()      :: atom().
-type timeout()   :: infinity | non_neg_integer().
-type no_return() :: none().