
//
//  Player.swift
//  Battleship
//
//  Created by Reid, Jon Carl on 9/9/18.
//  Copyright © 2018 Reid, Jon Carl. All rights reserved.
//
import Foundation

struct Player: CustomStringConvertible{
    
    
    var description: String{
        return " \(battleShipBoard)"
    }
      
    var battleShipBoard: BattleshipBoard
    var ships: [Ship]
    var playerNumber: Int
    
    
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
        let randomTuple = generateRandomCoordinates()
        var randRow = randomTuple.0
        var randColumn = randomTuple.1
        var orientation = randomTuple.2
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
                        randColumn = Int(arc4random_uniform(10))
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
                        randRow = Int(arc4random_uniform(10))
                    }
                }
               // print("Column: \(randRow), Row: \(randColumn)")
        }
        
        return ( randRow, randColumn, orientation, counterCheck)
        }
    
    func generateRandomCoordinates() -> (Int,Int,Int){
        
        let randRow = Int(arc4random_uniform(10))
        let randColumn = Int(arc4random_uniform(10))
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
}


//    func fireOnUnknownSpot(){
//        print("Where would you like to fire? Enter row number first \n")
//
//        let rowChoice: Int = 0
//        let columnChoice: Int = 0
//
//        let rowEntryOptional = readLine()
//        print("Enter column number \n")
//        let columnEntryOptional = readLine()
//
//
//
//
//        if let columnEntryString = columnEntryOptional{
//            let columnChoiceOptional = Int(columnEntryString)
//            if let columnChoiceFinal = columnChoiceOptional{
//                let columnChoice = columnChoiceFinal
//            }
//
//        }
//
//        var firingCoords = Coordinates.init(row: rowChoice, column: columnChoice)
//        print("You chose to fire on \(rowChoice), \(columnChoice) \n")
//
//
//    }

