//
//  InfoLabel.swift
//  Tic Tac Toe
//
//  Created by Lonnie Gerol on 2/3/19.
//  Copyright © 2019 Lontronix. All rights reserved.
//

import UIKit

class InfoLabel: UILabel {

    init(){
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.numberOfLines = 0
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = UIFont(name: "Chalkduster", size: 24)
        self.textColor = UIColor.white
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
