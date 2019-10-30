//
//  JobDetailTableViewCell.swift
//  CVEduardoFonseca
//
//  Created by Eduardo Fonseca on 30/10/19.
//  Copyright © 2019 Eduardo Fonseca. All rights reserved.
//

import UIKit

class JobDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var company_image : UIImageView!
    @IBOutlet weak var company_title : UILabel!
    @IBOutlet weak var company_desc : UILabel!
    @IBOutlet weak var company_tasks : UILabel!
    
    
     func setupInfo(detailInfo:JobItem){
        self.company_image.getImage(from: detailInfo.company_image_url)
        self.company_title.text = detailInfo.company + " - " + detailInfo.title
        self.company_desc.text = detailInfo.desc
        self.company_tasks.text = detailInfo.taks
    }

}
