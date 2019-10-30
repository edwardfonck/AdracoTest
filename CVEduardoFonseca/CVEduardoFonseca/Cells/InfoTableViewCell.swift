//
//  InfoTableViewCell.swift
//  CVEduardoFonseca
//
//  Created by Eduardo Fonseca on 29/10/19.
//  Copyright © 2019 Eduardo Fonseca. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    @IBOutlet weak var infoLabel : UILabel!
    
    func infoSetup(info:String){
        self.infoLabel.text = info
    }

}
