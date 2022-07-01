# North levers (Facing South)
scoreboard players set min RNG 0
scoreboard players set max RNG 4

function mn:rng/get-rng

execute if score output RNG matches 0 at @s run setblock ~ ~-3 ~-3 structure_block[mode=load]{name:"minecraft:lever_north_1",posX:-2,posY:0,posZ:-2,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
execute if score output RNG matches 1 at @s run setblock ~ ~-3 ~-3 structure_block[mode=load]{name:"minecraft:lever_north_2",posX:-2,posY:0,posZ:-2,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
execute if score output RNG matches 2 at @s run setblock ~ ~-3 ~-3 structure_block[mode=load]{name:"minecraft:lever_north_3",posX:-2,posY:0,posZ:-2,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
execute if score output RNG matches 3 at @s run setblock ~ ~-3 ~-3 structure_block[mode=load]{name:"minecraft:lever_north_4",posX:-2,posY:0,posZ:-2,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace

execute at @s run setblock ~ ~-2 ~-3 redstone_block replace