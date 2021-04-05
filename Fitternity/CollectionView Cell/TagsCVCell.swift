//
//  TagsCVCell.swift
//  Fitternity
//
//  Created by Chandresh Kachariya on 05/04/21.
//

import UIKit

class TagsCVCell: UICollectionViewCell {

    /***************UIView********************/
    @IBOutlet weak var mainView: UIView!
    
    /***************UIImageView********************/
    @IBOutlet weak var imgView: UIImageView!
    
    /***************UILabel********************/
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        mainView.layer.roundBorder(cornerRadius: Double(mainView.frame.height/2), color: greenColor, borderWith: 1.0)
        
        imgView.layer.roundBorder(cornerRadius: Double(imgView.frame.height/2), color: greenColor, borderWith: 1.0)
        
        lblTitle.textColor = greenColor
        lblTitle.font = getFont(fontName: _font_Montserrat_SemiBold, fontSize: 14)
        
        lblDesc.textColor = blackColor
        lblDesc.font = getFont(fontName: _font_Montserrat_Regular, fontSize: 12)
        
    }

    func updateCell(dictTags: NSDictionary) {
        self.imgView.getImage(url: (dictTags.value(forKey: image) as? String ?? ""), placeholderImage: UIImage.init(named: placeholderImage)) { (done) in
            
            self.imgView.contentMode = .scaleAspectFill
        } failer: { (failed) in
            self.imgView.image = UIImage.init(named: placeholderImage)
            self.imgView.contentMode = .center
        }

        self.lblTitle.text = dictTags.value(forKey: title_key) as? String ?? ""
        self.lblDesc.text = dictTags.value(forKey: text) as? String ?? ""
    }
}
