# Attempts to add the desired number of switches
# Check how many spaces are available
execute store result score empty_spaces vars if entity @e[tag=no_path]
#execute if score empty_spaces vars >= target_switches settings run say There is enough space
execute if score empty_spaces vars >= target_switches settings run scoreboard players operation switches_to_place vars = target_switches settings

execute if score DEBUG settings matches 1 if score empty_spaces vars < target_switches settings run tellraw @a ["",{"text":"There is not enough room to generate ","color":"dark_red"},{"score":{"name":"target_switches","objective":"settings"},"bold":true,"color":"gold","hoverEvent":{"action":"show_text","contents":["settings->target_switches"]}},{"text":" switches on level ","color":"dark_red"},{"score":{"name":"target_level","objective":"vars"},"bold":true,"color":"gold"},{"text":". Will attempt to place as many as possible.","color":"dark_red"}]
execute if score empty_spaces vars < target_switches settings run scoreboard players operation switches_to_place vars = empty_spaces vars

execute if score DEBUG settings matches 1 run tellraw @a ["",{"text":"Can place: "},{"score":{"name":"empty_spaces","objective":"vars"},"color":"yellow"}]
execute if score DEBUG settings matches 1 run tellraw @a ["",{"text":"Trying to place switches: "},{"score":{"name":"switches_to_place","objective":"vars"},"color":"yellow"}]

# Place switches randomly
execute if score switches_to_place vars matches 1.. run function mn:maze_gen/lever/loop

execute if score DEBUG settings matches 1 run tellraw @a ["",{"text":"Could not place: "},{"score":{"name":"switches_to_place","objective":"vars"},"color":"yellow"}]

# Apply skin
execute as @e[tag=lever,team=Red] run function mn:maze_gen/cell/skin/lever/north
execute as @e[tag=lever,team=Blue] run function mn:maze_gen/cell/skin/lever/south
execute as @e[tag=lever,team=Yellow] run function mn:maze_gen/cell/skin/lever/east
execute as @e[tag=lever,team=Green] run function mn:maze_gen/cell/skin/lever/west

# Remove armor stand now that it is no longer needed
execute if score DEBUG settings matches 0 run kill @e[tag=lever]