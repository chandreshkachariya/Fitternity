//
//  CategoriesCVCell.swift
//  Fitternity
//
//  Created by Chandresh Kachariya on 05/04/21.
//

import UIKit

class CategoriesCVCell: UICollectionViewCell {

    /***************UIImageView*******************/
    @IBOutlet weak var imgView: UIImageView!
    
    /***************UILabel*******************/
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        lblTitle.textColor = blackColor
        lblTitle.font = getFont(fontName: _font_Montserrat_Regular, fontSize: 15)
        
        imgView.layer.roundCorners(cornerRadius: 12)
    }
    
    func updateCell(dictCategoryTags: NSDictionary) {
        self.imgView.getImage(url: (dictCategoryTags.value(forKey: image) as? String ?? ""), placeholderImage: UIImage.init(named: placeholderImage)) { (done) in
            
            self.imgView.contentMode = .scaleAspectFill
        } failer: { (failed) in
            self.imgView.image = UIImage.init(named: placeholderImage)
            self.imgView.contentMode = .center
        }

        self.lblTitle.text = dictCategoryTags.value(forKey: name) as? String ?? ""
    }

}
