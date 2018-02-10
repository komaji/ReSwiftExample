//
//  ViewController.swift
//  ReSwiftExample
//
//  Created by KojimaTatsuya on 2018/02/10.
//  Copyright © 2018年 KojimaTatsuya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
        }
    }
    
    @IBAction func createItemButtonDidTap(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: String(describing: CreateViewController.self), bundle: nil)
        let viewController = storyboard.instantiateInitialViewController()!
        present(UINavigationController(rootViewController: viewController), animated: true, completion: nil)
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = "cell \(indexPath.row)"
        
        return cell
    }
    
}
