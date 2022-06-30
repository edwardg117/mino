# What to do when processing a cell
#tp @e[tag=processed_cell] @s the slime died :(
# 1. Pick the connections
execute as @s run function mn:maze_gen/cell/pick_connections

# 2. Block paths for any cells that might try to travel here in furture ticks
execute at @s at @e[distance=..2.1,tag=no_path] as @e[distance=1..1.5,tag=connector,limit=1] at @s run summon armor_stand ~ ~ ~ {CustomNameVisible:0b,NoGravity:1b,Marker:1b,Tags:["maze_gen","no_path"],CustomName:'{"text":"No Path","color":"dark_red"}',Invisible:1b}
execute at @s at @e[distance=..2.1,tag=no_path] as @e[distance=1..1.5,tag=connector,limit=1] run kill @s
# Update paths too
execute at @s as @e[distance=..2.1,tag=path] at @s if entity @e[distance=0.9..1.1,tag=connector] as @e[distance=0.9..1.1,tag=connector] at @s run summon armor_stand ~ ~ ~ {CustomNameVisible:0b,NoGravity:1b,Marker:1b,Tags:["maze_gen","path"],CustomName:'{"text":"Path","color":"dark_green","bold":true,"underlined":true}',Invisible:1b}
execute at @s as @e[distance=..2.1,tag=path] at @s if entity @e[distance=0.9..1.1,tag=connector] as @e[distance=0.9..1.1,tag=connector] at @s run kill @s

# 3. Place new Cells
# Empty space, create new cell
execute at @s as @e[distance=..2.1,tag=path] at @s unless entity @e[distance=0.9..1.1,tag=connector] unless entity @e[distance=0.9..1.1,tag=path] run function mn:maze_gen/cell/place_next_cell
# Cell already exists and processed, do nothing
#execute at @s as @e[distance=..2.1,tag=path] at @s if entity @e[distance=0.9..1.1,tag=path] run say Cell already exists and already processed, do nothing
# Cell already exists but hasn't been processed, update (Will run even if previous command did, acts as the second half of it)

# 4. Add paths to new cells
#execute at @s as @e[distance=..2.1,tag=path] at @s if entity @e[distance=0.9..1.1,tag=connector] run say Cell already exists and hasn't been processed, will be updated

execute as @e[tag=needs_pre_proc] at @s as @e[distance=..2.1,tag=connector] at @s if entity @e[distance=..1.5,tag=path] run summon armor_stand ~ ~ ~ {CustomNameVisible:0b,NoGravity:1b,Marker:1b,Tags:["maze_gen","path"],CustomName:'{"text":"Path","color":"dark_green","bold":true,"underlined":true}',Invisible:1b}

# 5. Block closed paths to new cells
execute as @e[tag=needs_pre_proc] at @s as @e[distance=..2.1,tag=connector] at @s if entity @e[distance=..1.5,tag=no_path] run summon armor_stand ~ ~ ~ {CustomNameVisible:0b,NoGravity:1b,Marker:1b,Tags:["maze_gen","no_path"],CustomName:'{"text":"No Path","color":"dark_red"}',Invisible:1b}
#execute at @s as @e[distance=..2.1,tag=path] unless entity @e[distance=0.9..1.1,tag=connector] unless entity @e[distance=0.9..1.1,tag=path] run say cell does not exist

# 6. Remove extra connectors from new cells
execute as @e[tag=needs_pre_proc] at @s as @e[distance=..2.1,tag=connector] at @s if entity @e[distance=0..0.1,tag=!connector] run kill @s

# 7. Inherrit level
scoreboard players operation @e[tag=needs_pre_proc] level = @s level

# 7. remove needs_pre_proc tag
tag @e[tag=needs_pre_proc] remove needs_pre_proc

# Delete connectors (because they aren't needed anymore)
execute at @s as @e[distance=..2.1,tag=connector] run kill @s

#data merge entity @s {Invisible:1b}