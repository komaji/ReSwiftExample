//
//  ViewController.swift
//  ReSwiftExample
//
//  Created by KojimaTatsuya on 2018/02/10.
//  Copyright © 2018年 KojimaTatsuya. All rights reserved.
//

import UIKit
import ReSwift

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
        present(UINavigationController(rootViewController: viewController), animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        appStore.subscribe(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        appStore.unsubscribe(self)
    }
    
}

extension ViewController: StoreSubscriber {
    
    func newState(state: AppState) {
        items = state.itemList.items
        tableView.reloadData()
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
        present(UINavigationController(rootViewController: viewController), animated: true)
        
        appStore.dispatch(ItemListActionSelectItem(index: indexPath.row))
    }
    
}
