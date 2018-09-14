//  Cell.swift
//  Battleship
//
//  This file houses the cell type
//  CPSC 312
//  Programming assignment #2
//
//  Created by Reid, Jon Carl on 9/9/18.
//  Copyright © 2018 Reid, Jon Carl. All rights reserved.
//
import Foundation

// This type defines the cells that inhabit the board

struct Cell: CustomStringConvertible{                                                               // This type conforms to CustomStringConvertible,
                                                                                                    // prompting it to return a string
    
    
    var coordinates = Coordinates(row: 0, column: 0)                                                // Cell contains a Coordinates object for reference use
    var symbol: Character = "-"                                                                     // By default, Cells are set to "-", meaning empty
    
    
    
    var description: String{                                                                        // The description returns the character symbol that is
        let boardSymbol = String(symbol)                                                            // currently represented in the cell.
        return boardSymbol
    }
    
    // This fucntion takes user firing input and changes the cell's symbol,
    // based on whether they hit a ship or open water
    
    mutating func checkMove(rowChoice: Int, columnChoice: Int, board: inout BattleshipBoard){       // This function accepts integer vales representing the row
                                                                                                    // and column indexes of the board, as well as the reference
                                                                                                    // to the current battleshipboard being fired on
        
        let numColumnChoice = columnChoice                                                          // Row and column indexes are declared as local variables
        let numRowChoice = rowChoice
        var workingBoard = board                                                                    // The board is also declared as a local variable
        print("This is working")
        print(workingBoard)
        var consideredCharacter = workingBoard.grid[numRowChoice][numColumnChoice].symbol{
            willSet {
                print("\(consideredCharacter) is abot to be set to \(newValue)")
            }
        }
        
        switch consideredCharacter{
            
        case "c":
           
            workingBoard.grid[numRowChoice][numColumnChoice].symbol = "*"
            print("This is really working")
            
        case "b":
            workingBoard.grid[numRowChoice][numColumnChoice].symbol = "*"
        case "r":
            workingBoard.grid[numRowChoice][numColumnChoice].symbol = "*"
        case "s":
            workingBoard.grid[numRowChoice][numColumnChoice].symbol = "*"
        case "d":
            workingBoard.grid[numRowChoice][numColumnChoice].symbol = "*"
            
        default:
            if workingBoard.grid[numRowChoice][numColumnChoice].symbol == "*"{
                print("This spot has already been hit")
            }
            else{
                workingBoard.grid[numRowChoice][numColumnChoice].symbol = "m"}
        }
        
    }
    
}
