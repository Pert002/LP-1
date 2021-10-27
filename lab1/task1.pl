% USE UTF-8


% Стандартные предикаты:

length_([], 0). % предикат получения длины списка
length_([_|Y], N) :- length_(Y, N1), N is N1 + 1.

member(A, [A|_]). % предикат проверки вхождения элемента в список 
member(A, [_|Z]) :- member(A, Z).

append([], List2, List2). % предикат объединения списков
append([H|T], List2, [H|TR]) :- append(T, List2, TR).

remove([], _Elem, []). % предикат удаления элемента из списка
remove([Elem|T], Elem, TR) :- remove(T, Elem, TR), !.
remove([H|T], Elem, [H|TR]) :- remove(T, Elem, TR).

permute([],[]). % предикат проверки перестановки списка
permute(L,[X|T]) :- remove(L,X,R), permute(R,T).

sub_start([], _List). % предикат проверки подсписка
sub_start([H|TSub], [H|TList]) :- sub_start(TSub, TList).
sublist(Sub, List) :- sub_start(Sub, List), !.
sublist(Sub, [_H|T]) :- sublist(Sub, T).

/* Tests:
?- length([1, 2, 3], N).
?- member(1, [1, 2, 3]).
?- append([1, 2], [3, 4], L).
?- remove([1, 2, 3], 3, L).
?- permute([1, 2, 3], [2, 1, 3]).
?- sublist([1, 2], [1, 2, 3]). 
*/


% Task 1.1
% Циклический сдвиг списка вправо

get_last([_|T], Res) :- get_last(T, Res). % предикат получения последнего элемента списка
get_last([T], [Res]) :- bebra([], T, Res).

bebra([], List2, List2). % предикат bebra
bebra([H|T], List2, [H|TR]) :- bebra(T, List2, TR).

reverse2([_|T], Res) :- reverse(T, Res). % предикат разворота списка
reverse(List, Res) :- reverse3(List, [], Res).
reverse3([], B, B).
reverse3([H|T], B, Res) :- reverse3(T, [H|B], Res).

shift(List, Res) :- get_last(List, Res1), reverse(List, Res2), reverse2(Res2, Res3), bebra(Res1, Res3, Res). % предикат из задания

/* Tests:
?- shift([1, 2, 3], N).
?- shift([a, b, c, d], N).
*/


% Task 1.2
% Вычисление минимального элемента

min([MinElem], MinElem). % предикат из задания
min([H|T], MinElem) :- min(T, TMinElem), TMinElem < H, !, MinElem = TMinElem; MinElem = H.

/* Tests:
?- min([1, 2, 3], N).
?- min([0, 0, 0], N).
?- min([-2, -1, 0, 1, 2], N).
*/
