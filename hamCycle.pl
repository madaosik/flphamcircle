/** Functional and logical programming 2020/2021

Hamiltonian Cycle in Prolog
author: Adam Lanicek, xlanic04@stud.fit.vutbr.cz

Module implementing the actual Hamiltonian cycle algorithm
*/

:- module(hamCycle,[hamCycle/5,getAllHamCycles/5]).

isNewPath(_,[]).
isNewPath(CycleTail,[StoredCycleTail|RestCycles]) :-
	CycleTail \= StoredCycleTail,
	reverse(CycleTail,RevCycleTail),
	RevCycleTail \= StoredCycleTail,
	isNewPath(CycleTail,RestCycles).

getAllHamCycles(FirstVert, EdgeArr, VertLen, GeneratedTailsRepo, HamCycles) :-
	hamCycle(FirstVert,EdgeArr,VertLen,[FirstVert],[HamCycleHead|HamCycleTail]),
	isNewPath(HamCycleTail,GeneratedTailsRepo),
	% A new (tail)path has been found, so we have a new Hamiltonian cycle 
	append([HamCycleHead], HamCycleTail, NewlyFoundCycle),
	getAllHamCycles(FirstVert, EdgeArr, VertLen, [HamCycleTail|GeneratedTailsRepo], NewlyFoundCycles), !,
	HamCycles = [NewlyFoundCycle | NewlyFoundCycles]
	;
	HamCycles = [].

decr(X,New) :- New is X-1.

hamCycle(Vert,EdgeArr,1,[StartVert|RemCycle],[StartVert|RemCycle]) :- neighVert(Vert,EdgeArr,StartVert).

hamCycle(Vert,EdgeArr,VertLen,Path,Res) :-
	neighVert(Vert,EdgeArr,Neighbour),
	% Make sure the neighbouring vertex is not in the cycle already. If not, add it.
	not(member(Neighbour,Path)), append(Path,[Neighbour],LongerPath), decr(VertLen,RemainVertCnt),
	hamCycle(Neighbour,EdgeArr,RemainVertCnt,LongerPath,Res).


neighVert(Vert, [ [[V1],[V2]] | NeighTail], Neighbour) :-
	Vert == V1, Neighbour = V2;
	% The edges are non-oriented, so other direction has to be taken into account as well
	Vert == V2, Neighbour = V1;
	neighVert(Vert,NeighTail,Neighbour).