//
//  GameViewController.swift
//  Tic Tac Toe
//
//  Created by Lonnie Gerol on 2/3/19.
//  Copyright © 2019 Lontronix. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    var board: BoardView!
    var infoLabel: InfoLabel!
    var oSpawner = UIImageView(image: UIImage(named: "o piece"))
    var xSpawner = UIImageView(image: UIImage(named: "x piece"))
    var currentHighlightedPiece: SquareView!
    var IsPlayerOneTurn: Bool!
    var floatingPiece: UIImageView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Colors.lightGray
        board = BoardView(squareColor: Colors.lightGray, highlightColor: Colors.darkGray)
        self.view.addSubview(board)
        
        self.view.addConstraints([
            board.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            board.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            ])
        
        
        infoLabel = InfoLabel()
        infoLabel.text = "test"
        self.view.addSubview(infoLabel)
        infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
      
        makeXSpawner()
        makeOSpawner()
        nextTurn()
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        infoLabel.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: board.frame.minY / 2.0).isActive = true
        updateViewConstraints()
    }
    
    
    

    func makeOSpawner(){
        oSpawner = UIImageView(image: UIImage(named: "o piece"))
        oSpawner.translatesAutoresizingMaskIntoConstraints = false
        oSpawner.contentMode = .scaleToFill
        self.view.addSubview(oSpawner)
        oSpawner.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        oSpawner.topAnchor.constraint(equalTo: board.bottomAnchor, constant: 5).isActive = true
        oSpawner.widthAnchor.constraint(equalToConstant: 80).isActive = true
        oSpawner.heightAnchor.constraint(equalToConstant: 80).isActive = true
        oSpawner.isUserInteractionEnabled = true
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(gamePieceDidPan(panGesuture:)))
        oSpawner.addGestureRecognizer(gesture)
        updateViewConstraints()
        
    }
    
    
    func makeXSpawner(){
        xSpawner = UIImageView(image: UIImage(named: "x piece"))
        xSpawner.translatesAutoresizingMaskIntoConstraints = false
        xSpawner.contentMode = .scaleToFill
        self.view.addSubview(xSpawner)
        xSpawner.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        xSpawner.topAnchor.constraint(equalTo: board.bottomAnchor, constant: 5).isActive = true
        xSpawner.widthAnchor.constraint(equalToConstant: 80).isActive = true
        xSpawner.heightAnchor.constraint(equalToConstant: 80).isActive = true
        updateViewConstraints()
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(gamePieceDidPan(panGesuture:)))
        xSpawner.addGestureRecognizer(gesture)
        xSpawner.isUserInteractionEnabled = true
        
    }
    
    @objc func gamePieceDidPan(panGesuture: UIPanGestureRecognizer){
        var tempPiece = panGesuture.view
        if(panGesuture.state == .began){
            floatingPiece = tempPiece as! UIImageView
            if(panGesuture.view == xSpawner){
                makeXSpawner()
            }
            else{
                makeOSpawner()
            }
        }
        
        else if(panGesuture.state == .ended){
            let piecePlaced = attemptToPlacePiece(withPoint: panGesuture.location(in: board))
            
            if piecePlaced{
                nextTurn()
            }
            else{
                
            }
            
            tempPiece!.removeFromSuperview()
            tempPiece = nil
            floatingPiece = nil
            currentHighlightedPiece?.backgroundColor = board.squareColor
            currentHighlightedPiece = nil
            
            
            
        }
        else if(floatingPiece == panGesuture.view){
        
            let point = panGesuture.location(in: view)
            tempPiece?.center = point
            
            
            for row in 0 ..< board.squares.count{
                for col in 0 ..< board.squares[0].count{
                    if board.squares[row][col].frame.contains(panGesuture.location(in: board)) && board.squares[row][col].piece.belongsToPlayer == nil{
                        board.squares[row][col].backgroundColor = board.highlightColor
                        currentHighlightedPiece = board.squares[row][col]
                        break
                    }
                    else{
                        board.squares[row][col].backgroundColor = board.squareColor
                    }
                    
                }
            }
        }}
    
    
    func attemptToPlacePiece(withPoint: CGPoint) -> Bool{
        var pieceWasPlaced = false
        for row in 0 ..< board.squares.count{
            for col in 0 ..< board.squares[0].count{
                if board.squares[row][col].frame.contains(withPoint) && board.squares[row][col].piece.belongsToPlayer == nil{
                    board.squares[row][col].piece.display(isPlayerOne: IsPlayerOneTurn)
                    pieceWasPlaced = true
                    break
                }
                
            }
        }
        return pieceWasPlaced
        
    }
    
    
    func nextTurn(){
        
        
    }
    
    
    func prepareForNewGame(){
        IsPlayerOneTurn = nil
        for array in board.squares{
            for square in array{
                square.piece.remove()
                
            }
        }
        nextTurn()
        
    }
    
    
    func displayTieAlertController(){
        let tieAlertController = UIAlertController(title: "Cats game!", message: "Would you like to play again?", preferredStyle: .alert)
        tieAlertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: {(action) in
            self.prepareForNewGame()
        }))
        tieAlertController.addAction(UIAlertAction(title: "No", style: .cancel, handler: {(action) in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(tieAlertController, animated: true, completion: nil)
    }
}
