# Remove the No Path armor stands that are too far away
execute as @s run function mn:maze_gen/cell/find_dist

execute if score @s dist_frm_strt > target_size settings run kill @s