//
//  MessageTableViewCell.swift
//  Tic Tac Toe
//
//  Created by Lonnie Gerol on 1/27/19.
//  Copyright © 2019 Lontronix. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    private var containerView: UIView!
    var headerLabel: UILabel!
    var bodyLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: nil)
        containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.cornerRadius = 8
        containerView.backgroundColor = UIColor.white
        contentView.addSubview(containerView)
        
        contentView.backgroundColor = UIColor.clear
        self.backgroundColor = UIColor.clear
        contentView.addConstraints([
            containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
            ])
        
        
        headerLabel = UILabel()
        headerLabel.numberOfLines = 0
        headerLabel.text = "Welcome to Tic Tac Toe!"
        headerLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        bodyLabel = UILabel()
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.numberOfLines = 0
        bodyLabel.text = "Please select if you would like to play versus an AI or a real opponent"
    
        containerView.addSubview(headerLabel)
        containerView.addSubview(bodyLabel)

        
      
        containerView.addConstraints([
            headerLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            headerLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 5),
            headerLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -5)
            ])
        
        containerView.addConstraints([
            bodyLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 5),
            bodyLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -5),
            bodyLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            
            ])

        
        containerView.addConstraint(NSLayoutConstraint(item: headerLabel, attribute: .bottom, relatedBy: .equal, toItem: bodyLabel, attribute: .top, multiplier: 1, constant: 0))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
}
