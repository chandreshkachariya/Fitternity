//
//  OnepassTVCell.swift
//  Fitternity
//
//  Created by Chandresh Kachariya on 05/04/21.
//

import UIKit

class OnepassTVCell: UITableViewCell {

    /***************UILabel*********************/
    @IBOutlet weak var lblTitle1: UILabel!
    @IBOutlet weak var lblTitle2: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!

    /***************UIButton*********************/
    @IBOutlet weak var btnKnowMore: UIButton!
    
    /***************UIImageView*********************/
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var imgViewHeader: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imgView.layer.roundCorners(cornerRadius: 12)
        
        btnKnowMore.setTitleColor(greenColor, for: UIControl.State.normal)
        btnKnowMore.titleLabel?.font = getFont(fontName: _font_Montserrat_SemiBold, fontSize: 15)
        
//        lblTitle1.textColor = blackColor
//        lblTitle1.font = getFont(fontName: _font_Montserrat_Bold, fontSize: 17)
//
//        lblTitle2.textColor = blackColor
//        lblTitle2.font = getFont(fontName: _font_Montserrat_Bold, fontSize: 17)
        
        lblSubTitle.textColor = blackColor
        lblSubTitle.font = getFont(fontName: _font_Montserrat_Regular, fontSize: 15)
        
        lblDesc.textColor = blackColor
        lblDesc.font = getFont(fontName: _font_Montserrat_Regular, fontSize: 14)
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(dictOnepassPre: NSDictionary) {
        var headerImage = dictOnepassPre.value(forKey: header_img) as? String ?? ""
        if headerImage.contains("http://") {
            headerImage = "https://" + headerImage.trimmed.dropFirst(7)
        }
        self.imgViewHeader.getImage(url: headerImage, placeholderImage: UIImage.init(named: placeholderImage)) { (done) in
            
            self.imgViewHeader.contentMode = .scaleAspectFill
        } failer: { (failed) in
            self.imgViewHeader.image = UIImage.init(named: placeholderImage)
            self.imgViewHeader.contentMode = .center
        }
        
        btnKnowMore.setTitle((dictOnepassPre.value(forKey: button_text) as? String ?? ""), for: .normal)
        
        let dictPasses = dictOnepassPre.value(forKey: passes) as! NSDictionary
        
        lblSubTitle.text = dictPasses.value(forKey: subtitle) as? String ?? ""
        
        self.imgView.getImage(url: (dictPasses.value(forKey: "image") as? String ?? ""), placeholderImage: UIImage.init(named: placeholderImage)) { (done) in
            
            self.imgView.contentMode = .scaleAspectFill
        } failer: { (failed) in
            self.imgView.image = UIImage.init(named: placeholderImage)
            self.imgView.contentMode = .center
        }
        
        lblDesc.text = dictPasses.value(forKey: description_key) as? String ?? ""

    }
    
}
