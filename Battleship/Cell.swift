
//
//  Cell.swift
//  Battleship
//
//  Created by Reid, Jon Carl on 9/9/18.
//  Copyright © 2018 Reid, Jon Carl. All rights reserved.
//
import Foundation

struct Cell: CustomStringConvertible{
    
    var coordinates = Coordinates(row: 0, column: 0)
    var symbol: Character = "-"
    
    
    var description: String{
        let boardSymbol = String(symbol)
        return boardSymbol
    }
}
