val avl_rnd_create : int * int -> (int * int) Btree.t_btree
val avl_lbuild_aux :
  'a list * ('a * int) Btree.t_btree -> ('a * int) Btree.t_btree
val avl_lbuild : 'a list -> ('a * int) Btree.t_btree
val avl_rnd_list_create : int * int * int -> (int * int) Btree.t_btree
val avl_avg_rotation_list : int -> float
val avl_rotation_to_text : unit -> unit
val time : ('a -> 'b) -> 'a -> float * 'b
val creation_time_to_text :
  (int * int -> ('a * int) Btree.t_btree) * int * int -> unit
val ajout_time_to_text :
  ((int * int) Btree.t_btree * int -> (int * int) Btree.t_btree) * int * int ->
  unit
val suppr_time_to_text :
  ((int * int) Btree.t_btree * int -> (int * int) Btree.t_btree) * int * int ->
  unit
val seek_time_to_text :
  ((int * int) Btree.t_btree * int -> bool) * int * int -> unit
