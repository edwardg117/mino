# Find Side
#execute if entity @e[tag=side_start,tag=searching] run say Determining corner
#execute unless entity @e[tag=side_start,tag=searching] run say Corner will not be placed

execute if entity @e[tag=side_start,tag=searching] if score @e[tag=helper_1,limit=1] posX < @e[tag=start,limit=1] posX as @s run function mn:maze_gen/cell/edge/south/ne_corner
execute if entity @e[tag=side_start,tag=searching] if score @e[tag=helper_1,limit=1] posX > @e[tag=start,limit=1] posX as @s run function mn:maze_gen/cell/edge/south/nw_corner
