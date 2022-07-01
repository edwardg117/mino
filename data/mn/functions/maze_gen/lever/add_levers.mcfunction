# Attempts to add the desired number of switches
# Check how many spaces are available
execute store result score empty_spaces vars if entity @e[tag=no_path]
execute if score empty_spaces vars >= target_switches settings run say There is enough space
execute if score empty_spaces vars < target_switches settings run say There is not enough spaces