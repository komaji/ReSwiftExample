//
//  ItemListActions.swift
//  ReSwiftExample
//
//  Created by KojimaTatsuya on 2018/02/11.
//  Copyright © 2018年 KojimaTatsuya. All rights reserved.
//

import Foundation
import ReSwift

struct ItemListActionCreateItem {
    
    let item: String

}

struct ItemListActionEditItem {
    
    let index: Int
    let item: String
    
}

struct ItemListActionDeleteItem {
    
    let index: Int
    
}
