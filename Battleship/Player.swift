//  Player.swift
//  Battleship
//
//  This file houses the player type
//  CPSC 312
//  Programming assignment #2
//  No sources to site
//
//  Created by Reid, Jon Carl on 9/9/18.
//  Copyright © 2018 Reid, Jon Carl. All rights reserved.
//
import Foundation

// This types create defines a player, their properties, and the things they
// can do during the game.

struct Player: CustomStringConvertible{                                                                 // This struct conforms to the CustonStringConvertible type,
                                                                                                        // returning the statistics of the player if desired.
    
    
    var description: String{                                                                            // This description defines the statistics of the player
        var statistics = ""                                                                             // during the past game.
        statistics += "Hits: \(hits)\n"                                                                 // An empty string is created, and the hits, misses, total shots
        statistics += "Misses: \(misses)\n"                                                             // fired, and a hits to miss ratio are computed and displayed.
        statistics += "Total Shots: \(totalShots)\n"
        statistics += "Hits to Misses Ratio: \(hits/(hits + misses)*100)%"
        return statistics
    }
      
    var battleShipBoard: BattleshipBoard                                                                // A player has their own board, their five ships stored in an array,
    var ships: [Ship]                                                                                   // and a player number.
    var playerNumber: Int
    
    var hits: Int = 0                                                                                   // Here, the hits, misses, and total shots are initialized to zero.
    var misses: Int = 0
    var totalShots: Int = 0
    
    var shipsLeft: Int                                                                                  // Additionally, a counter variable is defined to track the number of
                                                                                                        // ships a player has left.
    /* This function creates the five ships each player has, and
       returns them in an array of ship objects.*/
    
    
    func createShipsOnBoard() -> [Ship]{
        
        let carrier = Ship(name: "Carrier", length: 5, symbol: "c", hits: 0)                            // Each ship is initialized to their name, length, symbol, and number of hits
        let battleship = Ship(name: "Battleship", length: 4, symbol: "b", hits: 0)                      // individually.
        let crusier = Ship(name: "Crusier", length: 3, symbol: "r", hits: 0)
        let submarine = Ship(name: "Submarine", length: 3, symbol: "s", hits: 0)
        let destroyer = Ship(name: "Destroyer", length: 2, symbol: "d", hits: 0)
        
        let playerShips = [carrier, battleship, crusier, submarine, destroyer]                          // Each Ship object is placed in an array of ships for the user to access.
        
        return playerShips                                                                              // Returns an array of Ships
    }
    
    /* This function checks to see if the ship has enough room to be
       placed in a random location chosen randomly. It takes individiual
       ships, the board they are placed on, the random row and column indexes,
       as well as a random orientation value to deliniate horizonal or
       vertical positioning. This functions returns a tuple of integers that can
       be accessed by the placeShipsOnBoard method*/
    
    func checkShipSpace(playerShip: Ship, board: BattleshipBoard, randRow: Int, randColumn: Int, orientation: Int) -> (Int, Int, Int){
        
        let workingBoard = board                                                                                // A local copy of a board Object is created.
        let randomTuple1 = generateRandomCoordinatesPlayer1()                                                   // Random orientation and coordinates are created.
        
        let randRow = randomTuple1.0                                                                            // Each integer is stripped from the tuple and
        let randColumn = randomTuple1.1                                                                         // assigned to its own local variable
        let orientation = randomTuple1.2
        
        let shipLength = playerShip.length                                                                      // Ship length is declared as a local variable
        var isShipOkToPlace = true                                                                              // Default boolean, the space is fine until proven otherwise
        
        while isShipOkToPlace == true{                                                                          // Maintain loop while the ship has room to be placed

            if orientation == 1{                                                                                // Case for Horizontal orientation
                
            let rowLength = workingBoard.grid[randRow].count                                                    // Establishes rowLength of current row index as local comparable variable
            for i in randRow..<(shipLength + randRow){                                                          // Starts the loop at the index of the random row index and checks enough
                                                                                                                // spots to cover the length of the ship.
                if i >= rowLength{                                                                              // If the index is out of range, this breaks out of the loop.
                    break
                }
                if i < rowLength && workingBoard.grid[randRow][i].symbol == "-" {                               // Checks if the index is valid and the grid slot is empty.
                    isShipOkToPlace = false                                                                     // If slot is ok, nothing happens and the loop moves to the next avaliable slot.
                    
                    if randRow == (shipLength + randRow){
                        isShipOkToPlace = true
                        }
                    }
                else {
                    isShipOkToPlace = true
                    }
                }
            
            }
            
            if orientation == 0{                                                                                 // This block of code is the same as above, but for the vertical position,
                                                                                                                 // as delineated by the orientation counter.
            let columnLength = workingBoard.grid[randColumn].count
                for i in randColumn..<(shipLength + randColumn){
                    if i >= columnLength{
                        break
                    }
                    if i < columnLength && workingBoard.grid[i][randColumn].symbol == "-"{
                        isShipOkToPlace = false
                        if randColumn == (shipLength + randColumn){
                            isShipOkToPlace = true
                        }
                    }
                    else{
                        isShipOkToPlace = true
                    }
                }
            }
           
    }
        
        return (randRow, randColumn, orientation)                                                                // This returns a valid tuple of integers that the placeShipsOnBoard function
        }                                                                                                        // knows will work. Unfortunately, I could not fix the bug where the index goes
                                                                                                                 // out of range. Sometimes, the boards are generated correctly, but at times
                                                                                                                 // they fail because the index is out of range.
    
    
    /* This function generates a unique set of coordinates to be tested for the placement
       of player one's ships. This function returns a tuple of integers to be stripped by the
       function above, checkSpaces, to see if they are valid indexes on the board.*/
   
