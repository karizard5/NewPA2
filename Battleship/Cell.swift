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
    
    // This function takes user firing input from the firingOnUnknownSpot
    // method in the player struct, and changes the cell's symbol
    // based on whether they hit a ship or open water
    
    mutating func checkMove(rowChoice: Int, columnChoice: Int, board: inout BattleshipBoard, player: Player){       // This function parameters accept integer vales representing the row
                                                                                                                    // and column indexes of the board, as well as the reference
                                                                                                                    // to the current battleshipboard being fired on.
        
        let numColumnChoice = columnChoice                                                                          // Row and column indexes are declared as local variables
        let numRowChoice = rowChoice
        let workingBoard = board
        
                                                                                                                    // The board is also declared as a local variable
        
        let consideredCharacter = workingBoard.grid[numRowChoice][numColumnChoice].symbol                           // Sets avariable to the symbol of the
        
        switch consideredCharacter{                                                                                 // This switch statement cycles through the possible options to
                                                                                                                    // change the cell symbol to, depending on whats in the cell.
            
            
        case "c":                                                                                                   // This option changes the cell to a * for hitting a cruiser location
            workingBoard.grid[numRowChoice][numColumnChoice].symbol = "*"
            print("\n")
            print("That's a hit! \n")
        case "b":                                                                                                   // This option changes the cell to a * for hitting a battleship location
            workingBoard.grid[numRowChoice][numColumnChoice].symbol = "*"
            print("\n")
            print("That's a hit! \n")
        case "r":                                                                                                   // This option changes the cell to a * for hitting a cruiser location
            workingBoard.grid[numRowChoice][numColumnChoice].symbol = "*"
            print("\n")
            print("That's a hit! \n")
        case "s":                                                                                                   // This option changes the cell to a * for hitting submarine location
            workingBoard.grid[numRowChoice][numColumnChoice].symbol = "*"
            print("\n")
            print("That's a hit! \n")
        case "d":                                                                                                   // This option changes the cell to a * for hitting a destroyer location
            workingBoard.grid[numRowChoice][numColumnChoice].symbol = "*"
            print("\n")
            print("That's a hit! \n")
            
        default:                                                                                                    // The default class handles both hitting a previously hit location
            if workingBoard.grid[numRowChoice][numColumnChoice].symbol == "*"{                                      // and if it is an empty location, a "m" is placed on the board.
                print("This spot has already been hit")
                print("Try again! \n")
            }
            else{
                workingBoard.grid[numRowChoice][numColumnChoice].symbol = "m"}
                print("Whoops, that's a miss. Try again! \n")
        }
        
    }
    
}
