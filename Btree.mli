type 'a t_btree = AB_VIDE | AB_RACINE of 'a * 'a t_btree * 'a t_btree
val bt_empty : unit -> 'a t_btree
val bt_rooting : 'a * 'a t_btree * 'a t_btree -> 'a t_btree
val bt_isempty : 'a t_btree -> bool
val bt_root : 'a t_btree -> 'a
val bt_subleft : 'a t_btree -> 'a t_btree
val bt_subright : 'a t_btree -> 'a t_btree
val size : 'a t_btree -> int
val height : 'a t_btree -> int
val btree_to_string : 'a t_btree * ('a -> string) -> string
