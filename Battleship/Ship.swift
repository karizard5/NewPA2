//  Ship.swift
//  Battleship
//
//  This file houses the ship type
//  CPSC 312
//  Programming assignment #2
//
//  Created by Reid, Jon Carl on 9/9/18.
//  Copyright © 2018 Reid, Jon Carl. All rights reserved.
//
import Foundation

// This type defines a Ship object, which a player has 5 of in their ship array

struct Ship: CustomStringConvertible{                                                   // This struct conforms to the CustomStringConvertible protocol,
                                                                                        // returning a string representation of the name of the ship.
    
    var description: String{
        return "\(name)"                                                                // String representation of ship name
    }
    
    var name: String = ""                                                               // A Ship object has
    var length: Int
    var symbol: Character = " "
    var hits: Int = 0
    

      
    }
    
    
    

