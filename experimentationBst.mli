val add_lst : 'a list * 'a -> 'a list
val bst_rnd_create_aux : int * int * bool array -> int Btree.t_btree
val bst_rnd_create : int * int -> int Btree.t_btree
val create_sorted_list_begin : int * int * int -> int list
val balance_node : 'a Btree.t_btree -> int
val is_balanced : ('a * int) Btree.t_btree -> bool
val sum_balance_tree : 'a Btree.t_btree -> int
val avg_balance : unit -> float array
val avg_balance_from_list : unit -> float array
val balance_array_to_text : (unit -> float array) -> unit
