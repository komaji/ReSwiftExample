//
//  CreateViewController.swift
//  ReSwiftExample
//
//  Created by KojimaTatsuya on 2018/02/10.
//  Copyright © 2018年 KojimaTatsuya. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func doneButtonDidTap(_ sender: UIBarButtonItem) {
        if let text = textField.text, !text.isEmpty {
            appStore.dispatch(ItemListActionCreateItem(item: text))
        }
        
        dismiss(animated: true)
    }
    
    @IBAction func cancelButtonDidTap(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}
