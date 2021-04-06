//
//  UpcomingClassesTVCell.swift
//  Fitternity
//
//  Created by Chandresh Kachariya on 05/04/21.
//

import UIKit

class UpcomingClassesTVCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var dictUpcomingClasses = NSDictionary()

    /***************UILabel********************/
    @IBOutlet weak var lbltitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!

    /***************UIButton********************/
    @IBOutlet weak var btnViewAll: UIButton!

    /***************UICollectionView********************/
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        lbltitle.textColor = blackColor
        lbltitle.font = getFont(fontName: _font_Montserrat_Bold, fontSize: 17)
        
        lblDesc.textColor = blackColor
        lblDesc.font = getFont(fontName: _font_Montserrat_Regular, fontSize: 15)
        
        btnViewAll.setTitleColor(greenColor, for: UIControl.State.normal)
        btnViewAll.titleLabel?.font = getFont(fontName: _font_Montserrat_SemiBold, fontSize: 15)
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib(nibName: reuseIdentifierUpcomingClassesCVCell, bundle: nil), forCellWithReuseIdentifier: reuseIdentifierUpcomingClassesCVCell)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(dictUpcomingClasses: NSDictionary) {
        self.dictUpcomingClasses = dictUpcomingClasses
        self.collectionView.reloadData()
        
        self.lbltitle.text = dictUpcomingClasses.value(forKey: title_key) as? String ?? ""
        self.lblDesc.text = dictUpcomingClasses.value(forKey: description_key) as? String ?? ""
    }
    
    // MARK: - UICollectionView Delegate and Data Source methods

    let reuseIdentifierUpcomingClassesCVCell = "UpcomingClassesCVCell"

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (dictUpcomingClasses.value(forKey: data) as? NSArray ?? NSArray()).count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierUpcomingClassesCVCell, for: indexPath) as! UpcomingClassesCVCell

        let dictData = dictUpcomingClasses.value(forKey: data) as! NSArray
                        
        cell.updateCell(dictData: dictData.object(at: indexPath.row) as! NSDictionary)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
