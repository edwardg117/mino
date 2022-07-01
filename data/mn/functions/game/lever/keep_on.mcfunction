# Keeps levers turned on once activated, unable to be turned off
execute as @e[tag=lever] run data modify entity @s Time set value 1
execute if score game_running game_vars matches 1 run schedule function mn:game/lever/keep_on 20t