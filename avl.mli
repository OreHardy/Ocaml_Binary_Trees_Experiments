val nbRotation : int ref
val resetNbRotation : unit -> unit
val addNRotation : int -> unit
val left_rotation : 'a Btree.t_btree -> 'a Btree.t_btree
val right_rotation : 'a Btree.t_btree -> 'a Btree.t_btree
val left_right_rotation : 'a Btree.t_btree -> 'a Btree.t_btree
val right_left_rotation : 'a Btree.t_btree -> 'a Btree.t_btree
val reindice : ('a * int) Btree.t_btree -> ('a * int) Btree.t_btree
val avl_max_value : ('a * int) Btree.t_btree -> 'a
val avl_max : ('a * int) Btree.t_btree -> 'a * int
val is_BST_avl : ('a * int) Btree.t_btree -> bool
val is_AVL : ('a * int) Btree.t_btree -> bool
val reequilibrer : ('a * int) Btree.t_btree -> ('a * int) Btree.t_btree
val ajout_avl : ('a * int) Btree.t_btree * 'a -> ('a * int) Btree.t_btree
val avl_supprmax : ('a * int) Btree.t_btree -> ('a * int) Btree.t_btree
val suppr_avl : ('a * int) Btree.t_btree * 'a -> ('a * int) Btree.t_btree
val avl_seek : ('a * int) Btree.t_btree * 'a -> bool
