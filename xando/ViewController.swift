//
//  ViewController.swift
//  xando
//
//  Created by Abdulhakim Ajetunmobi on 13/09/2016.
//  Copyright © 2016 5to9 Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //1 is noughts, 2 is crosses
    var activeplayer = 1
    
    var activeGame = true
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0] // 0 - empty, 1 - noughts, 2 crosses
    
    let winningComb = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    @IBOutlet weak var winLabel: UILabel!
    
    @IBOutlet weak var playAgainBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        labelSetup()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonClicked(_ sender: AnyObject) {
        
        let activepostion = sender.tag - 1
        
        if gameState[activepostion] == 0  && activeGame{
            
            gameState[activepostion] = activeplayer
            
            if activeplayer == 1 {
                sender.setImage(UIImage(named: "nought.png"), for:[])
                activeplayer = 2
            }else{
                sender.setImage(UIImage(named: "cross.png"), for:[])
                activeplayer = 1
            }
            
            for comb in winningComb {
                
                if gameState[comb[0]] != 0 && gameState[comb[0]] == gameState[comb[1]] && gameState[comb[1]] == gameState[comb[2]]{
                    //win
                    
                    activeGame = false
                    
                    
                    
                    if gameState[comb[0]] == 1{
                        winLabel.text = "Noughts has won!"
                    }else{
                        winLabel.text = "Crosses has won!"

                    }
                    
                    winLabel.isHidden = false
                    playAgainBtn.isHidden = false
                    
                    
                    UIView.animate(withDuration: 1, animations: {
                        self.winLabel.center = CGPoint(x: self.winLabel.center.x + 500, y: self.winLabel.center.y)
                        self.playAgainBtn.center = CGPoint(x: self.playAgainBtn.center.x + 500, y: self.playAgainBtn.center.y)
                    })
                    
                    
                    
                }
                
                
            }
            
        }
    }
    
    
    @IBAction func playAgain(_ sender: AnyObject) {
        
        
        activeplayer = 1
        
        activeGame = true
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        var button: UIButton
        
        for i in 1..<10{
            
            button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: [])
        }
        
        labelSetup()
        
    }
    
    func labelSetup(){
        winLabel.isHidden = true
        playAgainBtn.isHidden = true
        
        winLabel.center = CGPoint(x: winLabel.center.x - 500, y: winLabel.center.y)
        playAgainBtn.center = CGPoint(x: playAgainBtn.center.x - 500, y: playAgainBtn.center.y)
    }
    
    
}

