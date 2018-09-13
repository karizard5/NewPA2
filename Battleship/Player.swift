
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
    
    func placeShipsOnBoard(playerShips:[Ship], board: BattleshipBoard) -> BattleshipBoard{
        var randRow = arc4random_uniform(9)
        var randColumn = arc4random_uniform(9)
        var randRowInt = 0
        var randColumnInt = 0
        print("\n \(playerShips[1].length)")

        
        var workingBoard = board
        
        
        
        for shipIndex in 0..<playerShips.count{
            
            randRow = arc4random_uniform(10)
            randColumn = arc4random_uniform(10)
            randColumnInt = Int(randColumn)
            randRowInt = Int(randRow)
            let orientationRandomizer = arc4random_uniform(2)
            let shipLength = playerShips[shipIndex].length
            
            for _ in 0..<shipLength{
           
                switch workingBoard.grid[randColumnInt][randRowInt].symbol{
                    
                case "-" :                                                                                      // If space is unoccupied
                    
                    workingBoard.grid[randColumnInt][randRowInt].symbol = playerShips[shipIndex].symbol         // Append symbol to space
                    if orientationRandomizer == 0{
                        //let remainingRowLength = workingBoard.grid[randRowInt].[Cell]
                        //print(rowLength)                                                                                        // 0 set as horzontal orientation
                        if randRowInt == 9 {                                                                    // If initial location is at edge of board, move the other way
                            randRowInt -= 1
                                           }
                            
                        else{                                                                                   // If not at edge, keep placing
                           randRowInt += 1
                            }
                        
                                                 }
                    
                    else{                                                                                       // 1 set as vertical orientation
                        if randColumnInt == 9 {                                                                 // If location is at end of board, move the other way
                            randColumnInt -= 1
                                              }
                        else{
                            randColumnInt += 1
                             }
                        
                        }
                   
                    

                default:
                    randRow = arc4random_uniform(10)
                    randColumn = arc4random_uniform(10)
                    randRowInt = Int(randRow)
                    randColumnInt = Int(randColumn)
                
            }
                }
            
        
        

       
        }
         return workingBoard
}
    
    func fireOnUnknownSpot(location: Coordinates){
        
    }
}
