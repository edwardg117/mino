# Finds the furthest XYZ distance and records it to the armor stand (executer)
# Get coords
execute store result score @s posX run data get entity @s Pos[0]
#execute store result score @s posY run data get entity @s Pos[1]
execute store result score @s posZ run data get entity @s Pos[2]
# Math.abs()
#execute if score @s posX matches ..-1 run scoreboard players operation @s posX *= invert const
#execute if score @s posY matches ..-1 run scoreboard players operation @s posY *= invert const
#execute if score @s posZ matches ..-1 run scoreboard players operation @s posZ *= invert const
################# Calc #################
scoreboard players operation distX vars = @e[tag=start] posX
scoreboard players operation distX vars -= @s posX
execute if score distX vars matches ..-1 run scoreboard players operation distX vars *= invert const
# Set this value as the starting highest value
scoreboard players operation dist_temp vars = distX vars

#scoreboard players operation distY vars = @e[tag=start] posY
#scoreboard players operation distY vars -= @s posY
#execute if score distY vars matches ..-1 run scoreboard players operation distY vars *= invert const
# Is this further than x?
#execute if score dist_temp vars < distY vars run scoreboard players operation dist_temp vars = distY vars

scoreboard players operation distZ vars = @e[tag=start] posZ
scoreboard players operation distZ vars -= @s posZ
execute if score distZ vars matches ..-1 run scoreboard players operation distZ vars *= invert const
# Is this further than x?
execute if score dist_temp vars < distZ vars run scoreboard players operation dist_temp vars = distZ vars
############################################
# Math.abs()
execute if score dist_temp vars matches ..-1 run scoreboard players operation dist_temp vars *= invert const

scoreboard players operation @s dist_frm_strt = dist_temp vars