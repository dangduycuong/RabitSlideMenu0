//
//  UIViewController+Extension.swift
//  RabitSlideMenuDemo0
//
//  Created by cuongdd on 19/10/2022.
//  Copyright © 2022 duycuong. All rights reserved.
//

import UIKit

extension UIViewController {
    public func showNavCustom(isHidden: Bool = false) {
        navigationController?.navigationBar.barTintColor = UIColor.systemBlue
        navigationController?.navigationBar.tintColor = .white
        let attributes: [NSAttributedString.Key: Any] = [
            .font: R.font.playfairDisplayBold(size: 17) as Any,
            .foregroundColor: UIColor.white,
        ]
        navigationController?.navigationBar.titleTextAttributes = attributes
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.isHidden = isHidden
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.systemBlue
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        }
    }
    func removeBorderNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.layoutIfNeeded()
        
        if #available(iOS 15, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.shadowColor = .clear
            navBarAppearance.shadowImage = UIImage()
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
    }
}
