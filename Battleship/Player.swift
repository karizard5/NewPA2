
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
    
    func checkShipSpace(playerShip: Ship, board: BattleshipBoard) -> BattleshipBoard{
        var randRow: Int
        var randColumn: Int
        var workingBoard = board
        
        randRow = Int(arc4random_uniform(10))
        randColumn = Int(arc4random_uniform(10))
        let orientationRandomizer = arc4random_uniform(2)
        let shipLength = playerShip.length
        var isShipOkToPlace = true
        
            while isShipOkToPlace == true{
                isShipOkToPlace = false
                
                if orientationRandomizer == 0{
                let rowLength = workingBoard.grid[randRow].count
                    for i in randRow..<(shipLength + randRow){
                        if i >= (rowLength)  || workingBoard.grid[randRow][i].symbol != "-" {
                            isShipOkToPlace = false
                           //randColumn = Int(arc4random_uniform(10))
                            
                            
                        }
                        
                    }
                    
                }
                
                if orientationRandomizer == 1{
                let columnLength = workingBoard.grid[randColumn].count
                    for i in randColumn..<(shipLength + randColumn){
                       
                        if i >= (columnLength) || workingBoard.grid[i][randColumn].symbol != "-"{
                            isShipOkToPlace = false
                            //randRow = Int(arc4random_uniform(10))
                            
                            
                            
                        }
                    }
                }
                print(randRow,randColumn)
            }
        
        workingBoard.grid[randRow][randColumn].symbol = playerShip.symbol
         return workingBoard
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
}
