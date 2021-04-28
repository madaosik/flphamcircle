/** Functional and logical programming 2020/2021

Hamiltonian Cycle in Prolog
author: Adam Lanicek, xlanic04@stud.fit.vutbr.cz

Module implementing the actual Hamiltonian cycle algorithm
*/

:- module(hamCycle,[hamCycle/5]).

%find_hamCycles(VertLen, StartNode, EdgeArr, Tails, Cycles) :-
	%hamCircle(VertLen,StartNode,VertArr,[CircHead|CircTail]),
	%hamCycle(StartNode,EdgeArr,VertLen,Cycles).

% Predicate processing the last remaining vertex on the Ha
%hamCircle(1, )
decr(X,New) :- New is X-1.

hamCycle(Vert,EdgeArr,1,[StartVert|RemCycle],[StartVert|RemCycle]) :- neighVert(Vert,EdgeArr,StartVert).

hamCycle(Vert,EdgeArr,VertLen,Path,Res) :-
	neighVert(Vert,EdgeArr,Neighbour),
	% Make sure the neighbouring vertex is not in the cycle already
	not(member(Neighbour,Path)), append(Path,[Neighbour],LongerPath),
	decr(VertLen,RemainVert),
	hamCycle(Neighbour,EdgeArr,RemainVert,LongerPath,Res).


neighVert(Vert,[],_) :- write("No adjacent vertex has been found for "), write(Vert), write("!"), nl, false.
neighVert(Vert, [ [[V1],[V2]] | NeighTail], Neighbour) :-
	%write("ahoj"),nl,
	%write(Vert),nl,
	%write(V1),nl,nl,
	Vert == V1, Neighbour = V2;
	% The edges are non-oriented, so other direction has to be taken into account as well
	Vert == V2, Neighbour = V1;
	neighVert(Vert,NeighTail,Neighbour).