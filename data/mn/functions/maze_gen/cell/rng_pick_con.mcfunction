# Picks a random connector to become a path
execute at @s[tag=!gone_up] as @s unless entity @e[distance=..2.1,tag=connector,tag=!become_path,sort=random,limit=1] unless score target_level vars >= target_levels settings run function mn:maze_gen/cell/pick_up_down
execute at @s as @e[distance=..2.1,tag=connector,tag=!become_path,sort=random,limit=1] run tag @s add become_path
scoreboard players remove @s con_left 1
execute if score @s con_left matches 1.. as @s run function mn:maze_gen/cell/rng_pick_con