# Generates a random number
# Stolen parts from https://www.reddit.com/r/MinecraftCommands/wiki/questions/randomnumber because it works in 1.16 and 1.17

# Calc range
scoreboard players operation range RNG = max RNG
scoreboard players operation range RNG -= min RNG
# Get random number
summon armor_stand 0 0 0 {Tags:["random_uuid"]}
execute store result score output RNG run data get entity @e[type=armor_stand,tag=random_uuid,limit=1] UUID[0] 1
kill @e[type=armor_stand,tag=random_uuid]
# Mod result
scoreboard players operation output RNG %= range RNG
# Shift back to original range
scoreboard players operation output RNG += min RNG