    func generateRandomCoordinatesPlayer1() -> (Int,Int,Int){
        
        var randRow = Int(arc4random_uniform(10))                                                                // These functions cast random row, column, and orientation values as
        var randColumn = Int(arc4random_uniform(10))                                                             // Int's for use in other methods.
        let orientationRandomizer = Int(arc4random_uniform(2))
        
        if randColumn == 10{                                                                                     // These two if statements are supposed to check if the index
            randColumn -= 1                                                                                      // is too big, and reduce the index size.
        }
        if randRow == 10{
            randRow -= 1
        }
        
        return (randRow, randColumn, orientationRandomizer)                                                       // This returns the aformentioned tuple of integers.
    }
    
    func generateRandomCoordinatesPlayer2() -> (Int,Int,Int){                                                     // This method works exactly the same as the one above.
                                                                                                                  // It was made to generate another unique set of coordinates to be used
                                                                                                                  // for ship placement.
        var randRow = Int(arc4random_uniform(10))
        var randColumn = Int(arc4random_uniform(10))
        let orientationRandomizer = Int(arc4random_uniform(2))                                                    //  ""                             ""
        
        if randColumn == 10{
            randColumn -= 1
        }
        if randRow == 10{
            randRow -= 1
        }
        return (randRow, randColumn, orientationRandomizer)
    }
    
    /* This method takes valid indexes determined by the checkSpaces method
       and places ships in their valid coordinate locations on the players'
       respective board. The function takes the parameters of the individual
       ship to be placed, the board it will be placed on, the random valid coordinates,
       and its orientation on the board. This method returns an updated copy of the board. */
    
    
    func placeShipOnBoard( playerShip: Ship, board: BattleshipBoard, randRow: Int, randColumn: Int, Orientation: Int) -> BattleshipBoard{
        
        var randRow = randRow                                                                                                // These are all locally defined variables of the passed
        var randColumn = randColumn                                                                                          // in parameters
        let workingBoard = board
        
        _ = workingBoard.grid[randRow][randColumn].symbol                                                                    // This variable holds the symbol of the cell being placed in.
        
        for _ in 0..<playerShip.length{                                                                                      // This loop walks through the length of the ship.
           
            workingBoard.grid[randRow][randColumn].symbol = playerShip.symbol                                                // This applies the symbol of the current ship parameter
                                                                                                                             // to its respective place on the grid.
            if Orientation == 1{                                                                                             // If the ship is to be placed horizontally, then this increases
                workingBoard.grid[randRow][randColumn].symbol = playerShip.symbol                                            // the column index to push it in that way.
                randColumn += 1
                
            }
            if Orientation == 0{                                                                                             // If the ship is to be placed vertically, then this increases
                workingBoard.grid[randRow][randColumn].symbol = playerShip.symbol                                            // the row index to push it in that way.
                randRow += 1
            }
        }
        
        return workingBoard                                                                                                  // This returns a current, updated copy of the board to be futher
    }                                                                                                                        // added upon.

    /* This method takes user input for a row and column location
       on the grid and translates it into a tuple of integers, which can be
       stripped by checkMove method in the Cell struct. */
    
    func fireOnUnknownSpot() -> (Int,Int){
        print("")
        print("Look to the lower grid:")
        print("Where would you like to fire? Enter row number 1st, then space, then column number\n")                       // The user is prompted how to correctly enter a valid input.
        
        var rowChoice: String = ""                                                                                          // Since the readline statement is of type String?, two strings
        var columnChoice: String = ""                                                                                       // initialized to contain their input.

        let EntryOptional = readLine()                                                                                      // The input is created here and is unwrapped using force unwrapping.
        let entry = EntryOptional!
        columnChoice = String(entry.suffix(1))                                                                              // Since the column choice is 2nd, it is stripped from the string using
        rowChoice = String(entry.prefix(1))                                                                                 // the suffix method, and vice-versa for the row value.
            
        let columnNumber = Int(columnChoice)                                                                                // These type-casted Strings are again converted to integers,
        let rowNumber = Int(rowChoice)                                                                                      // which are further unwrapped below using force unwrapping.
            
        let realColumn = columnNumber!
        let realRow = rowNumber!
        
        print("")
        print("You fired on \(rowChoice),\(columnChoice) \n")                                                                  // This reminds the user where they chose to fire.
            
          return (realRow, realColumn)                                                                                      // Here, a tuple is returned to be stripped by the checkSpot method
        }                                                                                                                   // in the Cell struct.
    
            }

    /* This method decides when the game is to end, taking in the number of ships left
       from the players and returning a boolean value to interact with the gameWon loop in the
       battleshipGame instance. */

    func gameWonYet(sinkCounter1: Int, sinkCounter2: Int)  ->  Bool{
        var response: Bool =  false                                                                                         // Initially, the repsonse it set to continue the game.
        
        if sinkCounter1 == 5{                                                                                               // If either of the players sinkCounters shows all 5 ships sunk,
            response = true                                                                                                 // then the game is over.
        }
        if sinkCounter2 == 5{
            response = true
        }
    return response
        }




