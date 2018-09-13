
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
        
        return "\(name)"
    }
    
    var name: String = ""
    var length: Int
    var occupiedCells: [Cell]
    var symbol: Character = " "
    var hits: Int = 0
    
//    init(){
//
//    }
      
    }
    
    
    

