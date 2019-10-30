//
//  JobDetailViewController.swift
//  CVEduardoFonseca
//
//  Created by Eduardo Fonseca on 30/10/19.
//  Copyright © 2019 Eduardo Fonseca. All rights reserved.
//

import UIKit

class JobDetailViewController: UIViewController {
    //Outlets
    @IBOutlet weak var tb_detail : UITableView!
    //segue Variables
    var jobDetail : JobItem!
    //Constants
    fileprivate let jobDetailCellIdentifier = "detailIndentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Job detail:" + jobDetail.company
        tb_detail.tableFooterView = UIView()
        tb_detail.allowsSelection = false
    }
}

extension JobDetailViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: jobDetailCellIdentifier) as! JobDetailTableViewCell
        cell.setupInfo(detailInfo: jobDetail)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
    
}
