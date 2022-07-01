# Temp init
# Create connectors
# Create new cell here
#execute at @e[tag=start] positioned ~5 ~ ~ run summon armor_stand ~ ~ ~ {CustomNameVisible:1b,NoGravity:1b,Marker:1b,Tags:["maze_gen","cell"],CustomName:'{"text":"Cell","color":"aqua"}'}
#execute at @e[tag=start] positioned ~-5 ~ ~ run summon armor_stand ~ ~ ~ {CustomNameVisible:1b,NoGravity:1b,Marker:1b,Tags:["maze_gen","cell"],CustomName:'{"text":"Cell","color":"aqua"}'}
#execute at @e[tag=start] positioned ~ ~ ~5 run summon armor_stand ~ ~ ~ {CustomNameVisible:1b,NoGravity:1b,Marker:1b,Tags:["maze_gen","cell"],CustomName:'{"text":"Cell","color":"aqua"}'}
#execute at @e[tag=start] positioned ~ ~ ~-5 run summon armor_stand ~ ~ ~ {CustomNameVisible:1b,NoGravity:1b,Marker:1b,Tags:["maze_gen","cell"],CustomName:'{"text":"Cell","color":"aqua"}'}

# Add connectors
#execute at @e[tag=cell] positioned ~2 ~ ~ run summon armor_stand ~ ~ ~ {CustomNameVisible:1b,NoGravity:1b,Marker:1b,Tags:["maze_gen","connector"],CustomName:'{"text":"Connector","color":"gold"}'}
#execute at @e[tag=cell] positioned ~-2 ~ ~ run summon armor_stand ~ ~ ~ {CustomNameVisible:1b,NoGravity:1b,Marker:1b,Tags:["maze_gen","connector"],CustomName:'{"text":"Connector","color":"gold"}'}
#execute at @e[tag=cell] positioned ~ ~ ~2 run summon armor_stand ~ ~ ~ {CustomNameVisible:1b,NoGravity:1b,Marker:1b,Tags:["maze_gen","connector"],CustomName:'{"text":"Connector","color":"gold"}'}
#execute at @e[tag=cell] positioned ~ ~ ~-2 run summon armor_stand ~ ~ ~ {CustomNameVisible:1b,NoGravity:1b,Marker:1b,Tags:["maze_gen","connector"],CustomName:'{"text":"Connector","color":"gold"}'}

execute at @e[tag=start] positioned ~5 ~ ~ run function mn:maze_gen/cell/create
execute at @e[tag=start] positioned ~-5 ~ ~ run function mn:maze_gen/cell/create
execute at @e[tag=start] positioned ~ ~ ~5 run function mn:maze_gen/cell/create
execute at @e[tag=start] positioned ~ ~ ~-5 run function mn:maze_gen/cell/create

# Add paths to Start to prevent it being overwritten
execute at @e[tag=start] positioned ~2 ~ ~ run summon armor_stand ~ ~ ~ {CustomNameVisible:1b,NoGravity:1b,Marker:1b,Tags:["maze_gen","path"],CustomName:'{"text":"Path","color":"dark_green","bold":true,"underlined":true}'}
execute at @e[tag=start] positioned ~-2 ~ ~ run summon armor_stand ~ ~ ~ {CustomNameVisible:1b,NoGravity:1b,Marker:1b,Tags:["maze_gen","path"],CustomName:'{"text":"Path","color":"dark_green","bold":true,"underlined":true}'}
execute at @e[tag=start] positioned ~ ~ ~2 run summon armor_stand ~ ~ ~ {CustomNameVisible:1b,NoGravity:1b,Marker:1b,Tags:["maze_gen","path"],CustomName:'{"text":"Path","color":"dark_green","bold":true,"underlined":true}'}
execute at @e[tag=start] positioned ~ ~ ~-2 run summon armor_stand ~ ~ ~ {CustomNameVisible:1b,NoGravity:1b,Marker:1b,Tags:["maze_gen","path"],CustomName:'{"text":"Path","color":"dark_green","bold":true,"underlined":true}'}

execute at @e[tag=path] at @e[distance=..2,limit=1,tag=connector] run summon armor_stand ~ ~ ~ {CustomNameVisible:1b,NoGravity:1b,Marker:1b,Tags:["maze_gen","path"],CustomName:'{"text":"Path","color":"dark_green","bold":true,"underlined":true}'}

execute at @e[tag=path] as @e[distance=..1,limit=1,tag=connector] run kill @s

scoreboard players set @e[tag=cell] seg_frm_strt 0
scoreboard players set @e[tag=cell] con_left 3

#execute as @e[tag=cell] run function 

execute store result score @e[tag=start] posX run data get entity @e[tag=start,limit=1] Pos[0]
execute store result score @e[tag=start] posY run data get entity @e[tag=start,limit=1] Pos[1]
execute store result score @e[tag=start] posZ run data get entity @e[tag=start,limit=1] Pos[2]
# Math.abs()
#execute if score @e[tag=start,limit=1] posX matches ..-1 run scoreboard players operation @e[tag=start] posX *= invert const
#execute if score @e[tag=start,limit=1] posY matches ..-1 run scoreboard players operation @e[tag=start] posY *= invert const
#execute if score @e[tag=start,limit=1] posZ matches ..-1 run scoreboard players operation @e[tag=start] posZ *= invert const

# Reset values
scoreboard players set segments_made vars 0
scoreboard players set target_level vars 0
scoreboard players set @e[tag=cell] level 1


scoreboard players set num_switches game_vars 0
scoreboard players set found_switches game_vars 0
scoreboard players set game_running game_vars 0
