//
//  CreateViewController.swift
//  ReSwiftExample
//
//  Created by KojimaTatsuya on 2018/02/10.
//  Copyright © 2018年 KojimaTatsuya. All rights reserved.
//

import UIKit

protocol CreateViewControllerDelegate: class {
    
    func doneButtonDidTap(text: String)
    
}

class CreateViewController: UIViewController {
    
    weak var delegate: CreateViewControllerDelegate?
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func doneButtonDidTap(_ sender: UIBarButtonItem) {
        if let text = textField.text, !text.isEmpty {
            delegate?.doneButtonDidTap(text: text)
        }
        
        dismiss(animated: true)
    }
    
    @IBAction func cancelButtonDidTap(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}
