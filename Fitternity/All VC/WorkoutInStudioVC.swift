//
//  WorkoutInStudioVC.swift
//  Fitternity
//
//  Created by Chandresh Kachariya on 05/04/21.
//

import UIKit

class WorkoutInStudioVC: UIViewController {

    var dictStudioData = NSDictionary()
    
    /***************UITableView***********************/
    @IBOutlet weak var tblView: UITableView!
    var refreshControl = UIRefreshControl()

    /*************  TableViewCell  ************************/
    let reuseIdentifierCampaignsTVCell = "CampaignsTVCell"
    let reuseIdentifierCategoriesTVCell = "CategoriesTVCell"
    let reuseIdentifierOnepassTVCell = "OnepassTVCell"
    let reuseIdentifierUpcomingClassesTVCell = "UpcomingClassesTVCell"
    let reuseIdentifierFitnessCentresTVCell = "FitnessCentresTVCell"
    let reuseIdentifierOffersTVCell = "OffersTVCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initSetup()
    }
    
    func initSetup() {
        
        tblView.estimatedRowHeight = UITableView.automaticDimension
        tblView.delegate = self
        tblView.dataSource = self
        
        tblView.register(UINib(nibName: reuseIdentifierCampaignsTVCell, bundle: nil), forCellReuseIdentifier: reuseIdentifierCampaignsTVCell)
        tblView.register(UINib(nibName: reuseIdentifierCategoriesTVCell, bundle: nil), forCellReuseIdentifier: reuseIdentifierCategoriesTVCell)
        tblView.register(UINib(nibName: reuseIdentifierOnepassTVCell, bundle: nil), forCellReuseIdentifier: reuseIdentifierOnepassTVCell)
        tblView.register(UINib(nibName: reuseIdentifierUpcomingClassesTVCell, bundle: nil), forCellReuseIdentifier: reuseIdentifierUpcomingClassesTVCell)
        tblView.register(UINib(nibName: reuseIdentifierFitnessCentresTVCell, bundle: nil), forCellReuseIdentifier: reuseIdentifierFitnessCentresTVCell)
        tblView.register(UINib(nibName: reuseIdentifierOffersTVCell, bundle: nil), forCellReuseIdentifier: reuseIdentifierOffersTVCell)

        tblView.tableFooterView = UIView.init()
        
        //refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: UIControl.Event.valueChanged)
        tblView.addSubview(refreshControl)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK:- WebServices
    func callApiForGetHomeScreenInStudio() {
        
        HttpClientApi.instance().callAPI(url: _api_HomeScreenInStudio, params: nil, showLoading: true,  methods: .GET, success: { (mainData) in
            
            self.dictStudioData = (mainData as! [String : Any]) as NSDictionary
            print(self.dictStudioData)
                        
            let Vc = self.navigationController?.viewControllers.last as! HomeVC
            Vc.getTagsFromWorkoutInStudioVC(arrTags: self.dictStudioData.value(forKey: product_tags) as! NSArray)
            
            self.tblView.reloadData()
            
        }) { (fail) in
            Helper.showAlert(title: fail as? String, message: nil)
        }
    }

}

extension WorkoutInStudioVC: UITableViewDataSource, UITableViewDelegate {
   
    @objc func refresh(sender:AnyObject) {
       // Code to refresh table view
        refreshControl.endRefreshing()
        
        callApiForGetHomeScreenInStudio()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return (dictStudioData.value(forKey: section_orders) as? NSArray ?? NSArray()).count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { //campaigns
            return 0
        }
        else if section == 1 { // categories
            return 2
        }
        else if section == 2 { // onepass_pre
            return 2
        }
        else if section == 3 { // upcoming_classes
            return 2
        }
        else if section == 4 { // fitness_centres
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 { //campaigns
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierCampaignsTVCell, for: indexPath) as! CampaignsTVCell

            return cell
        }
        else if indexPath.section == 1 { // categories
            
            if indexPath.row == 0 {
               
                let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierCategoriesTVCell, for: indexPath) as! CategoriesTVCell

                let dictCategories = dictStudioData.value(forKey: categories) as? NSDictionary ?? NSDictionary()
                
                cell.updateCell(dictCategories: dictCategories)
                
                return cell
            }else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierOffersTVCell, for: indexPath) as! OffersTVCell
                
                let dictCampaign = (dictStudioData.value(forKey: categories) as? NSDictionary ?? NSDictionary()).value(forKey: campaign) as? NSDictionary ?? NSDictionary()

                cell.imgView.getImage(url: (dictCampaign.value(forKey: image) as? String ?? ""), placeholderImage: UIImage.init(named: placeholderImage)) { (done) in
                    
                    cell.imgView.contentMode = .scaleAspectFill
                } failer: { (failed) in
                    cell.imgView.image = UIImage.init(named: placeholderImage)
                    cell.imgView.contentMode = .center
                }

                cell.lblTitle.text = dictCampaign.value(forKey: title_key) as? String ?? ""
                
                return cell
            }
            
        }
        else if indexPath.section == 2 { // onepass_pre

            if indexPath.row == 0 {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierOnepassTVCell, for: indexPath) as! OnepassTVCell

                cell.updateCell(dictOnepassPre: (dictStudioData.value(forKey: onepass_pre) as? NSDictionary ?? NSDictionary()))
                
                return cell
            }else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierOffersTVCell, for: indexPath) as! OffersTVCell

                let dictCampaign = (dictStudioData.value(forKey: onepass_pre) as? NSDictionary ?? NSDictionary()).value(forKey: campaign) as? NSDictionary ?? NSDictionary()

                cell.imgView.getImage(url: (dictCampaign.value(forKey: image) as? String ?? ""), placeholderImage: UIImage.init(named: placeholderImage)) { (done) in
                    
                    cell.imgView.contentMode = .scaleAspectFill
                } failer: { (failed) in
                    cell.imgView.image = UIImage.init(named: placeholderImage)
                    cell.imgView.contentMode = .center
                }

                cell.lblTitle.text = dictCampaign.value(forKey: title_key) as? String ?? ""
                
                return cell
            }
            
        }
        else if indexPath.section == 3 { // upcoming_classes

            if indexPath.row == 0 {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierUpcomingClassesTVCell, for: indexPath) as! UpcomingClassesTVCell

                return cell
            }else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierOffersTVCell, for: indexPath) as! OffersTVCell

                let dictCampaign = (dictStudioData.value(forKey: upcoming_classes) as? NSDictionary ?? NSDictionary()).value(forKey: campaign) as? NSDictionary ?? NSDictionary()

                cell.imgView.getImage(url: (dictCampaign.value(forKey: image) as? String ?? ""), placeholderImage: UIImage.init(named: placeholderImage)) { (done) in
                    
                    cell.imgView.contentMode = .scaleAspectFill
                } failer: { (failed) in
                    cell.imgView.image = UIImage.init(named: placeholderImage)
                    cell.imgView.contentMode = .center
                }

                cell.lblTitle.text = dictCampaign.value(forKey: title_key) as? String ?? ""
                
                return cell
            }
            
        }
        else if indexPath.section == 4 { // fitness_centres
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierFitnessCentresTVCell, for: indexPath) as! FitnessCentresTVCell

            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierCampaignsTVCell, for: indexPath) as! CampaignsTVCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
