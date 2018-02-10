//
//  UIViewController+ReSwiftExample.swift
//  ReSwiftExample
//
//  Created by KojimaTatsuya on 2018/02/10.
//  Copyright © 2018年 KojimaTatsuya. All rights reserved.
//

import UIKit

protocol StoryboardInstantiatable {}

extension StoryboardInstantiatable where Self: UIViewController {
    
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! Self
        
        return viewController
    }
    
}

extension UIViewController: StoryboardInstantiatable {}
