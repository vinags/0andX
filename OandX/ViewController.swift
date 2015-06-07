//
//  ViewController.swift
//  OandX
//
//  Created by Greg Vinall on 1/06/2015.
//  Copyright (c) 2015 Greg Vinall. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let OandX = OandXModel()
    // if gameOver is true, stop responding to user input. This will be improved in later revisions.
    var gameOver = false
    
    // Search all controls for buttons. For each button found, look to see if it is free (that is, a '+')
    // If so, move there. Note each button's tag has a number from which the x, y coordinates can be calculated.
    func computerMoves() {
        for view in self.view.subviews as! [UIView] {
            if let btn = view as? UIButton {
                if btn.currentTitle == "+" {
                    btn.setTitle("O", forState: .Normal)
                    let x:Int = btn.tag / 3
                    let y:Int = btn.tag % 3
                    OandX.makeMove(x, y: y, player: false)
                    break
                }
            }
        }
    }

    // resultLabel shows who has won (when applicable)
    @IBOutlet var resultLabel: UILabel!
    
    // 'function move' calculates the button that was touched, calculates the x,y coordinates from the button's tag,
    // and sends the result to the OandX class for processing (eg stores the result in the game board).
    // A check is made to see if the game has been won.
    @IBAction func move(sender: AnyObject) {
        let x:Int, y:Int
        
        if gameOver {
            return
        }
        
        switch sender.tag {
        case 0...2:
            x = 0
            switch sender.tag {
                case 0: y = 0
                case 1: y = 1
                default: y = 2
            }
        case 3...5:
            x = 1
            switch sender.tag {
                case 3: y = 0
                case 4: y = 1
                default: y = 2
            }
        default:
            x = 2
            switch sender.tag {
                case 6: y = 0
                case 7: y = 1
                default: y = 2
            }
        }
        (sender as! UIButton).setTitle("X", forState: .Normal)
        
        OandX.makeMove(x,y: y,player: true)
        
        if OandX.playerWins() {
            resultLabel.text = "You WIN!!!!"
            gameOver = true
        } else {
            computerMoves()
            if OandX.computerWins() {
                resultLabel.text = "Computer WINS!!!!"
                gameOver = true
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Not used at this stage of development.
    func refreshUI() {
        var board = [[Int]]()
        board = OandX.returnBoard()
        
    }


}

