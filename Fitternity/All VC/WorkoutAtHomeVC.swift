//
//  WorkoutAtHomeVC.swift
//  Fitternity
//
//  Created by Chandresh Kachariya on 05/04/21.
//

import UIKit

class WorkoutAtHomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    func callApiForGetHomeWorkoutAtHome() {
        
        HttpClientApi.instance().callAPI(url: _api_HomeScreenAtHome, params: nil, showLoading: true,  methods: .GET, success: { (mainData) in
            //po (data as! [String : Any])["user_data"]
            
            let dictData = (mainData as! [String : Any]) as NSDictionary
            print(dictData)
                        
            let Vc = self.navigationController?.viewControllers.last as! HomeVC
            Vc.getTagsFromWorkoutAtHomeVC(arrTags: dictData.value(forKey: product_tags) as! NSArray)
            
        }) { (fail) in
            Helper.showAlert(title: fail as? String, message: nil)
        }
    }
    
}
