# South levers (Facing North)
scoreboard players set min RNG 0
scoreboard players set max RNG 4

function mn:rng/get-rng

execute if score output RNG matches 0 at @s run setblock ~ ~-3 ~2 structure_block[mode=load]{name:"minecraft:lever_south_1",posX:-2,posY:0,posZ:-2,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
execute if score output RNG matches 1 at @s run setblock ~ ~-3 ~2 structure_block[mode=load]{name:"minecraft:lever_south_2",posX:-2,posY:0,posZ:-2,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
execute if score output RNG matches 2 at @s run setblock ~ ~-3 ~2 structure_block[mode=load]{name:"minecraft:lever_south_3",posX:-2,posY:0,posZ:-2,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
execute if score output RNG matches 3 at @s run setblock ~ ~-3 ~2 structure_block[mode=load]{name:"minecraft:lever_south_4",posX:-2,posY:0,posZ:-2,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace

execute at @s run setblock ~ ~-2 ~2 redstone_block replace