# Choose between 0-3 connections based on distance from Start
# Find distance
execute as @s run function mn:maze_gen/cell/find_dist

# Calc how many segmenmts are allowed

# Riley's method
# 1. dist_frm_strt *= const_100
scoreboard players operation dist_temp vars *= const_100 const
# 2. target_size *= const_100
scoreboard players operation target_temp vars = target_size settings
scoreboard players operation target_temp vars *= const_100 const
# 3. tmp1 = max_connectors
scoreboard players operation allowed_connect vars = max_connectors settings
scoreboard players operation allowed_connect vars *= const_100 const
# 4. tmp1 /= target_size
#scoreboard players operation allowed_connect vars /= target_temp vars


# 5. tmp1 *= invert
scoreboard players operation allowed_connect vars *= invert const
# 6. tmp1 *= dist_frm_strt
scoreboard players operation allowed_connect vars *= dist_temp vars

# 4. tmp1 /= target_size
scoreboard players operation allowed_connect vars /= target_temp vars

# 7. tmp1 /= const_100
scoreboard players operation allowed_connect vars /= const_100 const
# 8. tmp1 += max_connectors
scoreboard players operation allowed_connect vars += max_connectors settings
# Exra Step
# 9. if 0 and dist < target then set to 1
execute if score allowed_connect vars matches 0 run scoreboard players set allowed_connect vars 1

# Calc how many segments will actually be chosen
scoreboard players set min RNG 0
execute if score @s dist_frm_strt < target_size settings run scoreboard players set min RNG 1
execute if score @s dist_frm_strt < target_size settings run scoreboard players add allowed_connect vars 1
# Mark this as an end
execute if score @s dist_frm_strt >= target_size settings at @s run tag @s add at_limit
scoreboard players operation max RNG = allowed_connect vars

function mn:rng/get-rng

scoreboard players operation @s con_left = output RNG

# Pick number of Paths and make the rest Walls
#tellraw @a ["",{"text":"attempting to generate "},{"score":{"name":"@s","objective":"con_left"}},{"text":" paths"}]
execute if score @s con_left matches 1.. as @s run function mn:maze_gen/cell/rng_pick_con

# Add paths
execute at @s as @e[distance=..2.1,tag=connector,tag=become_path] at @s run summon armor_stand ~ ~ ~ {CustomNameVisible:0b,NoGravity:1b,Marker:1b,Tags:["maze_gen","path"],CustomName:'{"text":"Path","color":"dark_green","bold":true,"underlined":true}',Invisible:1b}
# Inherrit direction
#execute as @e[tag=become_path,tag=East] 

# changed this so direction is saved, hopefully just changing the tags is okay
#execute at @s as @e[distance=..2.1,tag=connector,tag=!become_path] at @s run summon armor_stand ~ ~ ~ {CustomNameVisible:0b,NoGravity:1b,Marker:1b,Tags:["maze_gen","no_path"],CustomName:'{"text":"No Path","color":"dark_red"}',Invisible:1b}
execute at @s as @e[distance=..2.1,tag=connector,tag=!become_path] run tag @s add no_path
execute at @s as @e[distance=..2.1,tag=connector,tag=!become_path] run tag @s remove connector
# Woo! not needed
#execute at @s as @e[distance=..2.1,tag=connector] run kill @s