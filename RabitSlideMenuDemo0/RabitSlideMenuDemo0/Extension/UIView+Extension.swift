//
//  UIView+Extension.swift
//  RabitSlideMenuDemo0
//
//  Created by cuongdd on 19/10/2022.
//  Copyright © 2022 duycuong. All rights reserved.
//

import UIKit

//
// MARK: - Default Implementation for Identifier
extension UIView: Identifier {
    
    /// ID View
    static var identifierView: String {
        get {
            return String(describing: self)
        }
    }
    
    /// XIB
    static func xib() -> UINib? {
        return UINib(nibName: self.identifierView, bundle: nil)
    }
    
    class func instanceFromXib() -> UIView? {
        return xib()?.instantiate(withOwner: nil, options: nil).first as? UIView
    }
}

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.masksToBounds = newValue > 0
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            let color = UIColor.init(cgColor: layer.borderColor!)
            return color
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.masksToBounds = false
            layer.shadowColor = UIColor.darkGray.cgColor
            layer.shadowOffset = CGSize(width: 0, height: 3)
            layer.shadowOpacity = 0.2
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowRadiusOnlyBottom: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.masksToBounds = false
            layer.shadowRadius = newValue
            layer.shadowOpacity = 0.2
            layer.shadowColor = UIColor.gray.cgColor
            layer.shadowOffset = CGSize(width: 0 , height: 3)
            layer.shadowPath = UIBezierPath(rect: CGRect(x: 0,
                                                         y: bounds.maxY - layer.shadowRadius,
                                                         width: bounds.width,
                                                         height: layer.shadowRadius)).cgPath
        }
    }
    
}

extension UIView {
    
    static func loadViewFromNib<T: UIView>() -> T {
        let nameStr = "\(self)"
        let arrName = nameStr.split { $0 == "." }
        let nibName = arrName.map(String.init).last!
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! T
    }
}
