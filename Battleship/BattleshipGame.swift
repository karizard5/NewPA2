//
//  BattleshipGame.swift
//  Battleship
//
//  Created by Reid, Jon Carl on 9/9/18.
//  Copyright © 2018 Reid, Jon Carl. All rights reserved.
//

import Foundation
struct BattleshipGame: CustomStringConvertible{
    
    var description: String{

        return ""
 
}
    
    
    func playGameDriver(){
        let rules: String = """
        ******* Welcome to BattleShip ******* \n
        This is a game of strategy and luck! \n
        Here are the rules: \n
        1. This is a two player game \n
        2. Player 1 is you and Player 2 is the computer \n
        3. The Goal of the game is to sink all your opponent's ships.
           Each player has 5 ships that are placed on the board. \n
        4. To guess the location of a ship, enter the coordinates based
           on the board labels. \n
        5. If you hit a ship, the "-" will be replaced with a "*". \n
        6. If you miss, the "-" will be replaced with an "m". \n
        7. Since some ships are larger than others, you will be told
           if you have sunk a ship completely.
        """
        
        
        
        print(rules,"\n")
        print("Player 1's board: \n")
        let playerOneBoard = BattleshipBoard()
        let coordinates = Coordinates(row: 0, column: 0)
        var gameWon: Bool = false
        
        
        let playerOne = Player(battleShipBoard: playerOneBoard, ships: [] , playerNumber: 1)
        let playerOneShips = playerOne.createShipsOnBoard()
        
        
        
        
        //print(playerOne)
        
        print("")
        print("Player 2's board: \n")
        
        let playerTwoBoard = BattleshipBoard()
        //print(playerTwoBoard)
        
        
        let playerTwo = Player(battleShipBoard: playerTwoBoard, ships: [], playerNumber: 2)
        
        
        let playerTwoShips = playerTwo.createShipsOnBoard()
        
        
        print("\n PlayerOne updated board \n")
        var playerCoordinates = Player.generateRandomCoordinates(playerOne)
        let player1FirstShip = playerOne.checkShipSpace(playerShip: playerOneShips[0], board: playerOneBoard, randRow: playerCoordinates().0, randColumn: playerCoordinates().1, orientation: playerCoordinates().2)
        print("")
        var player2FirstShip: (Int, Int, Int, Int) = (0,0,0,0)
        print(player1FirstShip)
        print("")
        print("This is player 2's data: \n")
        while player2FirstShip.3 != playerTwoShips[0].length{
            player2FirstShip = playerTwo.checkShipSpace(playerShip: playerTwoShips[0], board: playerTwoBoard, randRow: playerCoordinates().0, randColumn: playerCoordinates().1, orientation: playerCoordinates().2)
            print("This loop is running")
        }
       print(" \n \(player2FirstShip)")
        
//        while gameWon != true{
////            playerOne.fireOnUnknownSpot()
//
//        }
        

    }

}
    
