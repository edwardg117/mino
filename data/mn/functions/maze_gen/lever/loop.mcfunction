# Places switches
execute as @e[tag=no_path,sort=random,limit=1] at @s run summon armor_stand ~ ~3 ~ {NoGravity:1b,Glowing:1b,Tags:["lever","maze_gen"]}
execute store success score success vars run execute as @e[tag=lever] at @s run kill @e[tag=no_path,distance=2.9..3.1]
tellraw @a ["",{"text":"Killed armor stand?: "},{"score":{"name":"success","objective":"vars"},"color":"yellow"}]

scoreboard players add num_switches game_vars 1
scoreboard players remove switches_to_place vars 1

tellraw @a ["",{"text":"Placed: "},{"score":{"name":"num_switches","objective":"game_vars"},"color":"yellow"}]

# Loop if more to place
execute if score switches_to_place vars matches 1.. run function mn:maze_gen/lever/loop