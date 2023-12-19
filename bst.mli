val bst_seek : 'a Btree.t_btree * 'a -> bool
val bst_linsert : 'a Btree.t_btree * 'a -> 'a Btree.t_btree
val bst_lbuild_aux : 'a list * 'a Btree.t_btree -> 'a Btree.t_btree
val bst_lbuild : 'a list -> 'a Btree.t_btree
val bt_max : 'a Btree.t_btree -> 'a
val bt_supprmax : 'a Btree.t_btree -> 'a Btree.t_btree
val bst_delete : 'a Btree.t_btree * 'a -> 'a Btree.t_btree
val bst_cut : 'a Btree.t_btree * 'a -> 'a Btree.t_btree * 'a Btree.t_btree
val bst_rinsert : 'a Btree.t_btree * 'a -> 'a Btree.t_btree
val is_BST : 'a Btree.t_btree -> bool
