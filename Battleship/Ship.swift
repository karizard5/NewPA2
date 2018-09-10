//
//  Ship.swift
//  Battleship
//
//  Created by Reid, Jon Carl on 9/9/18.
//  Copyright © 2018 Reid, Jon Carl. All rights reserved.
//

import Foundation


struct Ship: CustomStringConvertible{
    var description: String
    
    var name: String
    var length: Int
    var occupiedCells: Array<String>
    var symbol: Character
    var hits: Int
}
