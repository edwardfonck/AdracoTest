//
//  ViewController.swift
//  CVEduardoFonseca
//
//  Created by Eduardo Fonseca on 24/10/19.
//  Copyright © 2019 Eduardo Fonseca. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MXParallaxHeaderDelegate{
    //Outlets
    @IBOutlet weak var avatar : UIImageView!
    @IBOutlet weak var name_label : UILabel!
    @IBOutlet weak var table_view_CV : UITableView!
    @IBOutlet weak var view_header : UIView!
    
    //Needed variables
    let personCV = PersonalInfo.personInfo
    let jobs = InfoJobs.jobs()
    
    //Contants
    let cellInfoIdentifier = "infoIndetifier"
    let segueDetail = "segueDetail"
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        fillInfoHeader()
        self.table_view_CV.delegate = self
        self.table_view_CV.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // setupheaderView()
    }

    func setupheaderView(){
        self.table_view_CV.tableFooterView = UIView.init()
        self.table_view_CV.parallaxHeader.view = self.view_header!
        self.table_view_CV.parallaxHeader.minimumHeight = 500
        self.table_view_CV.parallaxHeader.mode = .bottom
        self.table_view_CV.parallaxHeader.minimumHeight = 70
       
    }
    
    func fillInfoHeader(){
        guard let avatarImg = personCV.avatar, let name = personCV.my_name else { return }
        avatar.image = avatarImg
        name_label.text = name
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueDetail {
            if let nextVC = segue.destination as? JobDetailViewController {
                nextVC.jobDetail = sender as? JobItem
            }
        }
    }
    
    func parallaxHeaderDidScroll(_ parallaxHeader: MXParallaxHeader) {
        
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 5 {
            return jobs.count
        }else
        {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellInfoIdentifier) as! InfoTableViewCell
        cell.infoLabel.font = UIFont.systemFont(ofSize: 17.0)
        switch indexPath.section {
               case 0:
                cell.infoSetup(info: personCV.education)
                   
               case 1:
                  cell.infoSetup(info: personCV.email)
                  break
               case 2:
                   cell.infoSetup(info: personCV.phone)
                   break
               case 3:
                   cell.infoSetup(info: personCV.brief)
                   break
               case 4:
                   cell.infoSetup(info: personCV.professional_Summary)
                   break
               case 5:
                   cell.infoLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
                   cell.infoSetup(info: "\(jobs[indexPath.row].company) - \(jobs[indexPath.row].period)")
                   break
               default:
                   debugPrint("default")
               }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Education:"
            
        case 1:
            return "Mail address:"
           
        case 2:
            return "Phone:"
            
        case 3:
            return "Brief:"
            
        case 4:
            return "Profesional Summary:"
            
        case 5:
            return "Jobs history: select one for more details"
            
        default:
            debugPrint("default")
        }
        return ""
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 5 {
            self.performSegue(withIdentifier: segueDetail, sender: jobs[indexPath.row])
        }
        self.table_view_CV .deselectRow(at: indexPath, animated: true)
    }
}
