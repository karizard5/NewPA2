
//
//  Cell.swift
//  Battleship
//
//  Created by Reid, Jon Carl on 9/9/18.
//  Copyright © 2018 Reid, Jon Carl. All rights reserved.
//
import Foundation

struct Cell: CustomStringConvertible{
    
    var coordinates = Coordinates(row: 0, column: 0)
    var symbol: Character = "-"
    
    
    
    var description: String{
        let boardSymbol = String(symbol)
        return boardSymbol
    }
    
    
    mutating func checkMove(rowChoice: Int, columnChoice: Int, board: inout BattleshipBoard){
        
        
        let numColumnChoice = columnChoice
        let numRowChoice = rowChoice
        var workingBoard = board
        print("This is working")
        print(workingBoard)
        var consideredCharacter = workingBoard.grid[numRowChoice][numColumnChoice].symbol
        switch consideredCharacter{
            
        case "c":
            
            consideredCharacter = "*"
            print("This is really working")
            print(workingBoard)
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
