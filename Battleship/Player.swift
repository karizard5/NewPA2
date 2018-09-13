
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
        //print(playerShips)
        return playerShips
    }
    
    func placeShipsOnBoard(playerShips:[Ship], board: BattleshipBoard) -> BattleshipBoard{
        var randRow = arc4random_uniform(10)
        var randColumn = arc4random_uniform(10)
        var randRowInt = 0
        var randColumnInt = Int(randColumn)
        print(playerShips[1].length)

        
        var workingBoard = board
        
        
        
        for shipIndex in 0..<playerShips.count{
            randColumnInt = Int(randColumn)
            randRowInt = Int(randRow)
            for _ in 0..<playerShips[shipIndex].length{
                
                
                
                switch workingBoard.grid[randColumnInt][randRowInt].symbol{
                    
                case "-" :
                   
                    let orientationRandomizer = arc4random_uniform(1)
                    workingBoard.grid[randColumnInt][randRowInt].symbol = playerShips[shipIndex].symbol
                    randRowInt += 1
                   
                    

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
