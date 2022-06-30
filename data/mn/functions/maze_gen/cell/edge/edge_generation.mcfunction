# 1. Run the loop
function mn:maze_gen/cell/edge/loop

# 2. Add in the corners and intersections
tag @e[tag=connected] add processing
function mn:maze_gen/cell/apply_skin
execute at @e[tag=cell,tag=processing] as @e[distance=..2.1,tag=path] run kill @s
kill @e[tag=processing]