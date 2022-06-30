# Adds a skin and or a special tile segment
# Special?
scoreboard players set min RNG 0
scoreboard players set max RNG 100

function mn:rng/get-rng


#execute if score output RNG > freq_special settings as @e[tag=cell,tag=processing] at @s positioned ~2 ~ ~ if entity @e[distance=0..0.1,tag=path] run fill ~ ~ ~ ~-2 ~ ~ minecraft:lime_concrete
#execute if score output RNG > freq_special settings as @e[tag=cell,tag=processing] at @s positioned ~-2 ~ ~ if entity @e[distance=0..0.1,tag=path] run fill ~ ~ ~ ~2 ~ ~ minecraft:lime_concrete
#execute if score output RNG > freq_special settings as @e[tag=cell,tag=processing] at @s positioned ~ ~ ~2 if entity @e[distance=0..0.1,tag=path] run fill ~ ~ ~ ~ ~ ~-2 minecraft:lime_concrete
#execute if score output RNG > freq_special settings as @e[tag=cell,tag=processing] at @s positioned ~ ~ ~-2 if entity @e[distance=0..0.1,tag=path] run fill ~ ~ ~ ~ ~ ~2 minecraft:lime_concrete

#execute if score output RNG <= freq_special settings as @e[tag=cell,tag=processing] at @s positioned ~2 ~ ~ if entity @e[distance=0..0.1,tag=path] run fill ~ ~ ~ ~-2 ~ ~ minecraft:blue_concrete
#execute if score output RNG <= freq_special settings as @e[tag=cell,tag=processing] at @s positioned ~-2 ~ ~ if entity @e[distance=0..0.1,tag=path] run fill ~ ~ ~ ~2 ~ ~ minecraft:blue_concrete
#execute if score output RNG <= freq_special settings as @e[tag=cell,tag=processing] at @s positioned ~ ~ ~2 if entity @e[distance=0..0.1,tag=path] run fill ~ ~ ~ ~ ~ ~-2 minecraft:blue_concrete
#execute if score output RNG <= freq_special settings as @e[tag=cell,tag=processing] at @s positioned ~ ~ ~-2 if entity @e[distance=0..0.1,tag=path] run fill ~ ~ ~ ~ ~ ~2 minecraft:blue_concrete

# Determine type
execute as @e[tag=cell,tag=processing] at @s positioned ~2 ~ ~ if entity @e[distance=0..0.1,tag=path] run tag @s add east
execute as @e[tag=cell,tag=processing] at @s positioned ~-2 ~ ~ if entity @e[distance=0..0.1,tag=path] run tag @s add west
execute as @e[tag=cell,tag=processing] at @s positioned ~ ~ ~2 if entity @e[distance=0..0.1,tag=path] run tag @s add south
execute as @e[tag=cell,tag=processing] at @s positioned ~ ~ ~-2 if entity @e[distance=0..0.1,tag=path] run tag @s add north

