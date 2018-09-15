

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

// This types create defines a player, their attributes, and the things they
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
        
        var carrier = Ship(name: "Carrier", length: 5, symbol: "c", hits: 0)
        var battleship = Ship(name: "Battleship", length: 4, symbol: "b", hits: 0)
        var crusier = Ship(name: "Crusier", length: 3, symbol: "r", hits: 0)
        var submarine = Ship(name: "Submarine", length: 3, symbol: "s", hits: 0)
        var destroyer = Ship(name: "Destroyer", length: 2, symbol: "d", hits: 0)
        
        
        
        var playerShips = [carrier, battleship, crusier, submarine, destroyer]
        
        print("Here is the current Board")
        print(battleShipBoard)
        
        return playerShips
    }
    
    func checkShipSpace(playerShip: Ship, board: BattleshipBoard, randRow: Int, randColumn: Int, orientation: Int) -> (Int, Int, Int, Int){
        var workingBoard = board
        let randomTuple1 = generateRandomCoordinatesPlayer1()
        let randomTuple2 = generateRandomCoordinatesPlayer2()
        var randRow = randomTuple1.0
        var randColumn = randomTuple1.1
        var orientation = randomTuple1.2
        let shipLength = playerShip.length
        var isShipOkToPlace = true
        var counterCheck: Int = 0
        
        
        
            while isShipOkToPlace == true{
    
                if orientation == 1{
                let rowLength = workingBoard.grid[randRow].count
                    
                for i in randRow..<(shipLength + randRow){
                    if i >= rowLength{
                        randRow -= 2
                        break
                    }
                    if i < rowLength && workingBoard.grid[randRow][i].symbol == "-" {
                        
                        isShipOkToPlace = false
                        if randRow == (shipLength + randRow){
                            isShipOkToPlace = true
                        }
                        //print("Horizontal")
                       counterCheck += 1
                        
                        }
                    else {
                        isShipOkToPlace = true
                    }
                    }
                if isShipOkToPlace == false{
                    //randColumn = Int(arc4random_uniform(9))
                }
                }
                    
                
                
                if orientation == 0{
                let columnLength = workingBoard.grid[randColumn].count
                    
                    for i in randColumn..<(shipLength + randColumn){
                        if i >= columnLength{
                            randColumn -= 2
                            break
                        }
                        if i < columnLength && workingBoard.grid[i][randColumn].symbol == "-"{
                            isShipOkToPlace = false
                            if randColumn == (shipLength + randColumn){
                                isShipOkToPlace = true
                            }
                            //print("Vertical")
                            counterCheck += 1
                        }
                        else{
                            isShipOkToPlace = true
                        }
                    }
                    if isShipOkToPlace == false{
                        //randRow = Int(arc4random_uniform(9))
                    }
                }
               // print("Column: \(randRow), Row: \(randColumn)")
        }
        
        return ( randRow, randColumn, orientation, counterCheck)
        }
    
    func generateRandomCoordinatesPlayer1() -> (Int,Int,Int){
        
        var randRow = Int(arc4random_uniform(10))
        var randColumn = Int(arc4random_uniform(10))
        let orientationRandomizer = Int(arc4random_uniform(2))
        if randColumn == 10{
            randColumn -= 1
        }
        if randRow == 10{
            randRow -= 1
        }
        
        return (randRow, randColumn, orientationRandomizer)
    }
    
    func generateRandomCoordinatesPlayer2() -> (Int,Int,Int){
        
        var randRow = Int(arc4random_uniform(10))
        var randColumn = Int(arc4random_uniform(10))
        let orientationRandomizer = Int(arc4random_uniform(2))
        print(randColumn)
        print(randRow)
        if randColumn == 10{
            randColumn -= 1
        }
        if randRow == 10{
            randRow -= 1
        }
        return (randRow, randColumn, orientationRandomizer)
    }
    
    func placeShipOnBoard( playerShip: Ship, board: BattleshipBoard, randRow: Int, randColumn: Int, Orientation: Int) -> BattleshipBoard{
        var randRow = randRow
        var randColumn = randColumn
        var workingBoard = board
        var ship = workingBoard.grid[randRow][randColumn].symbol
        for length in 0..<playerShip.length{
            workingBoard.grid[randRow][randColumn].symbol = playerShip.symbol
            if Orientation == 1{
                workingBoard.grid[randRow][randColumn].symbol = playerShip.symbol
                randColumn += 1
                
            }
            if Orientation == 0{
                workingBoard.grid[randRow][randColumn].symbol = playerShip.symbol
                randRow += 1
            }
        }
        
        return workingBoard
    }



    func fireOnUnknownSpot() -> (Int,Int){
        print("Where would you like to fire? Enter row number first, then space, then column\n")

        
        
        var rowChoice: String = ""
        var columnChoice: String = ""

        var EntryOptional = readLine()
        var entry = EntryOptional!
        columnChoice = String(entry.suffix(1))
        rowChoice = String(entry.prefix(1))
            
        var columnNumber = Int(columnChoice)
        var rowNumber = Int(rowChoice)
            
        var realColumn = columnNumber!
        var realRow = rowNumber!
         
        print("You fired on \(rowChoice),\(columnChoice)")
            
          return (realRow, realColumn)
        }
    
        
            }

   
    func gameWonYet(sinkCounter1: Int, sinkCounter2: Int)  -> String{
        var response: String = ""
        
        if sinkCounter1 == 5{
            response = ("Player 2 has won!")
            print(response)
        }
        if sinkCounter2 == 5{
            response = ("Player 1 has won!")
            print(response)
        }
    return response
        }
    

