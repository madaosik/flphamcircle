:- use_module(inputParser).

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
		%hamCycle('A',[['A', 'B'], ['A', 'C'], ['A', 'D'], ['B', 'C'], ['B', 'D'], ['C', 'D']],4,['A'],Cycles),
		write(Cycles),
		nl,
        halt.

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