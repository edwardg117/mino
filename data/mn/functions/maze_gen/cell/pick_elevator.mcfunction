execute at @s positioned ~ ~7 ~ run function mn:maze_gen/cell/create
execute at @s positioned ~ ~7 ~ run scoreboard players operation @e[tag=cell,distance=..1] level = @s level
execute at @s positioned ~ ~7 ~ run scoreboard players add @e[tag=cell,distance=..1] level 1
# Apply Skin
scoreboard players set min RNG 0
scoreboard players set max RNG 5

function mn:rng/get-rng


#execute at @s run fill ~ ~ ~ ~ ~7 ~ minecraft:purple_concrete
execute at @s if score output RNG matches 0..1 run setblock ~ ~ ~ structure_block[mode=load]{name:"minecraft:5x5_ladder_bottom",posX:-2,posY:0,posZ:-2,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
execute at @s if score output RNG matches 0..1 run setblock ~ ~7 ~ structure_block[mode=load]{name:"minecraft:5x5_ladder_top",posX:-2,posY:0,posZ:-2,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace

execute at @s if score output RNG matches 2..3 run setblock ~ ~ ~ structure_block[mode=load]{name:"minecraft:5x5_stairs_bottom1",posX:-2,posY:0,posZ:-2,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
execute at @s if score output RNG matches 2..3 run setblock ~ ~7 ~ structure_block[mode=load]{name:"minecraft:5x5_stairs_top1",posX:-2,posY:0,posZ:-2,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace

execute at @s if score output RNG matches 4 run setblock ~ ~ ~ structure_block[mode=load]{name:"minecraft:5x5_intersection",posX:-2,posY:0,posZ:-2,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
execute at @s if score output RNG matches 4 run setblock ~ ~7 ~ structure_block[mode=load]{name:"minecraft:5x5_explosive_room",posX:-2,posY:0,posZ:-2,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace
setblock ~ ~1 ~ redstone_block
setblock ~ ~8 ~ redstone_block
#########
execute as @e[tag=needs_pre_proc] at @s as @e[distance=..2.1,tag=connector] at @s if entity @e[distance=..1.5,tag=no_path] run summon armor_stand ~ ~ ~ {CustomNameVisible:0b,NoGravity:1b,Marker:1b,Tags:["maze_gen","no_path"],CustomName:'{"text":"No Path","color":"dark_red"}',Invisible:1b}
tag @s add gone_up
execute at @s positioned ~ ~7 ~ run tag @e[distance=..1,tag=cell] add gone_up