//
//  ViewController.swift
//  RabitSlideMenuDemo0
//
//  Created by duycuong on 2/18/19.
//  Copyright © 2019 duycuong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leadingView: NSLayoutConstraint!
    
    var isOn: Bool = false {
        didSet {
            UIView.animate(withDuration: 0) {
                self.leadingView.constant = self.isOn ? 0 : 80
                self.view.layoutIfNeeded()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        isOn = true
    }

//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        isOn = !isOn
//    }
    
    @IBAction func rabitAction(_ sender: Any) {
        isOn = !isOn
    }
    
}

