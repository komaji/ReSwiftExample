//
//  AppReducer.swift
//  ReSwiftExample
//
//  Created by KojimaTatsuya on 2018/02/11.
//  Copyright © 2018年 KojimaTatsuya. All rights reserved.
//

import Foundation
import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
    
    return AppState(
        itemList: itemListReducer(action: action, state: state?.itemList)
    )
    
}
