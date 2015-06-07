//
//  OandXModel.swift
//  OandX
//
//  Created by Greg Vinall on 1/06/2015.
//  Copyright (c) 2015 Greg Vinall. All rights reserved.
//

import Foundation

// The logic and engine for the Noughts and Crosses game -- player v computer.
// In the first version, a lot of the processing of the logic occurs in the ViewController.swift module.
// With successive steps, all the logic will be moved to this module, and many other improvements will occur.
class OandXModel {
    // 'board' contains the board, with 0 in a cell where the player has moved, 1 in a cell where the computer has moved, 
    // and 3 where nobody has moved. [That is, all cells contain 3 on startup.]
    var board = [[Int]](count: 3, repeatedValue: [Int](count: 3, repeatedValue: 3)) // 0=O (player), 1=X (computer), anything else (blank)
    
    init() {
        // mo initialization of the class necessary. The 'board' was initialized upon creation.
    }
    
    // Make a move. Check that nobody has moved to the cell (ie cell = 3). Store 0 if player moved; store 1 if computer moved.
    func makeMove(x: Int, y:Int, player: Bool) -> Bool{
        if board[x][y] > 2 {
            board[x][y] = player ? 0 : 1
            return true
        } else {
            return false
        }
    }
    
    func returnBoard() -> [[Int]] {
        return board
    }
    
    // Check the board to see if the game has been won. If 'plauer' is true, check tto see if the player has won,
    // otherwise check to see if the computer won. Return true if the game has been won. Otherwise return false.
    func checkBoard(player: Bool) -> Bool {
        let character = player ? 0 : 1
        
        // This has been in two ways -- nested 'ifs' and one condition per 'if'.
        if board[0][0] == character {
            if board[0][1] == character && board[0][2] == character {
                return true
            } else if board[1][0] == character && board[2][0] == character {
                return true
            } else if board[1][1] == character && board[2][2] == character {
                return true
            }
        } else if board[0][1] == character && board[1][1] == character && board[2][1] == character {
            return true
        } else if board[0][2] == character && board[1][2] == character && board[2][2] == character {
            return true
        } else if board[1][0] == character && board[1][1] == character && board[1][2] == character {
            return true
        } else if board[2][0] == character && board[2][1] == character && board[2][2] == character {
            return true
        } else if board[2][0] == character && board[1][1] == character && board[0][2] == character {
            return true
        }
        return false
    }
    
    // return true if player has won
    func playerWins() -> Bool {
        return checkBoard(true)
    }
    
    func computerWins() -> Bool {
        return checkBoard(false)
    }
    
}