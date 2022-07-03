# Move along the wall east
#say traveling east
execute at @e[tag=helper_1] run tp @e[tag=helper_2] ~5 ~ ~
execute at @e[tag=helper_1] run kill @e[tag=no_path,distance=..3.1,tag=North]
execute at @e[tag=helper_2] run kill @e[tag=no_path,distance=..3.1,tag=North]
execute at @e[tag=helper_1] run kill @e[tag=no_path,distance=..3.1,tag=South]
execute at @e[tag=helper_2] run kill @e[tag=no_path,distance=..3.1,tag=South]

# Find Side
#execute if score @e[tag=helper_1,limit=1] posX > @e[tag=start,limit=1] posX run say Side: +X East
#execute if score @e[tag=helper_1,limit=1] posX < @e[tag=start,limit=1] posX run say Side: -X West

# Update distances
execute as @e[tag=helper_1] run function mn:maze_gen/cell/find_dist
execute as @e[tag=helper_2] run function mn:maze_gen/cell/find_dist

# Two free spaces
#execute at @e[tag=helper_1] unless entity @e[tag=cell,distance=..1] at @e[tag=helper_2] unless entity @e[tag=cell,distance=..1] if score distX vars < target_size settings run fill ~2 ~ ~ ~-7 ~ ~ lime_concrete
#execute at @e[tag=helper_1] unless entity @e[tag=cell,distance=..1] at @e[tag=helper_2] unless entity @e[tag=cell,distance=..1] if score distX vars < target_size settings run setblock ~ ~ ~ structure_block[mode=load]{name:"minecraft:5x10_template",posX:-7,posY:0,posZ:-2,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
#execute at @e[tag=helper_1] unless entity @e[tag=cell,distance=..1] at @e[tag=helper_2] unless entity @e[tag=cell,distance=..1] if score distX vars < target_size settings run setblock ~ ~1 ~ redstone_block
execute if entity @e[tag=side_start,tag=searching] at @e[tag=helper_1] unless entity @e[tag=cell,distance=..1] as @e[tag=helper_2] at @s unless entity @e[tag=cell,distance=..1] if score distX vars < target_size settings run function mn:maze_gen/cell/skin/regular/5x10/east
# One free space
#execute at @e[tag=helper_1] unless entity @e[tag=cell,distance=..1] at @e[tag=helper_2] if entity @e[tag=cell,distance=..1] run fill ~-5 ~ ~ ~-7 ~ ~ lime_concrete
#execute at @e[tag=helper_1] unless entity @e[tag=cell,distance=..1] at @e[tag=helper_2] if entity @e[tag=cell,distance=..1] run say Helper 2 at cell
execute if entity @e[tag=side_start,tag=searching] at @e[tag=helper_1] unless entity @e[tag=cell,distance=..1] at @e[tag=helper_2] if entity @e[tag=cell,distance=..1] as @e[tag=helper_1] run function mn:maze_gen/cell/skin/regular/straight_ew
execute if entity @e[tag=side_start,tag=searching] at @e[tag=helper_1] unless entity @e[tag=cell,distance=..1] at @e[tag=helper_2] if entity @e[tag=cell,distance=..1] at @e[tag=helper_1] run setblock ~ ~1 ~ redstone_block
execute at @e[tag=helper_1] unless entity @e[tag=cell,distance=..1] at @e[tag=helper_2] if entity @e[tag=cell,distance=..1] run tag @e[tag=cell,distance=..1] add connecting
execute at @e[tag=helper_1] unless entity @e[tag=cell,distance=..1] at @e[tag=helper_2] if entity @e[tag=cell,distance=..1] run tag @e[tag=side_start,tag=searching] remove searching

# No free space
#execute at @e[tag=helper_1] if entity @e[tag=cell,distance=..1] run say reached cell
execute at @e[tag=helper_1] if entity @e[tag=cell,distance=..1] run tag @e[tag=cell,distance=..1] add connecting
execute at @e[tag=helper_1] if entity @e[tag=cell,distance=..1] run tag @e[tag=side_start,tag=searching] remove searching

