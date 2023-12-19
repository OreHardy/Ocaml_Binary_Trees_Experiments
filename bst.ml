(*PROJET AP3 — OREGAN HARDY | PAUL CAILLE | ANTONY FERRY *) 

(*============================================================*) 

(*Ouverture de nos fichiers binaires*)

open Btree ;;

(*============================================================*) 

(* Fonction de recherche d'une valeur dans notre arbre binaire de recherche *)

let rec bst_seek(t, v : 'a t_btree * 'a) : bool =
  if bt_isempty(t)
  then false
  else
    if bt_root(t)==v
    then true
    else
      if v<bt_root(t)
      then bst_seek(bt_subleft(t),v)
      else bst_seek(bt_subright(t),v)
;;

(*============================================================*) 

(* Fonction d'ajout aux feuilles d'un arbre binaire de recherche *)

let rec bst_linsert(t, v : 'a t_btree * 'a) : 'a t_btree =
  if bt_isempty(t)
  then bt_rooting(v, bt_empty(), bt_empty())
  else
    if(bt_root(t) >= v)
    then bt_rooting(bt_root(t), bst_linsert(bt_subleft(t), v), bt_subright(t))
    else bt_rooting(bt_root(t), bt_subleft(t), bst_linsert(bt_subright(t), v))
;;

(*============================================================*) 

(* Fonction de création d'un arbre binaire de recherche à partir d'une liste *)

let rec bst_lbuild_aux(l, t : 'a list * 'a t_btree) : 'a t_btree =
  if (l==[])
  then t
  else bst_lbuild_aux(List.tl(l), bst_linsert(t, List.hd(l)))
;;

let bst_lbuild(l : 'a list) : 'a t_btree =
  let newBst : 'a t_btree = bst_lbuild_aux(l, bt_empty()) in
  newBst
;;

(*============================================================*) 

(* Renvoie la plus grande valeur contenue dans un arbre binaire de recherche *)

let rec bt_max(t : 'a t_btree) : 'a =
  if bt_isempty(bt_subright(t))
  then bt_root(t)
  else bt_max(bt_subright(t))
;;

(* Renvoie un arbre binaire de recherche sans sa plus grande valeur *)

let rec bt_supprmax(t : 'a t_btree) : 'a t_btree =
  if(bt_isempty(bt_subright(t)))
  then bt_subleft(t)
  else bt_rooting(bt_root(t), bt_subleft(t), bt_supprmax(bt_subright(t)))
;;

(* Fonction de suppression dans un arbre binaire de recherche *)

let rec bst_delete(t, v : 'a t_btree * 'a) : 'a t_btree =
  if bt_isempty(t)
  then bt_empty()
  else
    if v<bt_root(t)
    then bt_rooting(bt_root(t), bst_delete(bt_subleft(t),v), bt_subright(t))
    else
      if v>bt_root(t)
      then bt_rooting(bt_root(t), bt_subleft(t), bst_delete(bt_subright(t),v))
      else
         if bt_isempty(bt_subright(t)) && bt_root(t) == v
          then bt_subleft(t)
          else
            if bt_isempty(bt_subleft(t)) && not(bt_isempty(bt_subright(t))) && bt_root(t) == v
            then bt_subright(t)
            else
              if not(bt_isempty(bt_subleft(t))) && not(bt_isempty(bt_subright(t)))&&bt_root(t)== v
              then bt_rooting(bt_max(bt_subleft(t)), bt_supprmax(bt_subleft(t)), bt_subright(t))
              else failwith("Impossible de supprimer l'élément")
;;

(*============================================================*) 

(* Fonction de séparation d'un arbre binaire de recherche en deux sous arbre par une valeur v *)

let rec bst_cut(t, v : 'a t_btree * 'a) : 'a t_btree * 'a t_btree =
  let (gauche, droite) : ('a t_btree * 'a t_btree) =
    if bt_isempty(t)
    then bt_empty(), bt_empty()
    else
    if(bt_root(t) < v)
    then
      let (g1, d1) : 'a t_btree * 'a t_btree = bst_cut(bt_subright(t), v) in
      (bt_rooting(bt_root(t), bt_subleft(t), g1), d1)
    else
      let (g1, d1) : 'a t_btree * 'a t_btree = bst_cut(bt_subleft(t), v) in
      (g1, bt_rooting(bt_root(t), d1, bt_subright(t)))
  in
  gauche, droite
;;

(* Fonction d'ajout à la racine d'un arbre binaire de recherche *)

let bst_rinsert(t, v : 'a t_btree * 'a) : 'a t_btree =
  let (gauche, droite) : 'a t_btree * 'a t_btree = bst_cut(t, v) in
  bt_rooting(v, gauche, droite)
;;

(*============================================================*) 

(* Fonction qui vérifie qu'une arbre binaire donné est bien un arbre binaire de recherche *)

let rec is_BST(t : 'a t_btree) : bool =
  if bt_isempty(t)
  then true
  else
    if not(bt_isempty(bt_subleft(t))) && bt_max(bt_subleft(t)) >= bt_root(t)
    then false
    else
      if not(bt_isempty(bt_subright(t))) && bt_max(bt_subright(t)) <= bt_root(t)
      then false
      else
        if not (is_BST(bt_subleft(t))) || not(is_BST(bt_subright(t)))
        then false
        else true
;;
