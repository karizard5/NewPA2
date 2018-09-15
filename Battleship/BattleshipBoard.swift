//  BattleshipBoard.swift
//  Battleship
//
//  This file houses the battleship board class
//  CPSC 312
//  Programming assignment #2
//  No sources to site
//
//  Created by Reid, Jon Carl on 9/9/18.
//  Copyright © 2018 Reid, Jon Carl. All rights reserved.
//
import Foundation

/* This type defines a battleship board, which contains a count of rows and columns,
   as well as the grid of cells. The reason a class was used in this case over a struct
   was due to the pass by reference nature of classes. In order to properly update the board
   without having to pass a new copy back and forth, a class was used.*/


class BattleshipBoard: CustomStringConvertible{                                                     // This type conforms to the CustomStringConvertible protocol,
                                                                                                    // returning a string representation of the grid.
    
    var numRows: Int                                                                                // List of class properties mentioned above
    var numColumns: Int
    var grid: [[Cell]]
    
  
    
    var description: String{                                                                        // This description displays the board.
        var gridString: String = ""                                                                 // Here, an empty string is initialized to be filled.
        let gridLabels: [String]  = ["0 ","1 ","2 ","3 ","4 ","5 ","6 ","7 ","8 ","9 "]             // Grid labels for the sides of the board are initialized in an array of strings.
        gridString += "  "                                                                          // A space is appended here to set the top labels correctly.
        
        for rowIndex in 0..<numRows{                                                                // This loop iterates through the first line of the display string and appends the correct
                                                                                                    // grid labels on the horizontal axis.
            gridString.append(gridLabels[rowIndex])
            
        }
        
        for rowIndex in 0..<numRows {                                                               // This loop gathers all the rows of cells and appends
                                                                                                    // the symbols of each cell in the grid to the string representation.
            
            gridString += "\n"                                                                      // Here, a newline is inserted to properly set the first row of symbols below the labels.
            
            for columnIndex in 0..<numColumns{                                                      // This loop creates a row of cell symbols to be appended to one row, which is appended by
                                                                                                    // the outer for loop.
                
                if columnIndex == 0 && rowIndex <= 9{                                               // This if statement make sure the cell is in a valid index of the board.
                    gridString.append(gridLabels[rowIndex])                                         // This physicaly appends the symbol to the string.
                }
              
                gridString += "\(grid[rowIndex][columnIndex]) "                                     // This statement physcially appends the finished row to the string.
            }
            
        }
        
        return gridString                                                                           // An instance of this class returns a string representation of the grid.
    }
    
    init(){                                                                                         // This is the initializer for the board struct.
        
        numRows = 10                                                                                // Here, the inital number of rows and columns are set to 10,
        numColumns = 10                                                                             // and a 2D array of cells is initialized.
        grid = [[Cell]]()
        
        for rowIndex in 0...numRows{                                                                // This loop gathers all the rows of cells being created.
            var gridRow: [Cell] = Array()                                                           // Here, a row of cells in initialized.
            
            for columnIndex in 1...numColumns{                                                      // This loop creates moves through a row to be appended to the outer array.
                let coordinates =  Coordinates(row: rowIndex, column: columnIndex)                  // A Coordinates object is created to represent the index of the cell being created.
                gridRow.append(Cell(coordinates: coordinates, symbol: "-"))                         // Here, each cell is initialized to an empty symbol and the coordinates provided
            }                                                                                       // by the loops.
            grid.append(gridRow)                                                                    // After each row is made, it is appended to the outer array.
        }
        
    }
        }
