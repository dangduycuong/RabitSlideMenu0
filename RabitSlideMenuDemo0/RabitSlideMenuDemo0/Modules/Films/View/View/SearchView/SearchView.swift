//
//  SearchView.swift
//  RabitSlideMenuDemo0
//
//  Created by cuongdd on 19/10/2022.
//  Copyright © 2022 duycuong. All rights reserved.
//

import UIKit

class SearchView: UIView {
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    var textDidChange: ((_ text: String) ->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        searchTextField.delegate = self
        setupUI()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    func setupUI() {
        searchView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 44 - 16).isActive = true
    }

}

extension SearchView: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let text = textField.text, text != "" {
            textDidChange?(text)
        }
    }
}
