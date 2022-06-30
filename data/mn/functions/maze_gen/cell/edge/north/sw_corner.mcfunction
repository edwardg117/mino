#say placing South West Corner
#execute at @s run fill ~ ~ ~ ~ ~ ~2 lime_concrete
#execute at @s run fill ~ ~ ~ ~-2 ~ ~ lime_concrete
execute at @s run summon armor_stand ~ ~ ~ {NoGravity:1b,Marker:1b,Invisible:1b,Tags:["cell","processing","west","south"]}

execute at @s run tp @e[tag=helper_1] ~-5 ~ ~
execute at @s run tp @e[tag=helper_2] ~-5 ~ ~
tag @e[tag=helper_1] remove dNorth
tag @e[tag=helper_1] add dWest
function mn:maze_gen/cell/edge/west/start