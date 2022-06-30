# Pick up for now...
scoreboard players set min RNG 0
scoreboard players set max RNG 2

function mn:rng/get-rng
execute if score output RNG matches 1 as @s run function mn:maze_gen/cell/pick_elevator