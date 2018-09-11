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
    var grid: [[Cell]]
    
  
    
    var description: String{
        var gridString: String = ""
        let gridLabels: [String]  = ["0 ","1 ","2 ","3 ","4 ","5 ","6 ","7 ","8 ","9 "]
        gridString += "  "
        
        for rowIndex in 0..<numRows{
            
            gridString.append(gridLabels[rowIndex])
            
        }
        
        for rowIndex in 0..<numRows {
            
            gridString += "\n"
            
            for columnIndex in 0..<numColumns{
                
                if columnIndex == 0 && rowIndex <= 9{
                    gridString.append(gridLabels[rowIndex])
                }
              
                gridString += "\(grid[rowIndex][columnIndex]) "
            }
            
        }
        
        return gridString
    }
    
    init(){
        
        numRows = 10
        numColumns = 10
        grid = [[Cell]]()
        
        for rowIndex in 0...numRows{
            var gridRow: [Cell] = Array()
            
            for columnIndex in 1...numColumns{
                let coordinates =  Coordinates(row: rowIndex, column: columnIndex)
                gridRow.append(Cell(coordinates: coordinates, symbol: "-"))
            }
            grid.append(gridRow)
        }
        
    }
    
    
    
    func placeShipsOnBoard(){
        
        
    }
    
    
}
