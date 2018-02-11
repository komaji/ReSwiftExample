//
//  ItemListReducer.swift
//  ReSwiftExample
//
//  Created by KojimaTatsuya on 2018/02/11.
//  Copyright © 2018年 KojimaTatsuya. All rights reserved.
//

import Foundation
import ReSwift

func itemListReducer(action: Action, state: ItemListState?) -> ItemListState {
    var state = state ?? ItemListState()
    
    switch action {
    case let createItem as ItemListActionCreateItem:
        state.items.append(createItem.item)
        
    case let editItem as ItemListActionEditItem:
        state.items[editItem.index] = editItem.item
        
    case let deleteItem as ItemListActionDeleteItem:
        state.items.remove(at: deleteItem.index)
        
    case let selectItem as ItemListActionSelectItem:
        state.selectedIndex = selectItem.index
        
    default:
        break
    }
    
    return state
}
