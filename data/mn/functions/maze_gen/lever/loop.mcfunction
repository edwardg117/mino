# Places switches
#execute as @e[tag=no_path,sort=random,limit=1] at @s run summon armor_stand ~ ~3 ~ {NoGravity:1b,Glowing:1b,Tags:["lever","maze_gen"]}
#execute as @e[tag=lever] at @s if entity @e[tag=no_path,distance=..3.5,tag=North] run team join Red @s
#execute as @e[tag=lever] at @s if entity @e[tag=no_path,distance=..3.5,tag=South] run team join Blue @s
#execute as @e[tag=lever] at @s if entity @e[tag=no_path,distance=..3.5,tag=East] run team join Yellow @s
#execute as @e[tag=lever] at @s if entity @e[tag=no_path,distance=..3.5,tag=West] run team join Green @s

tag @e[tag=no_path,sort=random,limit=1] add become_lever
#TODO remove glowy from stand
execute at @e[tag=become_lever] run summon armor_stand ~ ~3 ~ {NoGravity:1b,Glowing:1b,Tags:["lever","maze_gen"]}
# Get direction
# TODO change this to just inherrit the tag
execute at @e[tag=become_lever,tag=North] run team join Red @e[tag=lever,distance=..3.5]
execute at @e[tag=become_lever,tag=South] run team join Blue @e[tag=lever,distance=..3.5]
execute at @e[tag=become_lever,tag=East] run team join Yellow @e[tag=lever,distance=..3.5]
execute at @e[tag=become_lever,tag=West] run team join Green @e[tag=lever,distance=..3.5]

#execute store success score success vars run kill @e[tag=become_lever]
#tellraw @a ["",{"text":"Killed armor stand?: "},{"score":{"name":"success","objective":"vars"},"color":"yellow"}]
# Remove other stands that might overwright this postion
execute at @e[tag=become_lever,tag=North] positioned ~ ~ ~-3 run kill @e[tag=no_path,distance=..3.1]
execute at @e[tag=become_lever,tag=South] positioned ~ ~ ~3 run kill @e[tag=no_path,distance=..3.1]
execute at @e[tag=become_lever,tag=East] positioned ~3 ~ ~ run kill @e[tag=no_path,distance=..3.1]
execute at @e[tag=become_lever,tag=West] positioned ~-3 ~ ~ run kill @e[tag=no_path,distance=..3.1]

scoreboard players add num_switches game_vars 1
scoreboard players remove switches_to_place vars 1

tellraw @a ["",{"text":"Placed: "},{"score":{"name":"num_switches","objective":"game_vars"},"color":"yellow"}]

# Loop if more to place and there are still valid spots
execute if score switches_to_place vars matches 1.. if entity @e[tag=no_path] run function mn:maze_gen/lever/loop