execute as @e[tag=connecting] at @s positioned ~-2 ~ ~ run tag @e[tag=no_path,distance=..1.1] add path
execute as @e[tag=connecting] at @s positioned ~-2 ~ ~ run tag @e[tag=no_path,distance=..1] remove no_path
tag @e[tag=connecting] add connected
tag @e[tag=connecting] remove connecting

# Helper 1 is At corner
# Helper 2 cell needs to fill it in
#execute at @e[tag=helper_1] unless entity @e[tag=cell,distance=..1] at @e[tag=helper_2] unless entity @e[tag=cell,distance=..1] if score @e[tag=helper_2,limit=1] dist_frm_strt > target_size settings as @e[tag=helper_2] at @s run fill ~2 ~ ~ ~-7 ~ ~ lime_concrete
#execute at @e[tag=helper_1] unless entity @e[tag=cell,distance=..1] at @e[tag=helper_2] unless entity @e[tag=cell,distance=..1] if score @e[tag=helper_2,limit=1] dist_frm_strt > target_size settings as @e[tag=helper_1] at @s run say helper 1 at corner EAST
execute at @e[tag=helper_1] unless entity @e[tag=cell,distance=..1] at @e[tag=helper_2] unless entity @e[tag=cell,distance=..1] if score @e[tag=helper_2,limit=1] dist_frm_strt > target_size settings as @e[tag=helper_1] at @s run function mn:maze_gen/cell/edge/east/determine_corner

# Helper 2 is at a corner
# Helper 1 cell needs to fill it in
#execute at @e[tag=helper_1] unless entity @e[tag=cell,distance=..1] at @e[tag=helper_2] unless entity @e[tag=cell,distance=..1] if score distX vars = target_size settings as @e[tag=helper_1] at @s run fill ~2 ~ ~ ~-2 ~ ~ lime_concrete
execute at @e[tag=helper_1,tag=dEast] unless entity @e[tag=cell,distance=..1] at @e[tag=helper_2] unless entity @e[tag=cell,distance=..1] if score distX vars = target_size settings as @e[tag=helper_1] at @s run function mn:maze_gen/cell/skin/regular/straight_ew
execute at @e[tag=helper_1,tag=dEast] unless entity @e[tag=cell,distance=..1] at @e[tag=helper_2] unless entity @e[tag=cell,distance=..1] if score distX vars = target_size settings as @e[tag=helper_1] at @s run setblock ~ ~1 ~ redstone_block
execute at @e[tag=helper_1,tag=dEast] unless entity @e[tag=cell,distance=..1] at @e[tag=helper_2] unless entity @e[tag=cell,distance=..1] if score distX vars = target_size settings as @e[tag=helper_2] at @s run function mn:maze_gen/cell/edge/east/determine_corner
#execute at @e[tag=helper_1,tag=dEast] unless entity @e[tag=cell,distance=..1] at @e[tag=helper_2] unless entity @e[tag=cell,distance=..1] if score distX vars = target_size settings as @e[tag=helper_2] at @s run say helpter 2 at corner EAST

execute if score @e[tag=helper_1,limit=1] dist_frm_strt > target_size settings run say Something has gone very wrong [EAST]
execute if score @e[tag=helper_1,limit=1] dist_frm_strt > target_size settings run tag @e[tag=side_start,tag=searching] remove searching

# continue execution?
execute if entity @e[tag=helper_1,tag=dEast] at @e[tag=helper_2] run tp @e[tag=helper_1] ~5 ~ ~
#execute if entity @e[tag=helper_1,tag=dEast] if entity @e[tag=side_start,tag=searching] run say execution will continue EAST
#execute if entity @e[tag=helper_1,tag=dEast] if entity @e[tag=side_start,tag=!searching] run say execution will NOT continue EAST
execute if entity @e[tag=helper_1,tag=dEast] if entity @e[tag=side_start,tag=searching] run function mn:maze_gen/cell/edge/east/start