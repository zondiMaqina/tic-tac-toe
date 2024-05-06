# tic-tac-toe
> [!NOTE]
> The user interface of the game is on the command line ran by the command `irb -r file_name.rb`
> if you have ruby installed 

# Aim of project 
This is a simple game of TicTacToe where two players play against each other wil representitive letters of `X` and `O`.

the structure of game looks like this below:

<img src="./images/tic-tac-toe.png" alt="display of image" width="200px" height="200px">

The first player to draw their *representitive letter* (X/O) diagonally, horizontally in any directon 3 times in a row wins

## Development 
**I will create the same logic of a game using _Object Oriented Programming_**
The program must support `Encapsulation` and `Exception Handling`

## Structure 
- There will be a `Class` for controlling amount of players and their moves => Players
- There will be a `Class` for controlling the loop of the game => Game

## Challenges and Solutions
I had trouble using the `loop` to control user input 

i first put the user input outside the loop but then i realised it makes more sense when its inside

```
move = String.new

until move == 'X' of move == 'O'
    ...
end
```

The code will run till player puts in `X` or `O`