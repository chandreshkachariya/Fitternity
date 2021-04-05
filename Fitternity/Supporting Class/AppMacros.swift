//
//  AppMacros.swift
//  ProHunterSwift
//
//  Created by TechnoMac-11 on 21/03/18.
//  Copyright © 2018 TechnoMac-11. All rights reserved.
//

import Foundation
import UIKit
import IHProgressHUD

// Mark : - Define custome color
let objAppDelegate = UIApplication.shared.delegate as! AppDelegate


// MARK: -  Define AppDelegate Instance

let extraLightGrayColor = UIColor(red: 245.0/255.0, green: 245.0/255.0, blue: 245.0/255.0, alpha: 1.0)
let lightGrayColor = UIColor(red: 216.0/255.0, green: 216.0/255.0, blue: 216.0/255.0, alpha: 1.0)
let darkGrayColor = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
let textGrayColor = UIColor(red: 74.0/255.0, green: 74.0/255.0, blue: 74.0/255.0, alpha: 1.0)

let clearColor = UIColor.clear
let whiteColor = UIColor.white
let greenColor = UIColor(red: 220.0/255.0, green: 170.0/255.0, blue: 65.0/255.0, alpha: 1.0)
let offerBGColor = UIColor(red: 145.0/255.0, green: 225.0/255.0, blue: 215.0/255.0, alpha: 1.0)

let whiteColor_light = UIColor(red: 230.0/255.0, green: 249.0/255.0, blue: 253.0/255.0, alpha: 1.0)
let whiteColor_0_5 = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.5)
let whiteColor_0_1 = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.1)
let grayColor = UIColor(red: 58.0/255.0, green: 58.0/255.0, blue: 58.0/255.0, alpha: 1.0)
let blackColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
let blackColor_0_5 = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.5)
let lightColor = UIColor(red: 83.0/255.0, green: 205.0/255.0, blue: 242.0/255.0, alpha: 1.0)
let barColor = UIColor(red: 218.0/255.0, green: 236.0/255.0, blue: 237.0/255.0, alpha: 1.0)
let redColor = UIColor(red: 239.0/255.0, green: 61.0/255.0, blue: 84.0/255.0, alpha: 1.0)
let darkBlueColor = UIColor(red: 41.0/255.0, green: 107.0/255.0, blue: 170.0/255.0, alpha: 1.0)
let extraDarkBlueColor = UIColor(red: 73.0/255.0, green: 98.0/255.0, blue: 172.0/255.0, alpha: 1.0)
let blueColor = UIColor(red: 21.0/255.0, green: 148.0/255.0, blue: 233.0/255.0, alpha: 1.0)
let blueColor_0_5 = UIColor(red: 21.0/255.0, green: 148.0/255.0, blue: 233.0/255.0, alpha: 0.5)
let textBlueColor = UIColor(red: 0.0/255.0, green: 111.0/255.0, blue: 192.0/255.0, alpha: 1.0)
let bottomBarColor = UIColor(red: 210.0/255.0, green: 234.0/255.0, blue: 251.0/255.0, alpha: 1.0)
let cameraBGColor = UIColor(red: 154.0/255.0, green: 154.0/255.0, blue: 154.0/255.0, alpha: 1.0)
let rightCellColor = UIColor(red: 209.0/255.0, green: 240.0/255.0, blue: 251.0/255.0, alpha: 1.0)
let textLightColor = UIColor(red: 193.0/255.0, green: 193.0/255.0, blue: 193.0/255.0, alpha: 1.0)
let trackTintColor = UIColor(red: 201.0/255.0, green: 236.0/255.0, blue: 224.0/255.0, alpha: 1.0)
let bgColor = UIColor(red: 229.0/255.0, green: 251.0/255.0, blue: 253.0/255.0, alpha: 1.0)
let nonActiveColor = UIColor(red: 41.0/255.0, green: 143.0/255.0, blue: 207.0/255.0, alpha: 1.0)
let activeColor = UIColor(red: 0.0/255.0, green: 108.0/255.0, blue: 175.0/255.0, alpha: 1.0)
let cyanColor = UIColor(red: 214.0/255.0, green: 235.0/255.0, blue: 245.0/255.0, alpha: 1.0)

