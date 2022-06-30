# Places special staright Nort-South pieces
scoreboard players set min RNG 0
scoreboard players set max RNG 2

function mn:rng/get-rng


execute if score output RNG matches 0 at @s run setblock ~ ~ ~ structure_block[mode=load]{name:"minecraft:5x5_diode",posX:-2,posY:0,posZ:-2,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
execute if score output RNG matches 1 at @s run setblock ~ ~ ~ structure_block[mode=load]{name:"minecraft:5x5_swim_gate",posX:-2,posY:0,posZ:-2,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace