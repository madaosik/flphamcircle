/** Functional and logical programming 2020/2021

Hamilton Cycle in Prolog
author: Adam Lanicek, xlanic04@stud.fit.vutbr.cz

Main module defining the control flow predicates.
*/

:- use_module(inputParser).
:- use_module(testModule).
:- use_module(hamCycle).

test :-
	test_hamCycle,
    test_getAllHamCycles,
	halt.

writeCycle([]).
writeCycle([_]).
writeCycle([V1,V2|RestVert]) :-
	write(V1), write('-'), write(V2), write(' '),
	writeCycle([V2|RestVert]).

writeCycles(_, []).
writeCycles(FirstVert, [HamCycle|T]) :- 
	writeCycle(HamCycle), writeFinalEdge(FirstVert, HamCycle), writeCycles(FirstVert,T).

writeFinalEdge(FirstVert,HamCycle) :-
	reverse(HamCycle,[RevHead|_]),
	write(RevHead),write('-'),write(FirstVert),nl.


start :- 
	prompt(_, ''),
	read_lines(LL),
	split_lines(LL,EdgeArr),
	flatten(EdgeArr,FlatVert),
	sort(FlatVert,SortedFlat),
	length(SortedFlat,VertLen),
	member(FirstVert,SortedFlat),
	% Make sure not to get the same paths with different starting point
	!,
	getAllHamCycles(FirstVert, EdgeArr, VertLen, [], HamCycles),
	writeCycles(FirstVert, HamCycles),
	halt.