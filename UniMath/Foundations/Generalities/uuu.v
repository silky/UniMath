(** * Introduction. Vladimir Voevodsky . Feb. 2010 - Sep. 2011 

This is the first in the group of files which contain the (current state of) the mathematical library for theproof assistant Coq based on the Univalent Foundations. It contains some new notations for constructions defined in Coq.Init library as well as the definition of dependent sum as a record.


*)




(** Preambule. *)

Unset Automatic Introduction.  (** This line has to be removed for the file to compile with Coq8.2 *)

(** Universe structure *)

Notation UUU := Set .

(** Empty type.  The empty type is introduced in Coq.Init.Datatypes by the line:

[ Inductive Empty_set : Set := . ]

*)

Notation empty := Empty_set. 

(** Identity Types. Idenity types are introduced in Coq.Init.Datatypes by the lines : 

[ Inductive identity ( A : Type ) ( a : A ) : A -> Type := identity_refl : identity _ a a . 
Hint Resolve identity_refl : core . ] 

*)

Notation paths := identity .
Notation idpath := identity_refl .

(** Coproducts . 

The coproduct of two types is introduced in Coq.Init.Datatypes by the lines:

[ Inductive sum (A B:Type) : Type :=
  | inl : A -> sum A B
  | inr : B -> sum A B. ]
*)

Notation coprod := sum .

Notation ii1fun := inl .
Notation ii2fun := inr .

Notation ii1 := inl .
Notation ii2 := inr .
Implicit Arguments ii1 [ A B ] .
Implicit Arguments ii2 [ A B ] .


(** Dpendent sums. 

One can not use a new record each time one needs it because the general theorems about this construction would not apply to new instances of "Record" due to the "generativity" of inductive definitions in Coq. One could use "Inductive" instead of "Record" here but using "Record" which is equivalent to "Structure" allows us later to use the mechanism of canonical structures with total2. *)

Set Primitive Projections.

Record total2 { T: Type } ( P: T -> Type ) := tpair { pr1 : T; pr2 : P pr1 }.
Arguments tpair {T} _ _ _.
Arguments pr1 {_ _} _.
Arguments pr2 {_ _} _.

(*

(** The phantom type family ( following George Gonthier ) *)

Inductive Phant ( T : Type ) := phant : Phant T .


*)

(** The following command checks wheather the patch which modifies the universe level assignement for inductive types have been installed. With the patch it returns [ paths 0 0 : UUU ] . Without the patch it returns [ paths 0 0 : Prop ]. *)

Check (paths O O) .



(* End of the file uuu.v *)
