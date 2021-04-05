//
//  OffersTVCell.swift
//  Fitternity
//
//  Created by Chandresh Kachariya on 05/04/21.
//

import UIKit

class OffersTVCell: UITableViewCell {

    /***************UIView******************/
    @IBOutlet weak var mainView: UIView!
    
    /***************UIImageView******************/
    @IBOutlet weak var imgView: UIImageView!
    
    /***************UILabel******************/
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        mainView.backgroundColor = offerBGColor
        mainView.layer.roundCorners(cornerRadius: 8)
        
        lblTitle.textColor = blackColor
        lblTitle.font = getFont(fontName: _font_Montserrat_SemiBold, fontSize: 12)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
