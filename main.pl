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
	halt.

start :- 
	prompt(_, ''),
	read_lines(LL),
	split_lines(LL,EdgeArr),
	flatten(EdgeArr,FlatVert),
	sort(FlatVert,SortedFlat),
	length(SortedFlat,VertLen),
	% Get first vertex and prevent obtaining the same paths with different start point
	member(FirstVert,SortedFlat), !,
	%find_hamCycles(VertLen,FirstVert,VertArr,[],Cycles),
	hamCycle(FirstVert,EdgeArr,VertLen,[FirstVert],Cycles),
	%hamCycle('A',[[['A'], ['B']], [['A'], ['C']], [['A'], ['D']], [['B'], ['C']], [['B'], ['D']], [['C'], ['D']]],4,['A'],Cycles),
	write(Cycles),
	nl,
	halt.