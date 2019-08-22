//
//  InitalViewController.swift
//  Tic Tac Toe
//
//  Created by Lonnie Gerol on 1/27/19.
//  Copyright © 2019 Lontronix. All rights reserved.
//

import UIKit

struct Colors {
    static var lightGray: UIColor  { return UIColor(red: 69/255, green: 90/255, blue: 100/255, alpha: 1) }
    static var lightBlue: UIColor {return UIColor(red: 33/255, green: 150/255, blue: 243/255, alpha: 1.0)}
    static var orange: UIColor {return UIColor(red: 255/255, green: 87/255, blue: 34/255, alpha: 1.0)}
    static var lightBlueGray: UIColor {return UIColor(red: 144/255, green: 164/255, blue: 174/255, alpha: 1.0)}
    static var darkGray: UIColor { return UIColor(red: 55/255, green: 71/255, blue: 79/255, alpha: 1.0)}
        
    }



class InitalViewController: UIViewController {

    var singlePlayerButton: UIButton!
    var multiplayerButton: UIButton!
    var creditLabel: UILabel!
    var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Welcome"
        view.backgroundColor = Colors.lightGray
         containerView = UIView()
        containerView.backgroundColor = Colors.lightBlueGray
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        view.addConstraints([
                containerView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 15),
                containerView.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 0),
                containerView.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: 0)
            ])
        
        containerView.addConstraint(NSLayoutConstraint(item: containerView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150.0))
      
        
        
        
        
        let headerLabel = UILabel()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.text = "Welcome to Tic Tac Toe!"
        headerLabel.textColor = UIColor.white
        headerLabel.font = UIFont(name: "chalkduster", size: 25)
        headerLabel.textAlignment = .center
        headerLabel.numberOfLines = 0
        
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.text = "Please select if you would like to play against another person or an AI Opponent."
        textLabel.font = UIFont(name: "Chalkboard se", size: 15)
        textLabel.numberOfLines = 0
        textLabel.textColor = UIColor.white
        textLabel.textAlignment = .left
        textLabel.minimumScaleFactor = 0.5
        
        containerView.addSubview(headerLabel)
        containerView.addSubview(textLabel)
        
        containerView.addConstraints([
            headerLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            headerLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            headerLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            //textLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            textLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 5),
            textLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -5)
            
            ])
        
        containerView.addConstraint(NSLayoutConstraint(item: headerLabel, attribute: .bottom, relatedBy: .equal, toItem: textLabel, attribute: .top, multiplier: 1, constant: 0))
        
        headerLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 900), for: .vertical)
        
        containerView.addConstraint(NSLayoutConstraint(item: containerView, attribute: .bottom, relatedBy: .equal, toItem:textLabel, attribute: .bottom, multiplier: 1, constant: 0))

        
        singlePlayerButton = UIButton()
        singlePlayerButton.tag = 0
        singlePlayerButton.titleLabel?.font = UIFont(name: "chalkduster", size: 15)
        singlePlayerButton.setTitle("Play versus an AI", for: .normal)
        singlePlayerButton.translatesAutoresizingMaskIntoConstraints = false
        singlePlayerButton.backgroundColor = Colors.lightBlue
        singlePlayerButton.addTarget(self, action: #selector(gameTypeButtonPressed(_:)), for: .touchUpInside)
        view.addSubview(singlePlayerButton)
        
        view.addConstraints([
            singlePlayerButton.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 20),
            singlePlayerButton.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -20)
            ])
        
        view.addConstraint(NSLayoutConstraint(item: singlePlayerButton, attribute: .top, relatedBy: .equal, toItem: containerView, attribute: .bottom, multiplier: 1, constant: 50))
        view.addConstraint(NSLayoutConstraint(item: singlePlayerButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50))
        
        singlePlayerButton.layer.cornerRadius = 10
        
        
        multiplayerButton = UIButton()
        multiplayerButton.tag = 1
        multiplayerButton.translatesAutoresizingMaskIntoConstraints = false
        multiplayerButton.titleLabel?.font = UIFont(name: "chalkduster", size: 15)
        multiplayerButton.setTitle("Play versus a friend", for: .normal)
        multiplayerButton.backgroundColor = Colors.orange
        multiplayerButton.layer.cornerRadius = 10
        multiplayerButton.addTarget(self, action: #selector(gameTypeButtonPressed(_:)), for: .touchUpInside)
        view.addSubview(multiplayerButton)
        view.addConstraints([
            multiplayerButton.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 20),
            multiplayerButton.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -20)
            
            ])
        view.addConstraint(NSLayoutConstraint(item: multiplayerButton, attribute: .top, relatedBy: .equal, toItem: singlePlayerButton, attribute: .bottom, multiplier: 1, constant: 50))
        view.addConstraint(NSLayoutConstraint(item: multiplayerButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50))
        
        
        creditLabel = UILabel()
        creditLabel.translatesAutoresizingMaskIntoConstraints = false
        creditLabel.text = "Tic Tac Toe was written by Lonnie Gerol"
        creditLabel.textColor = UIColor.white
        creditLabel.font = UIFont(name: "chalkboard se", size: 12)
        creditLabel.textAlignment = .center
        view.addSubview(creditLabel)
        
        view.addConstraints([
            creditLabel.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 0),
            creditLabel.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: 0),
            creditLabel.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: 0)
        
            
            
            ])
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
     
        containerView.layer.cornerRadius = 7
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowOffset = CGSize.zero
        containerView.layer.shadowRadius = 10
        
        singlePlayerButton.layer.cornerRadius = 7
        singlePlayerButton.layer.shadowColor = UIColor.black.cgColor
        singlePlayerButton.layer.shadowOpacity = 0.10
        singlePlayerButton.layer.shadowOffset = CGSize.zero
        singlePlayerButton.layer.shadowRadius = 10
        
        multiplayerButton.layer.cornerRadius = 7
        multiplayerButton.layer.shadowColor = UIColor.black.cgColor
        multiplayerButton.layer.shadowOpacity = 0.10
        multiplayerButton.layer.shadowOffset = CGSize.zero
        multiplayerButton.layer.shadowRadius = 10

    }
    
    
    @objc func gameTypeButtonPressed(_ sender: UIButton){
        displayAlertController(isSinglePlayer: sender.tag == 0)
      
    }
    
    func displayAlertController(isSinglePlayer: Bool){
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
    
        alertController.addAction(UIAlertAction(title: "Canel", style: .cancel, handler: nil))
        
        if(isSinglePlayer){
            alertController.title = "Please Select a Difficulty"
            alertController.addAction(UIAlertAction(title: "Easy", style: .default, handler: {(action) in
                let singlePlayerVC = SinglePlayerGameViewController()
                    singlePlayerVC.difficulty = 0
                self.present(singlePlayerVC, animated: true, completion: nil)
                
            }))
            alertController.addAction(UIAlertAction(title: "Hard", style: .default, handler: {(action) in
                let singlePlayerVC = SinglePlayerGameViewController()
                    singlePlayerVC.difficulty = 1
                self.present(singlePlayerVC, animated: true, completion: nil)
                
            }))
        }
        else{
            alertController.addAction(UIAlertAction(title: "Save", style: .default, handler: {(action) in
                let multiPlayerVC = MultiplayerGameViewController()
                
                multiPlayerVC.playerOneName = alertController.textFields![0].text!
                
                if let playerTwoName = alertController.textFields?[1].text{
                    multiPlayerVC.playerTwoName = playerTwoName
                }
                
                self.present(multiPlayerVC, animated: true, completion: nil)
                
            }))
            
            
          alertController.title = "Please Enter Both Players Names"
            
            alertController.addTextField(configurationHandler: {(textField) in
                textField.clearButtonMode = UITextField.ViewMode.whileEditing
                textField.placeholder = "Player One's name"
        })
            alertController.addTextField(configurationHandler: {(textfield) in
                textfield.clearButtonMode = UITextField.ViewMode.whileEditing
                textfield.placeholder = "Player Two's name"
                
            })
    
        
        
    }
    self.present(alertController, animated: true, completion: nil)
    
    
    
}
}
