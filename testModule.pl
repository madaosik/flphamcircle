/** Functional and logical programming 2020/2021

Hamiltonian Cycle in Prolog
author: Adam Lanicek, xlanic04@stud.fit.vutbr.cz

Testing module containing the unit tests of the important predicates
*/

:- module(testModule,[test_hamCycle/0]).
:- use_module(hamCycle).

test_hamCycle :-
	write("Testing hamCycle/5 predicate with the sample input....."),
	test_init(FirstVert,EdgeArr,VertLen),
	hamCycle(FirstVert,EdgeArr,VertLen,[FirstVert],Cycles), !,
	Cycles == ['A','B','C','D'],
	write("......SUCCESS!"),nl.


test_init(FirstVert,EdgeArr,VertLen) :-
	FirstVert = 'A',
	EdgeArr = [[['A'], ['B']], [['A'], ['C']], [['A'], ['D']], [['B'], ['C']], [['B'], ['D']], [['C'], ['D']]],
	VertLen = 4.