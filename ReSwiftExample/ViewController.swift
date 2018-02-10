//
//  ViewController.swift
//  ReSwiftExample
//
//  Created by KojimaTatsuya on 2018/02/10.
//  Copyright © 2018年 KojimaTatsuya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var items: [String] = ["ReSwiftExample"]

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    @IBAction func createItemButtonDidTap(_ sender: UIBarButtonItem) {
        let viewController = CreateViewController.instantiate()
        viewController.delegate = self
        
        present(UINavigationController(rootViewController: viewController), animated: true)
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

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = EditViewController.instantiate()
        viewController.delegate = self
        viewController.item = items[indexPath.row]
        
        present(UINavigationController(rootViewController: viewController), animated: true)
    }
    
}

extension ViewController: CreateViewControllerDelegate {
    
    func doneButtonDidTap(text: String) {
        items.append(text)
        tableView.reloadData()
    }
    
}

extension ViewController: EditViewControllerDelegate {
    
    func editButtonDidTap(text: String) {
        guard let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        
        items[indexPath.row] = text
        tableView.reloadData()
    }
    
    func trashButtonDidTap() {
        guard let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        
        items.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
}
