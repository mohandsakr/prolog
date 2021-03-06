/*** facts ***/
/*
 * greate parents .
*/
/*males*/
male(grandfather1).
male(grandfather2).
male(uncle1).
male(uncle2).

male(father).
male(cousin2).
male(son).
male(brother).
male(greatfather).
male(cousin-in-law1).
male(first_cousin_once_removed1).

/*Females*/
female(greatmother).
female(grandmother1).
female(grandmother2).
female(cousin1).
female(aunt1).
female(aunt2).
female(mother).
female(sister).
female(daughter).
Female(cousin-in-law2).
male(first_cousin_once_removed2).

/*parents*/
/*greatparents relation*/
parent(greatfather,grandfather1).
parent(greatfather,grandtfather2).
parent(greatfather,grandmother1).
parent(greatfather,grandmother2).
parent(greatmother,grandfather1).
parent(greatmother,grandtfather2).
parent(greatmother,grandmother1).
parent(greatmother,grandmother2).
/*
1st branch grandfathers ,grandmothers.
*/
parent(grandfather1,aunt1).
parent(grandfather1,uncle1).
parent(grandfather1,father).
parent(grandmother1,aunt1).
parent(grandmother1,uncle1).
parent(grandmother1,father).
/*
2nd branch grandfathers ,grandmothers.
*/
parent(grandfather2,mother).
parent(grandfather2,uncle2).
parent(grandmother2,mother).
parent(grandmother2,uncle2).
/*the relations of the next genration for grandparents1*/
parent(aunt1,cousin1).
parent(father,son).
parent(father,daughter).
/*The relations of the next genration for grandparents2*/
parent(mother,son).
parent(mother,daudaughter).
parent(uncle2,cousin2).
/**
 * the last level
*/
parent(cousin_in-law1,first_cousin_once_removed1).
parent(cousin1,first_cousin_once_removed1).
parent(cousin_in-law2,first_cousin_once_removed2).
parent(cousin2,first_cousin_once_removed2).

/****relations ******/
/* father : if  he is a parent and it is male

*/
father(X,Y):-parent(X,Y),male(X).
/*
mother :  if it is a parent and it is female.
*/
mother(X,Y):-parent(X,Y),female(X).
/*check if they have the same father*/
samefather(X,Y):-
father(Z,X),father(Z,Y).

/*check if they have the same mother*/
samemother(X,Y):-
    mother(Z,X),mother(Z,Y).
/*
brother :  if they have the same father and same father and same mother
and the gender is male.

*/
brother(X,Y):-parent(Z,X),parent(Z,Y),male(X),X\=Y.
/*brother(X,Y):-samefather(X,Y),samemother(X,Y),male(X),X\=Y.
*/

/*sister :
if they have the same father and mother and the gender is female
*/
/*sister(X,Y):-samefather(X,Y),samemother(X,Y),female(X).*/
sister(X,Y):-parent(Z,X),parent(Z,Y),female(X),X\=Y.

/*
uncle if is he a brother of the dad what ever the parent is male or
female.
*/
uncle(X,Y):-parent(Z,Y),brother(X,Z).
 /*aunt relation
 * the person is annt if she is sister to the dad whatever she is a male
 * or female.
 *
*/
 aunt(X,Y):-parent(Z,Y),sister(X,Z).
/*grandfather
 * if male and it is the parent of the father.
 *
 *
 *
*/
grandfather(X,Y):-father(X,Z),parent(Z,Y),write('* grand father :').
/*grandfather
 * if female and it is the parent of the father.
 *
 *
 *
*/
grandmother(X,Y):-mother(X,Z),parent(Z,Y),write('* grand mother :').
/*Grand parent relation whether it is male or female*/
grandparent(X,Y):-parent(X,Z),parent(Z,Y),write('* grand parents (male/female): ').
/**
 * greatfather relation which show the great father or the oldest father
 * for the family.
 *
 */
greatfather(X,Y):-father(X,Z),grandparent(Z,Y),write('* grand father (male/female): ').

greatmother(X,Y):-mother(X,Z),grandparent(Z,Y),write('* grand mother (male/female):  ').
/*
 *cousin*/
 cousin(X,Y):-uncle(Z,Y),parent(X,Z).
cousin(X,Y):-aunt(Z,Y),parent(X,Z).
/**first cousin removed
**
*if it is the son of cousin of the
**/
first_cousin_once_removed(X,Y):-cousin(Z,Y),parent(Z,X).
/*
*/
/*
 * son if it is male and whatever was his parent
*/
son(X,Y):-male(X),parent(Y,X).
/*
 daughter if it is male and whatever was his parent
*/
daughter(X,Y):-female(X),parent(Y,X).







