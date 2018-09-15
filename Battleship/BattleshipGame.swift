//  BattleshipGame.swift
//  Battleship
//
//  This file houses the battleship game type
//  CPSC 312
//  Programming assignment #2
//  No sources to site
//
//  Created by Reid, Jon Carl on 9/9/18.
//  Copyright © 2018 Reid, Jon Carl. All rights reserved.
//

import Foundation

/* This type describes an instance of a game of battleship, and drives the
    game logic forward. */

struct BattleshipGame: CustomStringConvertible{                                                                                     // The battleship game type conforms to to the
                                                                                                                                    // CustomStringConvertible protocol, returning a string.
    var description: String{
        return ""
 
}
    
    /* This method is the main game driver for the game. This method
       is called in main to execute an instance of the game. */
    
    func playGameDriver(){                                                                                                          // The rules of the game are listed for the player to utilize.
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
        
        let playerOneBoard = BattleshipBoard()                                                                                               // Two instances of battleship board are created, one for
        let playerTwoBoard = BattleshipBoard()                                                                                               // each of the two players.
        
        var gameWon: Bool = false                                                                                                            // This is a flag variable to end the game later
                                                                                                                                             //in the driving loop.
        
        let playerOne = Player(battleShipBoard: playerOneBoard, ships: [] , playerNumber: 1, hits: 0, misses: 0, totalShots: 0, shipsLeft: 5)       // Here, an instance of Player is created to
        var playerOneShips = playerOne.createShipsOnBoard()                                                                                         // house the board. Additionally, ships are
                                                                                                                                                    // created for the player
        
        print("")
        
        
        let playerTwo = Player(battleShipBoard: playerTwoBoard, ships: [], playerNumber: 2, hits: 0, misses: 0, totalShots: 0, shipsLeft: 5)        // Player two is initialized here.
        var playerTwoShips = playerTwo.createShipsOnBoard()
        
        
        /* This 1st black intializes coordinates for each ship of player 1. */
        
        let player1CarrierCoods: (Int, Int, Int) = playerOne.checkShipSpace(playerShip: playerOneShips[0], board: playerOneBoard, randRow: Player.generateRandomCoordinatesPlayer1(playerOne)().0, randColumn: Player.generateRandomCoordinatesPlayer1(playerOne)().1, orientation: Player.generateRandomCoordinatesPlayer1(playerOne)().2)
        let player1BattleshipCoords: (Int, Int, Int) = playerOne.checkShipSpace(playerShip: playerOneShips[1], board: playerOneBoard, randRow: Player.generateRandomCoordinatesPlayer1(playerOne)().0, randColumn: Player.generateRandomCoordinatesPlayer1(playerOne)().1, orientation: Player.generateRandomCoordinatesPlayer1(playerOne)().2)
        let player1CrusierCoords: (Int, Int, Int) = playerOne.checkShipSpace(playerShip: playerOneShips[2], board: playerOneBoard, randRow: Player.generateRandomCoordinatesPlayer1(playerOne)().0, randColumn: Player.generateRandomCoordinatesPlayer1(playerOne)().1, orientation: Player.generateRandomCoordinatesPlayer1(playerOne)().2)
        let player1SubCoords: (Int, Int, Int) = playerOne.checkShipSpace(playerShip: playerOneShips[3], board: playerOneBoard, randRow: Player.generateRandomCoordinatesPlayer1(playerOne)().0, randColumn: Player.generateRandomCoordinatesPlayer1(playerOne)().1, orientation: Player.generateRandomCoordinatesPlayer1(playerOne)().2)
        let player1DestroyerCoords: (Int, Int, Int) = playerOne.checkShipSpace(playerShip: playerOneShips[4], board: playerOneBoard, randRow: Player.generateRandomCoordinatesPlayer1(playerOne)().0, randColumn: Player.generateRandomCoordinatesPlayer1(playerOne)().1, orientation: Player.generateRandomCoordinatesPlayer1(playerOne)().2)
 

        print("")
        /* This block does the same thing as the one above, but initializes coordinates for player 2. */
        
        let player2CarrierCoods: (Int, Int, Int) = playerTwo.checkShipSpace(playerShip: playerOneShips[0], board: playerTwoBoard, randRow: Player.generateRandomCoordinatesPlayer2(playerTwo)().0, randColumn: Player.generateRandomCoordinatesPlayer2(playerTwo)().1, orientation: Player.generateRandomCoordinatesPlayer2(playerTwo)().2)
        let player2BattleshipCoords: (Int, Int, Int) = playerTwo.checkShipSpace(playerShip: playerOneShips[1], board: playerTwoBoard, randRow: Player.generateRandomCoordinatesPlayer2(playerTwo)().0, randColumn: Player.generateRandomCoordinatesPlayer2(playerTwo)().1, orientation: Player.generateRandomCoordinatesPlayer2(playerTwo)().2)
        let player2CrusierCoords: (Int, Int, Int) = playerTwo.checkShipSpace(playerShip: playerOneShips[2], board: playerTwoBoard, randRow: Player.generateRandomCoordinatesPlayer2(playerTwo)().0, randColumn: Player.generateRandomCoordinatesPlayer2(playerTwo)().1, orientation: Player.generateRandomCoordinatesPlayer2(playerTwo)().2)
        let player2SubCoords: (Int, Int, Int) = playerTwo.checkShipSpace(playerShip: playerOneShips[3], board: playerTwoBoard, randRow: Player.generateRandomCoordinatesPlayer2(playerTwo)().0, randColumn: Player.generateRandomCoordinatesPlayer2(playerTwo)().1, orientation: Player.generateRandomCoordinatesPlayer2(playerTwo)().2)
        let player2DestroyerCoords: (Int, Int, Int) = playerTwo.checkShipSpace(playerShip: playerOneShips[4], board: playerTwoBoard, randRow: Player.generateRandomCoordinatesPlayer2(playerTwo)().0, randColumn: Player.generateRandomCoordinatesPlayer2(playerTwo)().1, orientation: Player.generateRandomCoordinatesPlayer2(playerTwo)().2)
        
        print("")
       
        /* This block of code creates a workable copy to place ships to, utilizing a previously generated board from above, for player one. */
        
       var workingBoard1 = BattleshipBoard()
        workingBoard1 = playerOne.placeShipOnBoard(playerShip: playerOneShips[0], board: playerOneBoard, randRow: player1CarrierCoods.0, randColumn: player1CarrierCoods.1, Orientation: player1CarrierCoods.2)
        workingBoard1 = playerOne.placeShipOnBoard(playerShip: playerOneShips[1], board: workingBoard1, randRow: player1BattleshipCoords.0, randColumn: player1BattleshipCoords.1, Orientation: player1BattleshipCoords.2)
        workingBoard1 = playerOne.placeShipOnBoard(playerShip: playerOneShips[2], board: workingBoard1, randRow: player1CrusierCoords.0, randColumn: player1CrusierCoords.1, Orientation: player1CrusierCoords.2)
        workingBoard1 = playerOne.placeShipOnBoard(playerShip: playerOneShips[3], board: workingBoard1, randRow: player1SubCoords.0, randColumn: player1SubCoords.1, Orientation: player1SubCoords.2)
        workingBoard1 = playerOne.placeShipOnBoard(playerShip: playerOneShips[4], board: workingBoard1, randRow: player1DestroyerCoords.0, randColumn: player1DestroyerCoords.1, Orientation: player1DestroyerCoords.2)
        
        /* A board with ships is displayed to player 1*/
        
        print("Here are the set boards: \n")
        print("\(workingBoard1) \n")
        
        /* This block of code creates a workable copy to place ships to, utilizing a previously generated board from above, for player two. */
        
        var workingBoard2 = BattleshipBoard()
        workingBoard2 = playerOne.placeShipOnBoard(playerShip: playerTwoShips[0], board: playerTwoBoard, randRow: player2CarrierCoods.0, randColumn: player2CarrierCoods.1, Orientation: player2CarrierCoods.2)
        workingBoard2 = playerOne.placeShipOnBoard(playerShip: playerTwoShips[1], board: workingBoard2, randRow: player2BattleshipCoords.0, randColumn: player2BattleshipCoords.1, Orientation: player2BattleshipCoords.2)
        workingBoard2 = playerOne.placeShipOnBoard(playerShip: playerTwoShips[2], board: workingBoard2, randRow: player2CrusierCoords.0, randColumn: player2CrusierCoords.1, Orientation: player2CrusierCoords.2)
        workingBoard2 = playerOne.placeShipOnBoard(playerShip: playerTwoShips[3], board: workingBoard2, randRow: player2SubCoords.0, randColumn: player2SubCoords.1, Orientation: player2SubCoords.2)
        workingBoard2 = playerOne.placeShipOnBoard(playerShip: playerTwoShips[4], board: workingBoard2, randRow: player2DestroyerCoords.0, randColumn: player2DestroyerCoords.1, Orientation: player2DestroyerCoords.2)
        print(workingBoard2)

        /* This is the main driving loop for the game, continuing until the gameWon variable is set to true by the gameWonYet method in the Player struct */
        
        while gameWon != true{
  
            let firingCoordinatesOne = playerOne.fireOnUnknownSpot()   // This creates a input for the user to place a guess
            var playerOneWorkingBoard = playerOneBoard.grid[firingCoordinatesOne.0][firingCoordinatesOne.1].checkMove(rowChoice: firingCoordinatesOne.0, columnChoice: firingCoordinatesOne.1, board: &workingBoard2, player: playerOne)                     // The guess is applied to the board and updated for the user
            print("Here's player 2's board: \n")
            print(workingBoard1)
            print("")

        
            let firingCoordinates = playerTwo.fireOnUnknownSpot()      // This creates a input for the user to place a guess
            var playerTwoWorkingBoard = playerTwoBoard.grid[firingCoordinates.0][firingCoordinates.1].checkMove(rowChoice: firingCoordinates.0, columnChoice: firingCoordinates.1, board: &workingBoard1, player: playerTwo)                     // The guess is applied to the board and updated for the user
            print("Here's your board: \n")
            print(workingBoard2)
            print("")

            
            
            
        }

}

}
