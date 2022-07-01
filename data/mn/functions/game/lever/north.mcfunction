# Deals with lever functionality for a North lever
summon falling_block ~ ~-0.5 ~2 {BlockState:{Name:"minecraft:lever",Properties:{facing:"south",face:"wall",powered:"true"}},NoGravity:1b,Glowing:1b,Time:1,Tags:["lever"]}
function mn:game/lever/common_exit