//
//  Coordinates.swift
//  Battleship
//
//  Created by Reid, Jon Carl on 9/9/18.
//  Copyright © 2018 Reid, Jon Carl. All rights reserved.
//
import Foundation

struct Coordinates: CustomStringConvertible{
    
    var row: Int = 0
    var column: Int = 0
    
    
    var description: String{
        return "\(row),\(column)"
    }

}
