# Create new cell here
summon armor_stand ~ ~ ~ {CustomNameVisible:0b,NoGravity:1b,Marker:1b,Tags:["maze_gen","cell","new_cell"],CustomName:'{"text":"Cell","color":"aqua"}',Invisible:1b}
execute at @e[tag=new_cell] positioned ~2 ~ ~ run summon armor_stand ~ ~ ~ {CustomNameVisible:0b,NoGravity:1b,Marker:1b,Tags:["maze_gen","connector","East"],CustomName:'{"text":"Connector","color":"gold"}',Invisible:1b}
execute at @e[tag=new_cell] positioned ~-2 ~ ~ run summon armor_stand ~ ~ ~ {CustomNameVisible:0b,NoGravity:1b,Marker:1b,Tags:["maze_gen","connector","West"],CustomName:'{"text":"Connector","color":"gold"}',Invisible:1b}
execute at @e[tag=new_cell] positioned ~ ~ ~2 run summon armor_stand ~ ~ ~ {CustomNameVisible:0b,NoGravity:1b,Marker:1b,Tags:["maze_gen","connector","South"],CustomName:'{"text":"Connector","color":"gold"}',Invisible:1b}
execute at @e[tag=new_cell] positioned ~ ~ ~-2 run summon armor_stand ~ ~ ~ {CustomNameVisible:0b,NoGravity:1b,Marker:1b,Tags:["maze_gen","connector","North"],CustomName:'{"text":"Connector","color":"gold"}',Invisible:1b}

scoreboard players set @e[tag=new_cell] seg_frm_strt 0
scoreboard players set @e[tag=new_cell] con_left 3

tag @e[tag=new_cell] remove new_cell