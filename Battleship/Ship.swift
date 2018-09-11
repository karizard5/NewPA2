
//
//  Ship.swift
//  Battleship
//
//  Created by Reid, Jon Carl on 9/9/18.
//  Copyright © 2018 Reid, Jon Carl. All rights reserved.
//
import Foundation


struct Ship: CustomStringConvertible{
    
    
    var description: String{
        
        return "This is a \(name)"
    }
    
    var name: String = ""
    var length: Int = 0
    var occupiedCells: [Cell] = []
    var symbol: Character = " "
    var hits: Int = 0
    
    mutating func assignCellsToShips(){
        for cellIndex in 0..<length{
            occupiedCells.append(Cell(coordinates: Coordinates(row: 0, column: 0), symbol: "-"))
        }
    }
    
//    mutating func defineShip{
//        
//    }
//        
    }
    
    
    

