//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by damiano melcarne on 3/31/16.
//  Copyright © 2016 damiano melcarne. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var activePlayer = 1 // 1 = noughts, 2 = crosses
    
    var gameState = Array(count: 9, repeatedValue: 0)
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    var gameActive = true
    
    @IBOutlet var button: UIButton!
    
    @IBOutlet var gameOverLabel: UILabel!
    
    @IBOutlet var playAgainButton: UIButton!
    
    @IBAction func playAgain(sender: AnyObject) {
        
        gameState = Array(count: 9, repeatedValue: 0)
        
        activePlayer = 1
        
        gameActive = true
        
        gameOverLabel.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 500, gameOverLabel.center.y)
        
        playAgainButton.hidden = true
        
        playAgainButton.center = CGPointMake(gameOverLabel.center.x - 500, gameOverLabel.center.y)
        
        var buttonToClear : UIButton
        
        for var i = 0; i < 9; i++ {
            
            buttonToClear = view.viewWithTag(i) as! UIButton
            
            buttonToClear.setImage(nil, forState: .Normal)
        }
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if (gameState[sender.tag] == 0 && gameActive == true) {
        
            gameState[sender.tag] = activePlayer
            
        if activePlayer == 1 {
            sender.setImage(UIImage(named: "zero.png"), forState: .Normal)
            
            activePlayer = 2
            
            gameState[sender.tag] = 1
        } else {
            sender.setImage(UIImage(named: "cross.png"), forState: .Normal)
            
            activePlayer = 1
        }
            
            for combination in winningCombinations {
                
                if (gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]) {
                    
                    gameActive = false
                    
                    if gameState[combination[0]] == 1 {
                        gameOverLabel.text = "Zeros have won!"
                    } else {
                        gameOverLabel.text = "Crosses have won!"
                    }
                    
                    endGame();
                }
            }
            
            if gameActive == true {
                gameActive = false
                for buttonState in gameState {
                    if buttonState == 0 {
                        gameActive = true
                    }
                }
                
                if gameActive == false {
                    
                    gameOverLabel.text = "It's a draw!"
                    
                    endGame()
                }
            }
        }
        
    }
    
    func endGame() {
        
        playAgainButton.hidden = false;
        gameOverLabel.hidden = false;
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 500, self.gameOverLabel.center.y)
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameOverLabel.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 500, gameOverLabel.center.y)
        
        playAgainButton.hidden = true
        
        playAgainButton.center = CGPointMake(gameOverLabel.center.x - 500, gameOverLabel.center.y)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

