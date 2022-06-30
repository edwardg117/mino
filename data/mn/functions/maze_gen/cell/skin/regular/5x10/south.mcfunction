# 5x10 straights that go south
scoreboard players set min RNG 0
scoreboard players set max RNG 12

function mn:rng/get-rng
# eastwest pieces
execute if score output RNG matches 1 at @s run setblock ~ ~ ~ structure_block[mode=load]{name:"minecraft:5x10_eastwest_paintingtntswimtrap",posX:2,posY:0,posZ:-7,rotation:"CLOCKWISE_90",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
#FIXME update command blocks, give new number when fixed
#execute if score output RNG matches 2 at @s run setblock ~ ~ ~ structure_block[mode=load]{name:"minecraft:5x10_strangewalls_eastwest",posX:2,posY:0,posZ:-7,rotation:"CLOCKWISE_90",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
#execute if score output RNG matches 3 at @s run setblock ~ ~ ~ structure_block[mode=load]{name:"minecraft:5x10_eastwest_antigrav_hall",posX:2,posY:0,posZ:-7,rotation:"CLOCKWISE_90",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
# Regular northsouth pieces
execute if score output RNG matches 0 at @s run setblock ~ ~ ~ structure_block[mode=load]{name:"minecraft:5x10_template_ns",posX:-2,posY:0,posZ:-7,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
execute if score output RNG matches 4 at @s run setblock ~ ~ ~ structure_block[mode=load]{name:"minecraft:5x10_northsouth_moss_hall",posX:-2,posY:0,posZ:-7,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
execute if score output RNG matches 6 at @s run setblock ~ ~ ~ structure_block[mode=load]{name:"minecraft:5x10_one_way_hall_south",posX:-2,posY:0,posZ:-7,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
execute if score output RNG matches 7 at @s run setblock ~ ~ ~ structure_block[mode=load]{name:"minecraft:5x10_piston_hall",posX:-2,posY:0,posZ:-7,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
execute if score output RNG matches 8 at @s run setblock ~ ~ ~ structure_block[mode=load]{name:"minecraft:5x10_trapdoor_hall",posX:-2,posY:0,posZ:-7,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
execute if score output RNG matches 3 at @s run setblock ~ ~ ~ structure_block[mode=load]{name:"minecraft:5x10_warped_hall",posX:-2,posY:0,posZ:-7,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
execute if score output RNG matches 2 at @s run setblock ~ ~ ~ structure_block[mode=load]{name:"minecraft:5x10_water_hall",posX:-2,posY:0,posZ:-7,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
execute if score output RNG matches 9 at @s run setblock ~ ~ ~ structure_block[mode=load]{name:"minecraft:5x10_storage_hall",posX:-2,posY:0,posZ:-7,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
execute if score output RNG matches 10 at @s run setblock ~ ~ ~ structure_block[mode=load]{name:"minecraft:5x10_northsouth_cobweb_hall",posX:-2,posY:0,posZ:-7,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
execute if score output RNG matches 11 at @s run setblock ~ ~ ~ structure_block[mode=load]{name:"minecraft:5x10_northsouth_overgrown_hall",posX:-2,posY:0,posZ:-7,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace

# South one way
execute if score output RNG matches 5 at @s run setblock ~ ~ ~ structure_block[mode=load]{name:"minecraft:5x10_one_way_door_hall_south",posX:-2,posY:0,posZ:-7,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace


setblock ~ ~1 ~ redstone_block