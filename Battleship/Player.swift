
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
        
        print(playerShips)
        return playerShips
    }
    
    func placeShipsOnBoard(playerShips:[Ship], board: BattleshipBoard) -> [Ship]{
        let randRow = arc4random_uniform(10)
        let randRowInt = Int(randRow)
        let randColumn = arc4random_uniform(10)
        let randColumnInt = Int(randColumn)
        
        for ships in 0..<5{
            if board.grid[randRowInt][randColumnInt] {
                
            }
        }
        
        return playerShips
    }
}
