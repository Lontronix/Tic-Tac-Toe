//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Lonnie Gerol on 1/23/19.
//  Copyright © 2019 Lontronix. All rights reserved.
//

import UIKit




class MultiplayerGameViewController: GameViewController{

    var playerOneName: String?
    var playerTwoName: String?

    
   override func nextTurn(){
        super.nextTurn()
        if let result = board.checkForVictoryOrTie(){
            switch result{
            case 0:
                displayTieAlertController()
            
            default:
                displayWinnerMessage(winnerIsPlayerOne: result == 1)
        }
        }
                
        else{
        //checking whether this is the first turn
        if IsPlayerOneTurn == nil{
            IsPlayerOneTurn = true
            infoLabel.text = "\(playerOneName!)'s Turn!"
            oSpawner.isUserInteractionEnabled = false
            oSpawner.alpha = 0.5
            xSpawner.isUserInteractionEnabled = true
            
        }
              
                
            else{
            IsPlayerOneTurn = !IsPlayerOneTurn
            switch IsPlayerOneTurn{
            case true:
                oSpawner.isUserInteractionEnabled = false
                oSpawner.alpha = 0.5
                xSpawner.isUserInteractionEnabled = true
                xSpawner.alpha = 1.0
                infoLabel.text = "\(playerOneName!)'s Turn!"
            case false:
                oSpawner.isUserInteractionEnabled = true
                oSpawner.alpha = 1.0
                xSpawner.isUserInteractionEnabled = false
                xSpawner.alpha = 0.5
                infoLabel.text = "\(playerTwoName!)'s Turn!"
            default:
                ()
            }
        }
        }
        
    }
    
    
 
    
    
 
    
    
    
   
    func displayWinnerMessage(winnerIsPlayerOne: Bool){
        var winner: String!
        if winnerIsPlayerOne{
            winner = playerOneName
        }
        else{
            winner = playerTwoName!
        }
        let winnerAlertController = UIAlertController(title: "\(winner!) has won!", message: "Would you like to play again?", preferredStyle: .alert)
        winnerAlertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: {(action) in
            self.prepareForNewGame()
        }))
        winnerAlertController.addAction(UIAlertAction(title: "No", style: .cancel, handler: {(action) in
            self.dismiss(animated: true, completion: nil)
            
        }))
        self.present(winnerAlertController, animated: true, completion: nil)
        
    }

    
    

  


}

