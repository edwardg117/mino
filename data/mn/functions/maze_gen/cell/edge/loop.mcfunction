# Main loop to fill in edges
# 1. Pick a random edge
tag @e[tag=cell,tag=at_limit,tag=!connected,limit=1] add side_start
tag @e[tag=side_start] add searching
tag @e[tag=side_start] add connected
# 2. Create helper stands
execute at @e[tag=side_start] run summon armor_stand ~ ~ ~ {NoGravity:1b,Marker:1b,Invisible:1b,Tags:["maze_gen","edge_helper","helper_1"],ArmorItems:[{},{},{},{id:"minecraft:blue_concrete",Count:1b}]}
execute at @e[tag=side_start] run summon armor_stand ~ ~ ~ {NoGravity:1b,Marker:1b,Invisible:1b,Tags:["maze_gen","edge_helper","helper_2"],ArmorItems:[{},{},{},{id:"minecraft:red_concrete",Count:1b}]}
#execute at @e[tag=side_start] run summon armor_stand ~ ~ ~ {NoGravity:1b,Marker:1b,Invisible:1b,Tags:["maze_gen","edge_helper","helper_3"],ArmorItems:[{},{},{},{id:"minecraft:blue_terracotta",Count:1b}]}
#execute at @e[tag=side_start] run summon armor_stand ~ ~ ~ {NoGravity:1b,Marker:1b,Invisible:1b,Tags:["maze_gen","edge_helper","helper_4"],ArmorItems:[{},{},{},{id:"minecraft:red_terracotta",Count:1b}]}

# 3. Remove out of bounds armor stands
execute at @e[tag=side_start] as @e[tag=no_path,distance=..2.1] run function mn:maze_gen/cell/edge/remove_oob

# 4. Pick one of the remaining stands
execute at @e[tag=side_start] as @e[tag=no_path,distance=..2.1,sort=random,limit=1] at @s run tp @e[tag=edge_helper] ~ ~ ~
# Make it a path now
execute at @e[tag=helper_1] run tag @e[tag=no_path,distance=..1] add path
execute at @e[tag=helper_1] run tag @e[tag=no_path,distance=..1] remove no_path

# 5. Figure out what direction that is
execute store result score @e[tag=helper_1] posX run data get entity @e[tag=helper_1,limit=1] Pos[0]
#execute store result score @s posY run data get entity @s Pos[1]
execute store result score @e[tag=helper_1] posZ run data get entity @e[tag=helper_1,limit=1] Pos[2]

# +X East
execute if score @e[tag=helper_1,limit=1] posX > @e[tag=side_start,limit=1] posX at @e[tag=side_start,limit=1] run tp @e[tag=helper_1] ~5 ~ ~
execute if score @e[tag=helper_1,limit=1] posX > @e[tag=side_start,limit=1] posX at @e[tag=side_start,limit=1] run tag @e[tag=helper_1,limit=1] add dEast
#execute if score @e[tag=helper_1,limit=1] posX > @e[tag=side_start,limit=1] posX run function mn:maze_gen/cell/edge/east/start
# -X West 
execute if score @e[tag=helper_1,limit=1] posX < @e[tag=side_start,limit=1] posX at @e[tag=side_start,limit=1] run tp @e[tag=helper_1] ~-5 ~ ~
execute if score @e[tag=helper_1,limit=1] posX < @e[tag=side_start,limit=1] posX at @e[tag=side_start,limit=1] run tag @e[tag=helper_1,limit=1] add dWest
#execute if score @e[tag=helper_1,limit=1] posX < @e[tag=side_start,limit=1] posX run function mn:maze_gen/cell/edge/west/start
# +Z South
execute if score @e[tag=helper_1,limit=1] posZ > @e[tag=side_start,limit=1] posZ at @e[tag=side_start,limit=1] run tp @e[tag=helper_1] ~ ~ ~5
execute if score @e[tag=helper_1,limit=1] posZ > @e[tag=side_start,limit=1] posZ at @e[tag=side_start,limit=1] run tag @e[tag=helper_1,limit=1] add dSouth
#execute if score @e[tag=helper_1,limit=1] posZ > @e[tag=side_start,limit=1] posZ run function mn:maze_gen/cell/edge/south/start
# -Z North
execute if score @e[tag=helper_1,limit=1] posZ < @e[tag=side_start,limit=1] posZ at @e[tag=side_start,limit=1] run tp @e[tag=helper_1] ~ ~ ~-5
execute if score @e[tag=helper_1,limit=1] posZ < @e[tag=side_start,limit=1] posZ at @e[tag=side_start,limit=1] run tag @e[tag=helper_1,limit=1] add dNorth
#execute if score @e[tag=helper_1,limit=1] posZ < @e[tag=side_start,limit=1] posZ run function mn:maze_gen/cell/edge/north/start

execute if score @e[tag=helper_1,limit=1] posX > @e[tag=side_start,limit=1] posX run function mn:maze_gen/cell/edge/east/start
execute if score @e[tag=helper_1,limit=1] posX < @e[tag=side_start,limit=1] posX run function mn:maze_gen/cell/edge/west/start
execute if score @e[tag=helper_1,limit=1] posZ > @e[tag=side_start,limit=1] posZ run function mn:maze_gen/cell/edge/south/start
execute if score @e[tag=helper_1,limit=1] posZ < @e[tag=side_start,limit=1] posZ run function mn:maze_gen/cell/edge/north/start

kill @e[tag=edge_helper]

# 6. Continue?
tag @e[tag=side_start] remove searching
tag @e[tag=side_start] remove side_start
execute if entity @e[tag=cell,tag=at_limit,tag=!connected] run function mn:maze_gen/cell/edge/loop