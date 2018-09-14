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

struct Player: CustomStringConvertible{
    
    
    var description: String{
        var statistics = ""
        statistics += "Hits: \(hits)\n"
        statistics += "Misses: \(misses)\n"
        statistics += "Total Shots: \(totalShots)\n"
        statistics += "Hits to Misses Ratio: \(hits/(hits + misses)*100)%"
        return statistics
    }
      
    var battleShipBoard: BattleshipBoard
    var ships: [Ship]
    var playerNumber: Int
    
    var hits: Int = 0
    var misses: Int = 0
    var totalShots: Int = 0
    
    var shipsLeft: Int
    
    func createShipsOnBoard() -> [Ship]{
        
        var carrier = Ship(name: "Carrier", length: 5, occupiedCells: [], symbol: "c", hits: 0)
        var battleship = Ship(name: "Battleship", length: 4, occupiedCells: [], symbol: "b", hits: 0)
        var crusier = Ship(name: "Crusier", length: 3, occupiedCells: [], symbol: "r", hits: 0)
        var submarine = Ship(name: "Submarine", length: 3, occupiedCells: [], symbol: "s", hits: 0)
        var destroyer = Ship(name: "Destroyer", length: 2, occupiedCells: [], symbol: "d", hits: 0)
        
        
        
        let playerShips = [carrier, battleship, crusier, submarine, destroyer]
        
        
        print(battleShipBoard)
        // print(playerShips)
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
                            break
                        }
                        if i < rowLength && workingBoard.grid[randRow][i].symbol == "-" {
                            
                            isShipOkToPlace = false
                            if randRow == (shipLength + randRow){
                                isShipOkToPlace = true
                            }
                            print("Horizontal")
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
                            break
                        }
                        if i < columnLength && workingBoard.grid[i][randColumn].symbol == "-"{
                            isShipOkToPlace = false
                            if randColumn == (shipLength + randColumn){
                                isShipOkToPlace = true
                            }
                            print("Vertical")
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
        
        let randRow = Int(arc4random_uniform(9))
        let randColumn = Int(arc4random_uniform(9))
        let orientationRandomizer = Int(arc4random_uniform(2))
        
        return (randRow, randColumn, orientationRandomizer)
    }
    
    func generateRandomCoordinatesPlayer2() -> (Int,Int,Int){
        
        let randRow = Int(arc4random_uniform(9))
        let randColumn = Int(arc4random_uniform(9))
        let orientationRandomizer = Int(arc4random_uniform(2))
        
        return (randRow, randColumn, orientationRandomizer)
    }
    
    func placeShipOnBoard(playerShip: Ship, board: BattleshipBoard, randRow: Int, randColumn: Int, Orientation: Int) -> BattleshipBoard{
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
    

