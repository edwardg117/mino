# mino
Datapack for a maze generator that generates a random maze based on 5x5x7 (x,z and y respectively). Also includes functionality for the Minotaur game mode.

Every tick:
  1. Pick an empty cell.
  2. Pick a number between 0 and 3, scaled so that 3 is more likely to be chosen close to the center and 1 chosen further out.
  3. Randomly assign free connectors as Paths as many as chosen in step 2, make the rest No_Paths.
  3.1 If less than the ammount chosen in 2 can be assigned: 50% chance this cell is now a staircase, unless the cell was created this way.
  3.2 create a cell above this cell and mark it as a cell created by going up.
  3.3 Set the cell's level score to the chosen cell + 1
  4. For every Path: Create a new empty cell in the adjacent space.
  5. For every new cell: check each connector to see if there is a No_Path next to it. If found, remove both.
  6. Apply a valid skin to the chosen cell.
  7. Remove the chosen cell from the list of empty cells.