func setNavigationTitle(label: UILabel) {
    label.textColor = blackColor
    label.font = getFont(fontName: _font_Montserrat_Regular, fontSize: 17)
    label.text = label.text?.uppercased()
}

func setNavigationBarShadow(navigationBar: UIView) {
    delay(bySeconds: 0.3) {
        navigationBar.dropShadow(color: blackColor, opacity: 0.4, offSet: CGSize(width: -1, height: 1), radius: 2, scale: false)
    }
}

func setLabelNotFound(parentView: UIView, message: String) {
    let label = UILabel(frame: CGRect(x: 8, y: 8, width: parentView.frame.width - 16, height: parentView.frame.height - 16))
    
    label.textColor = blackColor
    label.font = getFont(fontName: _font_Montserrat_Regular, fontSize: 17)
    label.text = message
    label.numberOfLines = 0
    label.textAlignment = .center
    
    parentView.addSubview(label)
}

func removeAllSubView(parentView: UIView) {
    for view in parentView.subviews{
        view.removeFromSuperview()
    }
}


// MARK: -  HUD
func showProgress() {
    DispatchQueue.global(qos: .utility).async {
        IHProgressHUD.set(defaultMaskType: .black)
        IHProgressHUD.show()
    }
}

func closeProgress() {
    IHProgressHUD.dismiss()
}


// MARK: - Save Data UserDefaults
func setDictionary(dictionary: NSDictionary, _key: String) {
    let data = NSKeyedArchiver.archivedData(withRootObject: dictionary)
    let userDefaults = UserDefaults.standard
    userDefaults.set(data, forKey:_key)
    UserDefaults.standard.synchronize()
}

public func getDictionary(_key: String) -> NSDictionary {
    let data = UserDefaults.standard.object(forKey: _key) as? NSData
    if data != nil {
        let object = NSKeyedUnarchiver.unarchiveObject(with: data! as Data) as! NSDictionary
        return object;
    }else {
        return NSDictionary()
    }
}

func setArray(array: NSArray, _key: String) {
    let data = NSKeyedArchiver.archivedData(withRootObject: array)
    let userDefaults = UserDefaults.standard
    userDefaults.set(data, forKey:_key)
    UserDefaults.standard.synchronize()
}

public func getArray(_key: String) -> NSArray {
    let data = UserDefaults.standard.object(forKey: _key) as! NSData
    let object = NSKeyedUnarchiver.unarchiveObject(with: data as Data) as! NSArray
    return object;
}

// MARK : - User Details
public func getUserDetails() -> NSDictionary {
    
    return getDictionary(_key: _key_UserDetails)
}

public func setUserLoggedIn() {
    UserDefaults.standard.set(true, forKey: _key_AlreadyLogin)
    UserDefaults.standard.synchronize()
}

public func setUserLoggedOut() {
    UserDefaults.standard.set(false, forKey: _key_AlreadyLogin)
    UserDefaults.standard.synchronize()
}

public func getUserLoggedIn() -> Bool {
    return UserDefaults.standard.bool(forKey: _key_AlreadyLogin)
}

public func setBoolUD(value: Bool, forkey: String) {
    UserDefaults.standard.set(value, forKey: forkey)
    UserDefaults.standard.synchronize()
}

public func getBoolUD(forkey: String) -> Bool {
    return UserDefaults.standard.bool(forKey: forkey)
}

public func setValueUD(value: String, forkey: String) {
    UserDefaults.standard.set(value, forKey: forkey)
    UserDefaults.standard.synchronize()
}

public func getValueUD(forkey: String) -> String {
    return UserDefaults.standard.value(forKey: forkey) as? String ?? ""
}
