//
//  SinglePlayerGameViewController.swift
//  Tic Tac Toe
//
// https://www.youtube.com/watch?v=LkYpoRj-7hA&t=3146s -> Demonstrated how to implement a Tic-Tac-Toe AI that is challenging but not impossible to win against. 
//
//  Created by Lonnie Gerol on 1/31/19.
//  Copyright © 2019 Lontronix. All rights reserved.
//

import UIKit

enum VictoryCombinations{
    case firstRow
    case secondRow
    case thirdRow
    case firstColumn
    case secondColumn
    case thirdColumn
    case leftDiagonal
    case rightDiagonal
    
    
}

//51:17
class SinglePlayerGameViewController: GameViewController {

    
    var difficulty: Int!
    var winnerOrTie: Bool = false
   
    
    
    override func nextTurn(){
        super.nextTurn()
    
        
        displayEndGameAlertControllerIfNecessary()
        if(!winnerOrTie){
            //checking whether this is the first turn
            if IsPlayerOneTurn == nil{
                IsPlayerOneTurn = true
                infoLabel.text = "Your Turn!"
                oSpawner.isUserInteractionEnabled = false
                oSpawner.alpha = 0.5
                xSpawner.isUserInteractionEnabled = true
                displayEndGameAlertControllerIfNecessary()
                
            }
                
                
            else{
                IsPlayerOneTurn = !IsPlayerOneTurn
                switch IsPlayerOneTurn{
                case true:
                
                    infoLabel.text = "Your Turn!"
                    infoLabel.backgroundColor = UIColor.clear
                    oSpawner.isUserInteractionEnabled = false
                    oSpawner.alpha = 0.5
                    xSpawner.isUserInteractionEnabled = true
                    xSpawner.alpha = 1.0
                    
                case false:
                    infoLabel.text = "Computer's turn..."
                    xSpawner.isUserInteractionEnabled = false
                     Timer.scheduledTimer(timeInterval: 0.5, target: self, selector:
                        #selector(haveAIPlacePiece), userInfo: nil, repeats: false)
                   
                    
                
                    
                    
                default:
                    ()
                }
               
            }}
        
        
    }
 
    
    
    func displayEndGameAlertControllerIfNecessary(){
    
        if let result = board.checkForVictoryOrTie(){
            switch result{
            case 0:
                displayTieAlertController()
                winnerOrTie = true
                
            default:
                displayWinnerMessage(winnerIsPlayer: result == 1)
                winnerOrTie = true
            }
        }
        
    }
  
    
  
    
    
    @objc func haveAIPlacePiece(){
        /**
         Easy Difficulty: Opponent randomly places a piece if no piece exists in that location
         */
        if(difficulty == 0){
            var piecePlaced = false
            while(!piecePlaced){
                let row = Int.random(in: 0...2)
                let col = Int.random(in: 0...2)
                if board.squares[row][col].piece.belongsToPlayer == nil{
                    board.squares[row][col].piece.display(isPlayerOne: false)
                    piecePlaced = true
                }
                
                
                
            }
            nextTurn()
            displayEndGameAlertControllerIfNecessary()
            
        }
            /**
             Hard Difficulty
            */
        else{
            //if the player has two in a row
            if let result = rowCheck(player: 0){
                let playLoc = whereToPlay(location: result.location, pattern: result.patten)
                if(board.squares[playLoc.row][playLoc.col].piece.belongsToPlayer == nil){
                    board.squares[playLoc.row][playLoc.col].piece.display(isPlayerOne: false)
                    nextTurn()
                    
                    return
                }
            
            
            }
            //if the computer has two in a row
             if let result = rowCheck(player: 1){
                let playLoc = whereToPlay(location: result.location, pattern: result.patten)
               
                if(board.squares[playLoc.row][playLoc.col].piece.belongsToPlayer == nil){
                    board.squares[playLoc.row][playLoc.col].piece.display(isPlayerOne: false)
                    displayEndGameAlertControllerIfNecessary()
                    nextTurn()
                    
                    return
                }
                
            }
            //if the center is avaliable
             if board.squares[1][1].piece.belongsToPlayer == nil{
                board.squares[1][1].piece.display(isPlayerOne: false)
                displayEndGameAlertControllerIfNecessary()
                nextTurn()
                
                return
            }
            //if a corner is avaliable
            if let cornerAvaliable = firstAvaliable(isCorner: true){
                board.squares[cornerAvaliable.row][cornerAvaliable.col].piece.display(isPlayerOne: false)
                displayEndGameAlertControllerIfNecessary()
                nextTurn()
                
                return
            }
            //if a side is avaliable
             if let sideAvaliable = firstAvaliable(isCorner: false){
                board.squares[sideAvaliable.row][sideAvaliable.col].piece.display(isPlayerOne: false)
                displayEndGameAlertControllerIfNecessary()
                nextTurn()
                
                return
            }
                
            //otherwise place a random piece
            else{
                var piecePlaced = false
                while(!piecePlaced){
                    let row = Int.random(in: 0...2)
                    let col = Int.random(in: 0...2)
                    if board.squares[row][col].piece.belongsToPlayer == nil{
                        board.squares[row][col].piece.display(isPlayerOne: false)
                        piecePlaced = true
                    }
                    
                }
                nextTurn()
                
            }
            

            
        }
       
    }
    
    
    //returns where the AI should play
    func whereToPlay(location: Int, pattern: String) -> (row: Int, col: Int){
        let leftPattern = "011"
        let rightPattern = "110"
        let middlePattern = "101"
        
        switch location{
        //top row
        case 0:
            if(pattern == leftPattern){
                return (0,0)
            }
            else if(pattern == middlePattern){
                return (0,1)
            }
            else{
                return (0,2)
            }
        //Middle Row
        case 1:
            if(pattern == leftPattern){
                return (1,0)
            }
            else if(pattern == middlePattern){
                return (1,1)
            }
            else{
                return (1,2)
            }
        //bottom row
        case 2:
            if(pattern == leftPattern){
                return (2,0)
            }
            else if(pattern == middlePattern){
                return (2,1)
            }
            else{
                return (2,2)
            }
            
        //first column
        case 3:
            if(pattern == leftPattern){
                return (0,0)
            }
            else if(pattern == middlePattern){
                return (1,0)
            }
            else{
                return (2,0)
            }
            
            
        //middle column
        case 4:
            if(pattern == leftPattern){
                return (0,1)
            }
            else if(pattern == middlePattern){
                return (1,1)
            }
            else{
                return (2,1)
            }
            
            
        //right column
        case 5:
            if(pattern == leftPattern){
                return (0,2)
            }
            else if(pattern == middlePattern){
                return (1,2)
            }
            else{
                return (2,2)
            }
            
            
        //left diagional
        case 6:
            if(pattern == leftPattern){
                return (0,0)
            }
            else if(pattern == middlePattern){
                return (1,1)
            }
            else{
                return (2,2)
            }
            
        //right diagonal
        case 7:
            if(pattern == leftPattern){
                return (0,2)
            }
            else if(pattern == middlePattern){
                return (1,1)
            }
            else{
                return (2,0)
            }
            
            //??
        default: return (1,0)
        }
        
    }
    
    //adapted from https://www.youtube.com/watch?v=LkYpoRj-7hA&t=3146s
    func rowCheck(player: Int) -> (location: Int, patten: String)?{
        let acceptablePatterns = ["011", "110", "101"]
        for i in 0...7{
            let result = checkValues(for: player, in: i)
            if(acceptablePatterns.contains(result)){
                return (i, result)
            }
        }
        return nil

    }
    

    
    /**
     0 = Top Row
    */
    func checkValues(for playerNumber: Int, in winCombination: Int) -> String{
        var conclusion = ""
        switch winCombination{
        //Top Row
        case 0:
            conclusion += board.squares[0][0].piece.belongsToPlayer == playerNumber ? "1" :  "0"
            conclusion += board.squares[0][1].piece.belongsToPlayer == playerNumber ? "1" :  "0"
            conclusion += board.squares[0][2].piece.belongsToPlayer == playerNumber ? "1" :  "0"
        //Middle Row
        case 1:
            conclusion += board.squares[1][0].piece.belongsToPlayer == playerNumber ? "1" :  "0"
            conclusion += board.squares[1][1].piece.belongsToPlayer == playerNumber ? "1" :  "0"
            conclusion += board.squares[1][2].piece.belongsToPlayer == playerNumber ? "1" :  "0"
        //bottom row
        case 2:
            conclusion += board.squares[2][0].piece.belongsToPlayer == playerNumber ? "1" :  "0"
            conclusion += board.squares[2][1].piece.belongsToPlayer == playerNumber ? "1" :  "0"
            conclusion += board.squares[2][2].piece.belongsToPlayer == playerNumber ? "1" :  "0"
            
        //first column
        case 3:
            conclusion += board.squares[0][0].piece.belongsToPlayer == playerNumber ? "1" :  "0"
            conclusion += board.squares[1][0].piece.belongsToPlayer == playerNumber ? "1" :  "0"
            conclusion += board.squares[2][0].piece.belongsToPlayer == playerNumber ? "1" :  "0"
            
            
        //middle column
        case 4:
            conclusion += board.squares[0][1].piece.belongsToPlayer == playerNumber ? "1" :  "0"
            conclusion += board.squares[1][1].piece.belongsToPlayer == playerNumber ? "1" :  "0"
            conclusion += board.squares[2][1].piece.belongsToPlayer == playerNumber ? "1" :  "0"
            
            
        //right column
        case 5:
            conclusion += board.squares[0][2].piece.belongsToPlayer == playerNumber ? "1" :  "0"
            conclusion += board.squares[1][2].piece.belongsToPlayer == playerNumber ? "1" :  "0"
            conclusion += board.squares[2][2].piece.belongsToPlayer == playerNumber ? "1" :  "0"
            
            
        //left diagional
        case 6:
            conclusion += board.squares[0][0].piece.belongsToPlayer == playerNumber ? "1" :  "0"
            conclusion += board.squares[1][1].piece.belongsToPlayer == playerNumber ? "1" :  "0"
            conclusion += board.squares[2][2].piece.belongsToPlayer == playerNumber ? "1" :  "0"
            
        //right diagonal
        case 7:
            conclusion += board.squares[0][2].piece.belongsToPlayer == playerNumber ? "1" :  "0"
            conclusion += board.squares[1][1].piece.belongsToPlayer == playerNumber ? "1" :  "0"
            conclusion += board.squares[2][0].piece.belongsToPlayer == playerNumber ? "1" :  "0"
            
            
        default:()
        }
        
        
        return conclusion
        
    }
    
    
    func firstAvaliable(isCorner: Bool)-> (row: Int, col: Int)?{
        let spots = isCorner ? [(row:0, col:0),(row:0, col:2),(row:2, col:0),(row:2, col:2)] : [(row:0, col:1),(row:1, col:0),(row:1, col:2),(row:2, col:1)]
        
        for spot in spots {
            if(board.squares[spot.row][spot.col].piece.belongsToPlayer == nil){
                return spot
            }
        }
        return nil
    }
    
    
    
    func displayWinnerMessage(winnerIsPlayer: Bool){
        var title = ""
        if(winnerIsPlayer){
            title = "You have Won!"
        }
        else{
            title = "You have Lost!"
        }
        
        let winnerAlertController = UIAlertController(title: title, message: "Would you like to play again?", preferredStyle: .alert)
        winnerAlertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: {(action) in
            self.prepareForNewGame()
        }))
        winnerAlertController.addAction(UIAlertAction(title: "No", style: .cancel, handler: {(action) in
            self.dismiss(animated: true, completion: nil)
            
        }))
        self.present(winnerAlertController, animated: true, completion: nil)
        
    }
    
    override func prepareForNewGame() {
        super.prepareForNewGame()
        self.winnerOrTie = false
    }
    
    
    

}

