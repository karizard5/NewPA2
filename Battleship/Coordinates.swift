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
    
    func translateRowInput(rowInput: String?) -> Int{
        if let rowEntryOptional = rowInput{
            let rowChoiceOptional = Int(rowEntryOptional)
            if let rowChoiceFinal = rowChoiceOptional{
                 return rowChoiceFinal
            }
        }
        
    }
    
    func translateColumnInput(columnInput: String?) -> Int {
        if let columnEntryOptional = columnInput{
            let columnChoiceOptional = Int(columnEntryOptional)
            if let columnChoiceFinal = columnChoiceOptional{
                return columnChoiceFinal
            }
        }
        
    }
}
