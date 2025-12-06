# Dear Data 100 - Chess Game Data

A Processing sketch that visualises the data of 100 chess games that I've played. 

## The Data

The data is stored in a [.csv file](sketch/data/chess_data.csv). Each chess game has the following data:

- **Game Number**
  - Integer in the range [1, 100]
  - Represents what game it is

- **Win**
  - Integer that is either 1 or 0
  - 1 represents a win, whereas 0 represents a loss

- **Accuracy**
  - A percentage to 1 decimal place
  - Represents how accurate my moves were in the game


## Visualisation & Interactivity 

There are 2 visualisation modes - grid and graph. They represent the same data but in different ways. For both modes, you can hover the mouse over a data plot to get the exact data of that specific game.

### Controls
- **G** - Switch between grid and graph visualisation modes
- **T** - Toggle the average accuracy line
- **Mouse Hover** - Show exact data for a specific game
