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
        var playerOneBoard = BattleshipBoard()
        var playerTwoBoard = BattleshipBoard()
        
        var gameWon: Bool = false
        
        
        var playerOne = Player(battleShipBoard: playerOneBoard, ships: [] , playerNumber: 1, hits: 0, misses: 0, totalShots: 0, shipsLeft: 5)
        var playerOneShips = playerOne.createShipsOnBoard()
        //var player1Coordinates = Player.generateRandomCoordinatesPlayer1(playerOne)
        
        print("")
        print("Player 2's board: \n")
        
        var playerTwo = Player(battleShipBoard: playerTwoBoard, ships: [], playerNumber: 2, hits: 0, misses: 0, totalShots: 0, shipsLeft: 5)
        var playerTwoShips = playerTwo.createShipsOnBoard()
        //var player2Coordinates = Player.generateRandomCoordinatesPlayer2(playerTwo)
        
        let player1CarrierCoods: (Int, Int, Int, Int) = playerOne.checkShipSpace(playerShip: playerOneShips[0], board: playerOneBoard, randRow: Player.generateRandomCoordinatesPlayer1(playerOne)().0, randColumn: Player.generateRandomCoordinatesPlayer1(playerOne)().1, orientation: Player.generateRandomCoordinatesPlayer1(playerOne)().2)
        let player1BattleshipCoords: (Int, Int, Int, Int) = playerOne.checkShipSpace(playerShip: playerOneShips[1], board: playerOneBoard, randRow: Player.generateRandomCoordinatesPlayer1(playerOne)().0, randColumn: Player.generateRandomCoordinatesPlayer1(playerOne)().1, orientation: Player.generateRandomCoordinatesPlayer1(playerOne)().2)
        let player1CrusierCoords: (Int, Int, Int, Int) = playerOne.checkShipSpace(playerShip: playerOneShips[2], board: playerOneBoard, randRow: Player.generateRandomCoordinatesPlayer1(playerOne)().0, randColumn: Player.generateRandomCoordinatesPlayer1(playerOne)().1, orientation: Player.generateRandomCoordinatesPlayer1(playerOne)().2)
        let player1SubCoords: (Int, Int, Int, Int) = playerOne.checkShipSpace(playerShip: playerOneShips[3], board: playerOneBoard, randRow: Player.generateRandomCoordinatesPlayer1(playerOne)().0, randColumn: Player.generateRandomCoordinatesPlayer1(playerOne)().1, orientation: Player.generateRandomCoordinatesPlayer1(playerOne)().2)
        let player1DestroyerCoords: (Int, Int, Int, Int) = playerOne.checkShipSpace(playerShip: playerOneShips[4], board: playerOneBoard, randRow: Player.generateRandomCoordinatesPlayer1(playerOne)().0, randColumn: Player.generateRandomCoordinatesPlayer1(playerOne)().1, orientation: Player.generateRandomCoordinatesPlayer1(playerOne)().2)
 
        
        print("\n PlayerOne updated board \n")
        
        
        
       
        
        
        
        print(player1CarrierCoods)
        print(playerOneShips[0].length)
        //}
        print("")
        let player2CarrierCoods: (Int, Int, Int, Int) = playerTwo.checkShipSpace(playerShip: playerOneShips[0], board: playerTwoBoard, randRow: Player.generateRandomCoordinatesPlayer2(playerTwo)().0, randColumn: Player.generateRandomCoordinatesPlayer2(playerTwo)().1, orientation: Player.generateRandomCoordinatesPlayer2(playerTwo)().2)
        let player2BattleshipCoords: (Int, Int, Int, Int) = playerTwo.checkShipSpace(playerShip: playerOneShips[1], board: playerTwoBoard, randRow: Player.generateRandomCoordinatesPlayer2(playerTwo)().0, randColumn: Player.generateRandomCoordinatesPlayer2(playerTwo)().1, orientation: Player.generateRandomCoordinatesPlayer2(playerTwo)().2)
        let player2CrusierCoords: (Int, Int, Int, Int) = playerTwo.checkShipSpace(playerShip: playerOneShips[2], board: playerTwoBoard, randRow: Player.generateRandomCoordinatesPlayer2(playerTwo)().0, randColumn: Player.generateRandomCoordinatesPlayer2(playerTwo)().1, orientation: Player.generateRandomCoordinatesPlayer2(playerTwo)().2)
        let player2SubCoords: (Int, Int, Int, Int) = playerTwo.checkShipSpace(playerShip: playerOneShips[3], board: playerTwoBoard, randRow: Player.generateRandomCoordinatesPlayer2(playerTwo)().0, randColumn: Player.generateRandomCoordinatesPlayer2(playerTwo)().1, orientation: Player.generateRandomCoordinatesPlayer2(playerTwo)().2)
        let player2DestroyerCoords: (Int, Int, Int, Int) = playerTwo.checkShipSpace(playerShip: playerOneShips[4], board: playerTwoBoard, randRow: Player.generateRandomCoordinatesPlayer2(playerTwo)().0, randColumn: Player.generateRandomCoordinatesPlayer2(playerTwo)().1, orientation: Player.generateRandomCoordinatesPlayer2(playerTwo)().2)
        
        print("")
        print("This is player 2's data: \n")
        
       var workingBoard1 = BattleshipBoard()
        workingBoard1 = playerOne.placeShipOnBoard(playerShip: playerOneShips[0], board: playerOneBoard, randRow: player1CarrierCoods.0, randColumn: player1CarrierCoods.1, Orientation: player1CarrierCoods.2)
        workingBoard1 = playerOne.placeShipOnBoard(playerShip: playerOneShips[1], board: workingBoard1, randRow: player1BattleshipCoords.0, randColumn: player1BattleshipCoords.1, Orientation: player1BattleshipCoords.2)
        workingBoard1 = playerOne.placeShipOnBoard(playerShip: playerOneShips[2], board: workingBoard1, randRow: player1CrusierCoords.0, randColumn: player1CrusierCoords.1, Orientation: player1CrusierCoords.2)
        workingBoard1 = playerOne.placeShipOnBoard(playerShip: playerOneShips[3], board: workingBoard1, randRow: player1SubCoords.0, randColumn: player1SubCoords.1, Orientation: player1SubCoords.2)
        workingBoard1 = playerOne.placeShipOnBoard(playerShip: playerOneShips[4], board: workingBoard1, randRow: player1DestroyerCoords.0, randColumn: player1DestroyerCoords.1, Orientation: player1DestroyerCoords.2)
        print("\(workingBoard1) \n")
        
        var workingBoard2 = BattleshipBoard()
        workingBoard2 = playerOne.placeShipOnBoard(playerShip: playerTwoShips[0], board: playerTwoBoard, randRow: player2CarrierCoods.0, randColumn: player2CarrierCoods.1, Orientation: player2CarrierCoods.2)
        workingBoard2 = playerOne.placeShipOnBoard(playerShip: playerTwoShips[1], board: workingBoard2, randRow: player2BattleshipCoords.0, randColumn: player2BattleshipCoords.1, Orientation: player2BattleshipCoords.2)
        workingBoard2 = playerOne.placeShipOnBoard(playerShip: playerTwoShips[2], board: workingBoard2, randRow: player2CrusierCoords.0, randColumn: player2CrusierCoords.1, Orientation: player2CrusierCoords.2)
        workingBoard2 = playerOne.placeShipOnBoard(playerShip: playerTwoShips[3], board: workingBoard2, randRow: player2SubCoords.0, randColumn: player2SubCoords.1, Orientation: player2SubCoords.2)
        workingBoard2 = playerOne.placeShipOnBoard(playerShip: playerTwoShips[4], board: workingBoard2, randRow: player2DestroyerCoords.0, randColumn: player2DestroyerCoords.1, Orientation: player2DestroyerCoords.2)
        print(workingBoard2)
        
        
       
        
        
        while gameWon != true{
           var firingcoordinates = playerOne.fireOnUnknownSpot()
            playerOneBoard.grid[firingcoordinates.0][firingcoordinates.1].checkMove(rowChoice: firingcoordinates.0, columnChoice: firingcoordinates.1, board: &workingBoard2)
            print(workingBoard2)
        }
        

    }

}

