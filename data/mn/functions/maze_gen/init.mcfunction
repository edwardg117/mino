# Init maze gen functions
scoreboard objectives add settings dummy "Settings"
scoreboard objectives add vars dummy "Variables"
scoreboard objectives add const dummy "Constants"
scoreboard objectives add posX dummy
scoreboard objectives add posY dummy
scoreboard objectives add posZ dummy
scoreboard objectives add dist_frm_strt dummy "Distance From Start"
scoreboard objectives add seg_frm_strt dummy "Segments/Tiles from start"
scoreboard objectives add con_left dummy "Connectors this Cell has left"
scoreboard objectives add num_path dummy "Number of paths from this cell"
scoreboard objectives add level dummy "Level of the Cell"
#scoreboard objectives add cell_state dummy "State:0-None,1-Processing,2-Done"

# Defaults
scoreboard players set target_size settings 50
# May change if segments change
scoreboard players set min_connectors settings 0
scoreboard players set max_connectors settings 4
# Start placing dead ends after this many tiles
scoreboard players set target_segments settings 300
# Frequency of special segments X%
scoreboard players set freq_special settings 20
# Fequency of Trap segments X% (unused)
scoreboard players set freq_traps settings 20
scoreboard players set target_levels settings 3
# Maximum number of switches (levers) to add per level
# It will try to add this entire ammount
scoreboard players set target_switches settings 3

scoreboard players set invert const -1
scoreboard players set const_100 const 100
scoreboard players set const_1 const 1
scoreboard players set const_10000 const 10000

scoreboard players set startX vars 0
scoreboard players set startY vars 0
scoreboard players set startZ vars 0

scoreboard players set total_segments vars 0
scoreboard players set dist_temp vars 0
scoreboard players set distX vars 0
scoreboard players set distY vars 0
scoreboard players set distZ vars 0
scoreboard players set target_temp vars 0
scoreboard players set allowed_connect vars 0
scoreboard players set segments_made vars 0
scoreboard players set target_level vars 0
scoreboard players set num_switches vars 0