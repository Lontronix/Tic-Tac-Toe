//
//  SquareView.swift
//  Tic Tac Toe
//
//  Created by Lonnie Gerol on 1/27/19.
//  Copyright © 2019 Lontronix. All rights reserved.
//

import UIKit

class Piece: UIImageView{
     var belongsToPlayer: Int?
    
   override init(frame: CGRect){
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func display(isPlayerOne: Bool){
        if(isPlayerOne){
            self.image = UIImage(named: "x piece")
            self.belongsToPlayer = 0
            self.isHidden = false
        }
        else{
            self.image = UIImage(named: "o piece")
            self.belongsToPlayer = 1
            self.isHidden = false
        }
        
    }
    
    func remove(){
        self.image = nil
        self.belongsToPlayer = nil
        self.isHidden = true
    }
    
    
}


class SquareView: UIView {
    var piece: Piece!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        piece = Piece(frame: frame)
        piece.isHidden = true
        
        
        
    }
    
    override func layoutSubviews() {
        self.addSubview(piece)
        self.addConstraints([
            piece.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            piece.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            piece.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            piece.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
            
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class BoardView: UIView{
    var squares = [[SquareView]]()
    var squareColor: UIColor!
    var highlightColor: UIColor!
    
    init(squareColor: UIColor, highlightColor: UIColor){
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: 0.0))
        self.squareColor = squareColor
        self.highlightColor = highlightColor
        self.translatesAutoresizingMaskIntoConstraints = false
     
        self.widthAnchor.constraint(equalToConstant: 310).isActive = true
        self.heightAnchor.constraint(equalToConstant: 310).isActive = true
        self.backgroundColor = UIColor.white
        self.makeSquares()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeSquares(){
        var xPos = 0
        var yPos = 0
        for _ in 0...2{
            var tempArray = [SquareView]()
            for _ in 0...2{
                let square = SquareView(frame: CGRect(x: xPos, y: yPos, width: 100, height: 100))
                square.backgroundColor = squareColor
                self.addSubview(square)
                tempArray.append(square)
                xPos += 105
            }
            squares.append(tempArray)
            xPos = 0
            yPos += 105
        }
        
    }
    
    
    
    func checkForVictoryOrTie() -> Int?{
        //Horizontal Victories
        if squares[0][0].piece.belongsToPlayer == 0 &&
            squares[0][1].piece.belongsToPlayer == 0 &&
            squares[0][2].piece.belongsToPlayer == 0{
            return 1
            
        }
        else if squares[0][0].piece.belongsToPlayer == 1 &&
            squares[0][1].piece.belongsToPlayer == 1 &&
            squares[0][2].piece.belongsToPlayer == 1{
            return 2
        }
        else if squares[1][0].piece.belongsToPlayer == 0 &&
            squares[1][1].piece.belongsToPlayer == 0 &&
            squares[1][2].piece.belongsToPlayer == 0 {
            return 1
            
        }
        else if squares[1][0].piece.belongsToPlayer == 1 &&
            squares[1][1].piece.belongsToPlayer == 1 &&
            squares[1][2].piece.belongsToPlayer == 1 {
            return 2
            
        }
        else if squares[2][0].piece.belongsToPlayer == 0 &&
            squares[2][1].piece.belongsToPlayer == 0 &&
            squares[2][2].piece.belongsToPlayer == 0 {
            return 1
            
        }
        else if squares[2][0].piece.belongsToPlayer == 1 &&
            squares[2][1].piece.belongsToPlayer == 1 &&
            squares[2][2].piece.belongsToPlayer == 1 {
            return 2
            
        }
            //Vertical Victories
        else if squares[0][0].piece.belongsToPlayer == 0 &&
            squares[1][0].piece.belongsToPlayer == 0 &&
            squares[2][0].piece.belongsToPlayer == 0 {
            return 1
            
        }
        else if squares[0][0].piece.belongsToPlayer == 1 &&
            squares[1][0].piece.belongsToPlayer == 1 &&
            squares[2][0].piece.belongsToPlayer == 1 {
            return 2
            
        }
        else if squares[0][1].piece.belongsToPlayer == 0 &&
            squares[1][1].piece.belongsToPlayer == 0 &&
            squares[2][1].piece.belongsToPlayer == 0 {
            return 1
            
        }
        else if squares[0][1].piece.belongsToPlayer == 1 &&
            squares[1][1].piece.belongsToPlayer == 1 &&
            squares[2][1].piece.belongsToPlayer == 1 {
            return 2
            
        }
        else if squares[0][2].piece.belongsToPlayer == 0 &&
            squares[1][2].piece.belongsToPlayer == 0 &&
            squares[2][2].piece.belongsToPlayer == 0 {
            return 1
            
        }
        else if squares[0][2].piece.belongsToPlayer == 1 &&
            squares[1][2].piece.belongsToPlayer == 1 &&
            squares[2][2].piece.belongsToPlayer == 1 {
            return 2
            
        }
            //Diagonal Victories
        else if squares[0][0].piece.belongsToPlayer == 0 &&
            squares[1][1].piece.belongsToPlayer == 0 &&
            squares[2][2].piece.belongsToPlayer == 0 {
            return 1
            
        }
        else if squares[0][0].piece.belongsToPlayer == 1 &&
            squares[1][1].piece.belongsToPlayer == 1 &&
            squares[2][2].piece.belongsToPlayer == 1 {
            return 2
        }
        else if squares[2][0].piece.belongsToPlayer == 0 &&
            squares[1][1].piece.belongsToPlayer == 0 &&
            squares[0][2].piece.belongsToPlayer == 0 {
            return 1
            
        }
        else if squares[2][0].piece.belongsToPlayer == 1 &&
            squares[1][1].piece.belongsToPlayer == 1 &&
            squares[0][2].piece.belongsToPlayer == 1 {
            return 2
            
        }
            
        else{
            //checking for a tie
            var tie = true
            for row in 0 ..< squares.count{
                for col in 0 ..< squares[0].count{
                    if squares[row][col].piece.belongsToPlayer == nil{
                        tie = false
                        break
                        
                    }
                    
                }
                
            }
            if tie{return 0}
            else {return nil}
            
            
        }
        
    }
    
    
    
}
