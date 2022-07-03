# What to do while there's still cells to process
# 1. Pick a cell
# Add cells on current level to the queue for this level
execute as @e[tag=cell,tag=!in_queue,tag=!at_limit] if score @s level = target_level vars run tag @s add in_queue
# If no more cells in queue, generate around the edges from end to end
execute unless entity @e[tag=cell,tag=in_queue] run function mn:maze_gen/cell/edge/edge_generation
# Place switches
#######################################################################################################################################################################
## Cull connectors on edges to prevent generating switches outside of range
execute unless entity @e[tag=cell,tag=in_queue] as @e[tag=no_path] run function mn:maze_gen/cell/find_dist
execute unless entity @e[tag=cell,tag=in_queue] as @e[tag=no_path] if score @s dist_frm_strt > target_size settings run kill @s
# Run switch placer function
execute unless entity @e[tag=cell,tag=in_queue] run function mn:maze_gen/lever/add_levers
#######################################################################################################################################################################
# If no more cells, clean up extra armor stands to help with lag
execute unless entity @e[tag=cell,tag=in_queue] as @e[tag=no_path] run kill @s
# If no more cells, increase the level tracker by 1 (if target_level = target_levels, no more elevators will be made)
execute unless entity @e[tag=cell,tag=in_queue] run scoreboard players add target_level vars 1

# Pick valid cell from the queue
tag @e[tag=cell,tag=in_queue,tag=!processed,sort=random,limit=1] add processing
# 2. Process Cell
execute as @e[tag=cell,tag=processing] run function mn:maze_gen/cell/process_cell
# 3. Apply skin (place tile/segment)
execute if entity @e[tag=cell,tag=processing,tag=!gone_up,tag=!at_limit] run function mn:maze_gen/cell/apply_skin
# 3.1 if all cells generated except edges, start generating from edges

# 4. Generate new cells through paths (done in process_cell)

# Removing excess armor stands to reduce lag
# new
execute at @e[tag=cell,tag=processing,tag=!at_limit] as @e[distance=..2.1,tag=path] run kill @s
execute at @e[tag=cell,tag=processing] as @e[distance=..2.1,tag=no_path] at @s if entity @e[tag=no_path,distance=0.9..1.1] run kill @e[tag=no_path,distance=..1.1]

# 5. Remove from process list
#tag @e[tag=cell,tag=processing] add processed
#tag @e[tag=cell,tag=processing] remove processing
# Only kill cells that don't need post processing (eg edge cells)
kill @e[tag=cell,tag=processing,tag=!at_limit]
# If cell wasn't culled, remove tags so they don't get processed here again
tag @e[tag=cell,tag=processing] remove in_queue
tag @e[tag=cell,tag=processing] remove processing

scoreboard players add segments_made vars 1
execute store result score entities vars if entity @e[tag=maze_gen]
# 6. continue if more cells exist --> @e[tag=cell,tag=!processed]
execute if entity @e[tag=cell,tag=!processed] run schedule function mn:maze_gen/cell/tick 1t
execute if entity @e[tag=cell,tag=!processed] run scoreboard players set isGenerating vars 1
execute unless entity @e[tag=cell,tag=!processed] run scoreboard players set isGenerating vars 0
#say done processing
#/kill @e[tag=maze_gen]

