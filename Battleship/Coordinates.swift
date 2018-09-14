//  Coordinates.swift
//  Battleship
//
//  This file houses the Coordinates object
//  CPSC 312
//  Programming assignment #2
//  No sources to site
//
//  Created by Reid, Jon Carl on 9/9/18.
//  Copyright © 2018 Reid, Jon Carl. All rights reserved.
//
import Foundation

// This type defines coordinates used to index spots on the board.

struct Coordinates: CustomStringConvertible{        // This type conforms to the CustomStringConvertible protocol, returning a strign
    
    var row: Int = 0                                // Row and column values used for indexing are defined
    var column: Int = 0
    
    
    var description: String{                        // Returns a string description of the coordinates
        return "\(row),\(column)"
    }

}
