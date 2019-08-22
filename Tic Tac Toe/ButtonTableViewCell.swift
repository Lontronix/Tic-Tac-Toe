//
//  ButtonTableViewCell.swift
//  Tic Tac Toe
//
//  Created by Lonnie Gerol on 1/27/19.
//  Copyright © 2019 Lontronix. All rights reserved.
//

import UIKit


protocol ButtonTableViewCellDelegate{
    func buttonPressed(sender: UIButton)
    
}

class ButtonTableViewCell: UITableViewCell {
    private var button: UIButton!
    var buttonColor: UIColor!
    var buttonText: String!
    var buttonTag: Int!
    
    var delegate: ButtonTableViewCellDelegate!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: nil)
        contentView.backgroundColor = UIColor.clear
        self.backgroundColor = UIColor.clear
       
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        button = UIButton()
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        button.setTitle(buttonText, for: .normal)
        button.backgroundColor = buttonColor
        button.layer.cornerRadius = 8
        button.tag = buttonTag
        button.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(button)
        
        contentView.addConstraints([
            button.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            button.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func buttonPressed(_ sender: UIButton){
        delegate.buttonPressed(sender: sender)
    }
    
    
  

}
