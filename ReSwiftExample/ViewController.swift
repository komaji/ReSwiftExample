//
//  ViewController.swift
//  ReSwiftExample
//
//  Created by KojimaTatsuya on 2018/02/10.
//  Copyright © 2018年 KojimaTatsuya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var items: [String] = []

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
        }
    }
    
    @IBAction func createItemButtonDidTap(_ sender: UIBarButtonItem) {
        let viewController = CreateViewController.instantiate()
        viewController.delegate = self
        
        present(UINavigationController(rootViewController: viewController), animated: true, completion: nil)
    }
    
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    
}

extension ViewController: CreateViewControllerDelegate {
    
    func doneButtonDidTap(text: String) {
        items.append(text)
        tableView.reloadData()
    }
    
}
