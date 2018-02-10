//
//  EditViewController.swift
//  ReSwiftExample
//
//  Created by KojimaTatsuya on 2018/02/10.
//  Copyright © 2018年 KojimaTatsuya. All rights reserved.
//

import UIKit

protocol EditViewControllerDelegate: class {
    
    func editButtonDidTap(text: String)
    func trashButtonDidTap()
    
}

class EditViewController: UIViewController {
    
    weak var delegate: EditViewControllerDelegate?
    var item: String?
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        textField.text = item
    }
    
    @IBAction func editButtonDidTap(_ sender: UIBarButtonItem) {
        if let text = textField.text, !text.isEmpty {
            delegate?.editButtonDidTap(text: text)
            dismiss(animated: true, completion: nil)
        } else {
            let alertController = UIAlertController(title: "テキストが入力されていません", message: nil, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(action)
            
            present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func trashButtonDidTap(_ sender: UIBarButtonItem) {
        delegate?.trashButtonDidTap()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonDidTap(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}
