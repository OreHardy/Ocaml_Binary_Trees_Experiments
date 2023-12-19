(*PROJET AP3 - OREGAN HARDY | PAUL CAILLE | ANTONY FERRY *)

(*============================================================*) 

(* Definition du type t_btree *)

type 'a t_btree = AB_VIDE
            | AB_RACINE of 'a * 'a t_btree * 'a t_btree
;;

(* Creation de l'arbre vide *)

let bt_empty() : 'a t_btree =
  AB_VIDE
;;

(* Fonction d'enracinage de notre arbre *)

let bt_rooting(x, g, d : 'a * 'a t_btree * 'a t_btree) : 'a t_btree =
  AB_RACINE(x, g, d)
;;

(* Fonction de comparaison entre notre arbre et l'arbre vide *)

let bt_isempty(a : 'a t_btree) : bool =
  a = AB_VIDE
;;

(* Fonction qui récupère la valeur comprise dans le noeud racine de notre arbre *)

let bt_root(a : 'a t_btree) : 'a =
  match a with
  | AB_VIDE -> failwith("Error bt_root : Pas de racine")
  | AB_RACINE(x, g, d) -> x
;;

(* Fonction qui renvoie le sous arbre gauche de notre arbre *)

let bt_subleft(a : 'a t_btree) : 'a t_btree =
  match a with
  | AB_VIDE -> failwith("Pas de racine")
  | AB_RACINE(x, g, d) -> g
;;

(* Fonction qui renvoie le sous arbre droite de notre arbre *)

let bt_subright(a : 'a t_btree) : 'a t_btree =
  match a with
  | AB_VIDE -> failwith("Pas de racine")
  | AB_RACINE(x, g, d) -> d
;;

(*============================================================*)

(* Fonction qui renvoie la taille de notre arbre *)

let rec size(a : 'a t_btree) : int =
  if bt_isempty(a)
  then 0
  else 1 + size(bt_subleft(a)) + size(bt_subright(a))
;;

(* Fonction qui renvoie la hauteur de notre arbre *)

let rec height(a : 'a t_btree) : int =
  if bt_isempty(a)
  then 0
  else (
    let g : int = height(bt_subleft(a)) and d : int = height(bt_subright(a)) in
    if g > d
    then 1 + g
    else 1 + d
  )
;;

(*============================================================*)

(* Fonction qui renvoie un string a partir de notre arbre, avec f fonction de conversion de 'a to string, (si a est un int t_btree alors string_of_int) *)

let rec btree_to_string(a, f : 'a t_btree * ('a -> string)) : string =
  if bt_isempty(a)
  then "EMPTY"
  else f(bt_root(a)) ^ "," ^ "(" ^ btree_to_string(bt_subleft(a), f) ^ "," ^ btree_to_string(bt_subright(a), f) ^ ")"
;;
