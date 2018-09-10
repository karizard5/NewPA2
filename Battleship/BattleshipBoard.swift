//
//  BattleshipBoard.swift
//  Battleship
//
//  Created by Reid, Jon Carl on 9/9/18.
//  Copyright © 2018 Reid, Jon Carl. All rights reserved.
//

import Foundation

struct BattleshipBoard: CustomStringConvertible{
   
    
    var numRows: Int
    var numColumns: Int
    
    
    
    func createBoard(_ numRows: Int,_ numColumns: Int) -> String{
        
        var gridRow: [String] = []
        var gridColumn: [String] = []
        
        
        for _ in 1...numRows{
            gridRow.append("-")
        }
        
        for _ in 1...numColumns{
            gridColumn.append("-")
        }
        
        
        let grid = [gridRow,gridColumn]
        var gridImage: String
        
        gridImage = "\(grid)"
        return gridImage
    }
    
    var description: String{
        let gridImage:String = createBoard(numRows, numColumns)
        return gridImage
    }
    
}
