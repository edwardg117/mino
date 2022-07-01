# Attempts to add the desired number of switches
# Check how many spaces are available
execute store result score empty_spaces vars if entity @e[tag=no_path]
#execute if score empty_spaces vars >= target_switches settings run say There is enough space
execute if score empty_spaces vars >= target_switches settings run scoreboard players operation switches_to_place vars = target_switches settings

execute if score empty_spaces vars < target_switches settings run say There is not enough spaces to place switches on this level. Will place as many as possible.
execute if score empty_spaces vars < target_switches settings run scoreboard players operation switches_to_place vars = empty_spaces vars

tellraw @a ["",{"text":"Can place: "},{"score":{"name":"empty_spaces","objective":"vars"},"color":"yellow"}]
tellraw @a ["",{"text":"Trying to place switches: "},{"score":{"name":"switches_to_place","objective":"vars"},"color":"yellow"}]

# Place switches randomly
execute if score switches_to_place vars matches 1.. run function mn:maze_gen/lever/loop

# Figure out what side they are on
execute as @e[tag=lever] at @s if entity @e[tag=no_path,distance=..3.5,tag=North] run team join Red @s
execute as @e[tag=lever] at @s if entity @e[tag=no_path,distance=..3.5,tag=South] run team join Blue @s
execute as @e[tag=lever] at @s if entity @e[tag=no_path,distance=..3.5,tag=East] run team join Yellow @s
execute as @e[tag=lever] at @s if entity @e[tag=no_path,distance=..3.5,tag=West] run team join Green @s
# Apply skin
execute as @e[tag=lever,team=Red] run function mn:maze_gen/cell/skin/lever/north
execute as @e[tag=lever,team=Blue] run function mn:maze_gen/cell/skin/lever/south
execute as @e[tag=lever,team=Yellow] run function mn:maze_gen/cell/skin/lever/east
execute as @e[tag=lever,team=Green] run function mn:maze_gen/cell/skin/lever/west

# FIXME Uncomment this after testing
#kill @e[tag=lever]