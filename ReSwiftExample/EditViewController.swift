//
//  EditViewController.swift
//  ReSwiftExample
//
//  Created by KojimaTatsuya on 2018/02/10.
//  Copyright © 2018年 KojimaTatsuya. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        guard let index = appStore.state.itemList.selectedIndex else {
            dismiss(animated: true)
            return
        }
        
        textField.text = appStore.state.itemList.items[index]
    }
    
    @IBAction func editButtonDidTap(_ sender: UIBarButtonItem) {
        guard let index = appStore.state.itemList.selectedIndex else {
            dismiss(animated: true)
            return
        }

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
        guard let index = appStore.state.itemList.selectedIndex else {
            dismiss(animated: true)
            return
        }

        appStore.dispatch(ItemListActionDeleteItem(index: index))
        dismiss(animated: true)
    }
    
    @IBAction func cancelButtonDidTap(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}
