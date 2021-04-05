//
//  CategoriesTVCell.swift
//  Fitternity
//
//  Created by Chandresh Kachariya on 05/04/21.
//

import UIKit

class CategoriesTVCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var dictCategories = NSDictionary()
    
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
        self.collectionView.register(UINib(nibName: reuseIdentifierCategoriesCVCell, bundle: nil), forCellWithReuseIdentifier: reuseIdentifierCategoriesCVCell)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(dictCategories: NSDictionary) {
        self.dictCategories = dictCategories
        self.collectionView.reloadData()
        
        self.lbltitle.text = dictCategories.value(forKey: title_key) as? String ?? ""
        self.lblDesc.text = dictCategories.value(forKey: text_key) as? String ?? ""
    }
    
    // MARK: - UICollectionView Delegate and Data Source methods

    let reuseIdentifierCategoriesCVCell = "CategoriesCVCell"

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (dictCategories.value(forKey: categorytags) as! NSArray).count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierCategoriesCVCell, for: indexPath) as! CategoriesCVCell

        let dictCategoryTags = dictCategories.value(forKey: categorytags) as! NSArray
                        
        cell.updateCell(dictCategoryTags: dictCategoryTags.object(at: indexPath.row) as! NSDictionary)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 144, height: 180)
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
