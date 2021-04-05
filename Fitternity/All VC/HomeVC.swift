//
//  HomeVC.swift
//  Fitternity
//
//  Created by Chandresh Kachariya on 04/04/21.
//

import UIKit

class HomeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var arrTags = NSArray()
    
    /*************** UILabel **********************/
    @IBOutlet weak var lblYourLocation: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblSelection: UILabel!
    
    /*************** UITableView **********************/
    @IBOutlet weak var containerViewStudio: UIView!
    @IBOutlet weak var containerViewHome: UIView!

    /*************** UICollectionView **********************/
    @IBOutlet weak var collectionViewTags: UICollectionView!
    
    /*************** UIButton **********************/
    @IBOutlet weak var btnWorkoutInStudio: UIButton!
    @IBOutlet weak var btnWorkoutAtHome: UIButton!

    /*************** NSLayoutConstraint **********************/
    @IBOutlet weak var lblSelectionLeftConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initSetup()
        
    }
    
    func initSetup() {
        lblYourLocation.textColor = grayColor
        lblYourLocation.font = getFont(fontName: _font_Montserrat_Regular, fontSize: 12)
        
        lblLocation.textColor = blackColor
        lblLocation.font = getFont(fontName: _font_Montserrat_Regular, fontSize: 15)
        
        collectionViewTags.backgroundColor = whiteColor_light
        
        btnWorkoutInStudio.setTitleColor(blackColor, for: UIControl.State.normal)
        btnWorkoutInStudio.setTitleColor(greenColor, for: UIControl.State.selected)
        btnWorkoutInStudio.titleLabel?.font = getFont(fontName: _font_Montserrat_SemiBold, fontSize: 15)

        btnWorkoutAtHome.setTitleColor(blackColor, for: UIControl.State.normal)
        btnWorkoutAtHome.setTitleColor(greenColor, for: UIControl.State.selected)
        btnWorkoutAtHome.titleLabel?.font = getFont(fontName: _font_Montserrat_SemiBold, fontSize: 15)
        
        lblSelection.backgroundColor = greenColor
        
        btnWorkoutInStudio(self)
        
        self.collectionViewTags.dataSource = self
        self.collectionViewTags.delegate = self
        self.collectionViewTags.register(UINib(nibName: reuseIdentifierTagsCVCell, bundle: nil), forCellWithReuseIdentifier: reuseIdentifierTagsCVCell)
    }
    
    func getTagsFromWorkoutInStudioVC(arrTags : NSArray){

       print("containerData: \(arrTags)")
        self.arrTags = arrTags
        collectionViewTags.reloadData()
    }
    
    func getTagsFromWorkoutAtHomeVC(arrTags : NSArray){

       print("containerData: \(arrTags)")
        self.arrTags = arrTags
        collectionViewTags.reloadData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - UICollectionView Delegate and Data Source methods

    let reuseIdentifierTagsCVCell = "TagsCVCell"

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrTags.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierTagsCVCell, for: indexPath) as! TagsCVCell

        let dictTags = arrTags.object(at: indexPath.row) as! NSDictionary
        
        cell.updateCell(dictTags: dictTags)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 140, height: 66)
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    // MARK: - IBAction

    @IBAction func btnLocation(_ sender: Any) {
    }
    
    @IBAction func btnWorkoutInStudio(_ sender: Any) {
        
        btnWorkoutInStudio.isSelected = true
        btnWorkoutAtHome.isSelected = false
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.3) {
            self.lblSelectionLeftConstraint.constant = self.btnWorkoutInStudio.frame.minX
            self.view.layoutIfNeeded()
        }
        containerViewStudio.isHidden = false
        containerViewHome.isHidden = true
        
        (children[1] as! WorkoutInStudioVC).callApiForGetHomeScreenInStudio()
    }
    
    @IBAction func btnWorkoutAtHome(_ sender: Any) {
        
        btnWorkoutInStudio.isSelected = false
        btnWorkoutAtHome.isSelected = true
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.3) {
            self.lblSelectionLeftConstraint.constant = self.btnWorkoutAtHome.frame.minX
            self.view.layoutIfNeeded()
        }
        containerViewStudio.isHidden = true
        containerViewHome.isHidden = false
        
        (children[0] as! WorkoutAtHomeVC).callApiForGetHomeWorkoutAtHome()
    }
}
