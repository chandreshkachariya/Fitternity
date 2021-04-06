//
//  UpcomingClassesCVCell.swift
//  Fitternity
//
//  Created by Chandresh Kachariya on 06/04/21.
//

import UIKit

class UpcomingClassesCVCell: UICollectionViewCell {

    /***************UIImageView*****************/
    @IBOutlet weak var imgCover: UIImageView!
    @IBOutlet weak var imgKCAL: UIImageView!
    @IBOutlet weak var imgMins: UIImageView!
    @IBOutlet weak var imgRS: UIImageView!

    /***************UIView*****************/
    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var viewInfo: UIView!
    
    /***************UILabel*****************/
    @IBOutlet weak var lblKCAL: UILabel!
    @IBOutlet weak var lblMins: UILabel!
    @IBOutlet weak var lblRS: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        viewMain.layer.roundBorder(cornerRadius: 12, color: grayColor, borderWith: 0.5)
        
        viewInfo.backgroundColor = offerBGColor
        viewInfo.layer.roundCorners(cornerRadius: 15)

        lblKCAL.textColor = blackColor
        lblKCAL.font = getFont(fontName: _font_Montserrat_Regular, fontSize: 12)
        
        lblMins.textColor = blackColor
        lblMins.font = getFont(fontName: _font_Montserrat_Regular, fontSize: 12)
        
        lblRS.textColor = blackColor
        lblRS.font = getFont(fontName: _font_Montserrat_Regular, fontSize: 12)
        
        lblTitle.textColor = blackColor
        lblTitle.font = getFont(fontName: _font_Montserrat_Bold, fontSize: 15)
        
        lblDesc.textColor = grayColor
        lblDesc.font = getFont(fontName: _font_Montserrat_Regular, fontSize: 12)
        
    }

    func updateCell(dictData: NSDictionary) {
        
        self.imgCover.getImage(url: (dictData.value(forKey: coverimage) as? String ?? ""), placeholderImage: UIImage.init(named: placeholderImage)) { (done) in
            
            self.imgCover.contentMode = .scaleAspectFill
        } failer: { (failed) in
            self.imgCover.image = UIImage.init(named: placeholderImage)
            self.imgCover.contentMode = .center
        }

        self.lblTitle.text = dictData.value(forKey: name) as? String ?? ""
        self.lblDesc.text = dictData.value(forKey: vendor_name) as? String ?? ""
        
        let overlayDetails = dictData.value(forKey: overlay_details) as! NSArray
        self.lblKCAL.text = (overlayDetails.object(at: 0) as! NSDictionary).value(forKey: text) as? String ?? ""
        self.lblMins.text = (overlayDetails.object(at: 1) as! NSDictionary).value(forKey: text) as? String ?? ""
        self.lblRS.text = (overlayDetails.object(at: 2) as! NSDictionary).value(forKey: text) as? String ?? ""

        self.imgKCAL.getImage(url: ((overlayDetails.object(at: 0) as! NSDictionary).value(forKey: icon) as? String ?? ""), placeholderImage: UIImage.init(named: placeholderImage)) { (done) in
            
            self.imgKCAL.contentMode = .scaleAspectFill
        } failer: { (failed) in
            self.imgKCAL.image = UIImage.init(named: placeholderImage)
            self.imgKCAL.contentMode = .center
        }
        
        self.imgMins.getImage(url: ((overlayDetails.object(at: 1) as! NSDictionary).value(forKey: icon) as? String ?? ""), placeholderImage: UIImage.init(named: placeholderImage)) { (done) in
            
            self.imgMins.contentMode = .scaleAspectFill
        } failer: { (failed) in
            self.imgMins.image = UIImage.init(named: placeholderImage)
            self.imgMins.contentMode = .center
        }
        
        self.imgRS.getImage(url: ((overlayDetails.object(at: 2) as! NSDictionary).value(forKey: icon) as? String ?? ""), placeholderImage: UIImage.init(named: placeholderImage)) { (done) in
            
            self.imgRS.contentMode = .scaleAspectFill
        } failer: { (failed) in
            self.imgRS.image = UIImage.init(named: placeholderImage)
            self.imgRS.contentMode = .center
        }
    }
}
