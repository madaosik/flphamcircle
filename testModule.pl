/** Functional and logical programming 2020/2021

Hamiltonian Cycle in Prolog
author: Adam Lanicek, xlanic04@stud.fit.vutbr.cz

Testing module containing the unit tests of the important predicates
*/

:- module(testModule,[test_hamCycle/0,test_getAllHamCycles/0]).
:- use_module(hamCycle).

compareOutput(Out,CorrOutput) :-
	write('Expec. output:\t'),write(CorrOutput),nl,
	write('Actual output:\t'),write(Out),nl,
	(
		Out == CorrOutput,
		write("\e[1;32mSUCCESS!\e[0m"),nl,nl
	)
	;
	write("\e[1;31mFAIL!\e[0m"),nl,nl.

test_hamCycle :-
	write("\e[1;33mhamCycle/5 predicate with the sample assignment input\e[0m"),
	test_init(FirstVert,EdgeArr,VertLen),
	!,
	hamCycle(FirstVert,EdgeArr,VertLen,[FirstVert],Cycles), nl, !,
	compareOutput(Cycles,['A','B','C','D']).

test_getAllHamCycles :-
	write("\e[1;33mgetAllHamCycles/5 predicate with the sample assignment input\e[0m"),
	test_init(FirstVert,EdgeArr,VertLen),
	getAllHamCycles(FirstVert, EdgeArr, VertLen, [], HamCycles), nl,
	compareOutput(HamCycles,[['A','B','C','D'],['A','B','D','C'],['A','C','B','D']]).

test_init(FirstVert,EdgeArr,VertLen) :-
	FirstVert = 'A',
	EdgeArr = [[['A'], ['B']], [['A'], ['C']], [['A'], ['D']], [['B'], ['C']], [['B'], ['D']], [['C'], ['D']]],
	VertLen = 4.