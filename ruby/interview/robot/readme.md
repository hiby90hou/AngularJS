# Toy Robot Simulator
This is a command line ruby app that simulate the movement of Toy Robot

## Install
1. If you haven't installed ruby, please follow the steps of  https://www.ruby-lang.org/en/documentation/installation/ to install ruby (This app is built under version 2.4.2).
2. Run `bundle` to install dependencies.
3. Run `ruby main.rb` to start the command line interface for the simulator.

## Intro
After you run the app, it will create a 5*5 table (bottom left corner is the origin(0,0)).

This simulator will ask user to enter a file path, and read commands from that file and run each command.
The valid command in file are:
```
PLACE X,Y,F
MOVE
LEFT
RIGHT
REPORT
```
* `PLACE X,Y,F` is to place the robot onto the table, 'X,Y' will be the coordinate and 'F' is the facing of the robot. X and Y should be between 0 and 4, 'F' should be one of 'NORTH', 'SOUTH', 'EAST' and 'WEST'. *Notice:* Any commands that is not in this form will be ignored.  
* `MOVE` is to move the robot one step foward depends on the facing. *Notice:* Any commands that will move the robot out of the game board will be ignored.
* `LEFT` is to make a left turn (If the robot is facing south, left turn will change the facing to east).
* `RIGHT` is to make a right turn.
* `REPORT` is to report the current position and facing of the robot.

The first command should be 'PLACE', any other commands before place will be ignored. An error will be raised if there is no place command in the file or it is an empty file.

## Example Input and Output:
a)
```
PLACE 0,0,NORTH
MOVE
REPORT
Output: 0,1,NORTH
```
b)
```
PLACE 0,0,NORTH
LEFT
REPORT
Output: 0,0,WEST
```
c)
```
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
Output: 3,3,NORTH
```

## Test
Run `rspec`