execute if score output RNG >= freq_special settings as @e[tag=cell,tag=processing] at @s if entity @s[tag=east,tag=west,tag=north,tag=south] run function mn:maze_gen/cell/skin/regular/intersection
execute if score output RNG < freq_special settings as @e[tag=cell,tag=processing] at @s if entity @s[tag=east,tag=west,tag=north,tag=south] run function mn:maze_gen/cell/skin/special/intersection
# T-sections
execute as @e[tag=cell,tag=processing] at @s if entity @s[tag=east,tag=west,tag=north,tag=!south] run setblock ~ ~ ~ structure_block[mode=load]{name:"minecraft:5x5_intersection_no_south",posX:-2,posY:0,posZ:-2,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
execute as @e[tag=cell,tag=processing] at @s if entity @s[tag=east,tag=west,tag=!north,tag=south] run setblock ~ ~ ~ structure_block[mode=load]{name:"minecraft:5x5_intersection_no_north",posX:-2,posY:0,posZ:-2,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
execute as @e[tag=cell,tag=processing] at @s if entity @s[tag=east,tag=!west,tag=north,tag=south] run setblock ~ ~ ~ structure_block[mode=load]{name:"minecraft:5x5_intersection_no_west",posX:-2,posY:0,posZ:-2,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
execute as @e[tag=cell,tag=processing] at @s if entity @s[tag=!east,tag=west,tag=north,tag=south] run setblock ~ ~ ~ structure_block[mode=load]{name:"minecraft:5x5_intersection_no_east",posX:-2,posY:0,posZ:-2,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace

# Straights
execute if score output RNG >= freq_special settings as @e[tag=cell,tag=processing] at @s if entity @s[tag=!east,tag=!west,tag=north,tag=south] run function mn:maze_gen/cell/skin/regular/straight_ns
execute if score output RNG < freq_special settings as @e[tag=cell,tag=processing] at @s if entity @s[tag=!east,tag=!west,tag=north,tag=south] run function mn:maze_gen/cell/skin/special/straight_ns
execute if score output RNG >= freq_special settings as @e[tag=cell,tag=processing] at @s if entity @s[tag=east,tag=west,tag=!north,tag=!south] run function mn:maze_gen/cell/skin/regular/straight_ew
execute if score output RNG < freq_special settings as @e[tag=cell,tag=processing] at @s if entity @s[tag=east,tag=west,tag=!north,tag=!south] run function mn:maze_gen/cell/skin/special/straight_ew
# Dead ends
execute as @e[tag=cell,tag=processing] at @s if entity @s[tag=!east,tag=!west,tag=!north,tag=south] run setblock ~ ~ ~ structure_block[mode=load]{name:"minecraft:5x5_deadend_north",posX:-2,posY:0,posZ:-2,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
execute as @e[tag=cell,tag=processing] at @s if entity @s[tag=!east,tag=!west,tag=north,tag=!south] run setblock ~ ~ ~ structure_block[mode=load]{name:"minecraft:5x5_deadend_south",posX:-2,posY:0,posZ:-2,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
execute as @e[tag=cell,tag=processing] at @s if entity @s[tag=!east,tag=west,tag=!north,tag=!south] run setblock ~ ~ ~ structure_block[mode=load]{name:"minecraft:5x5_deadend_east",posX:-2,posY:0,posZ:-2,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
execute as @e[tag=cell,tag=processing] at @s if entity @s[tag=east,tag=!west,tag=!north,tag=!south] run setblock ~ ~ ~ structure_block[mode=load]{name:"minecraft:5x5_deadend_west",posX:-2,posY:0,posZ:-2,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
# Corners
execute as @e[tag=cell,tag=processing] at @s if entity @s[tag=east,tag=!west,tag=north,tag=!south] run setblock ~ ~ ~ structure_block[mode=load]{name:"minecraft:5x5_corner_north_east",posX:-2,posY:0,posZ:-2,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
execute as @e[tag=cell,tag=processing] at @s if entity @s[tag=!east,tag=west,tag=north,tag=!south] run setblock ~ ~ ~ structure_block[mode=load]{name:"minecraft:5x5_corner_north_west",posX:-2,posY:0,posZ:-2,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
execute as @e[tag=cell,tag=processing] at @s if entity @s[tag=east,tag=!west,tag=!north,tag=south] run setblock ~ ~ ~ structure_block[mode=load]{name:"minecraft:5x5_corner_south_east",posX:-2,posY:0,posZ:-2,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
execute as @e[tag=cell,tag=processing] at @s if entity @s[tag=!east,tag=west,tag=!north,tag=south] run setblock ~ ~ ~ structure_block[mode=load]{name:"minecraft:5x5_corner_south_west",posX:-2,posY:0,posZ:-2,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace


execute as @e[tag=cell,tag=processing] at @s run setblock ~ ~1 ~ redstone_block