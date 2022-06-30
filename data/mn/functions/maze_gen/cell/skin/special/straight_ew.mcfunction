# Places special staright East-West pieces
scoreboard players set min RNG 0
scoreboard players set max RNG 1

function mn:rng/get-rng


execute if score output RNG matches 0 at @s run setblock ~ ~ ~ structure_block[mode=load]{name:"minecraft:5x5_noise_gate",posX:-2,posY:0,posZ:-2,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
