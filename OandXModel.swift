//
//  OandXModel.swift
//  OandX
//
//  Created by Greg Vinall on 1/06/2015.
//  Copyright (c) 2015 Greg Vinall. All rights reserved.
//

import Foundation

class OandXModel {
    var board = [[Int]](count: 3, repeatedValue: [Int](count: 3, repeatedValue: 3)) // 0=O (player), 1=X (computer), anything else (blank)
    
    init() {
        for i in 0...2 {
            for j in 0...2 {
                board[i][j] = 3
            }
        }
    }
    
    // if the square is blank, then if player is true, store a 0
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
    
    func checkBoard(player: Bool) -> Bool {
        let character = player ? 0 : 1
        
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