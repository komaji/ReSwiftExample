//
//  EditViewController.swift
//  ReSwiftExample
//
//  Created by KojimaTatsuya on 2018/02/10.
//  Copyright © 2018年 KojimaTatsuya. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    var item: String?
    var index: Int!
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        textField.text = item
    }
    
    @IBAction func editButtonDidTap(_ sender: UIBarButtonItem) {
        if let text = textField.text, !text.isEmpty {
            appStore.dispatch(ItemListActionEditItem(index: index, item: text))
            dismiss(animated: true)
        } else {
            let alertController = UIAlertController(title: "テキストが入力されていません", message: nil, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(action)
            
            present(alertController, animated: true)
        }
    }
    
    @IBAction func trashButtonDidTap(_ sender: UIBarButtonItem) {
        appStore.dispatch(ItemListActionDeleteItem(index: index))
        dismiss(animated: true)
    }
    
    @IBAction func cancelButtonDidTap(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}
