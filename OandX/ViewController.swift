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
    var gameOver = false
    
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

    @IBOutlet var resultLabel: UILabel!
    
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
    
    func refreshUI() {
        var board = [[Int]]()
        board = OandX.returnBoard()
        
    }


}

