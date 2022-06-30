# Places the new Cell in the correct position next to the Cell being processed
execute if entity @e[distance=..0.1,tag=connector,tag=East] positioned ~3 ~ ~ run function mn:maze_gen/cell/create
execute if entity @e[distance=..0.1,tag=connector,tag=West] positioned ~-3 ~ ~ run function mn:maze_gen/cell/create
execute if entity @e[distance=..0.1,tag=connector,tag=South] positioned ~ ~ ~3 run function mn:maze_gen/cell/create
execute if entity @e[distance=..0.1,tag=connector,tag=North] positioned ~ ~ ~-3 run function mn:maze_gen/cell/create
# Tag Cell for update
execute as @e[distance=3..3.1,tag=cell] run tag @s add needs_pre_proc