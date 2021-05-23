//
//  DataReducer.swift
//  WechselStube
//
//  Created by Hiki on 2021/05/23.
//

import Foundation

func dataReducer(state: inout DataState, action: DataAction) {
    switch action {
    case .isLoading(let flag):
        state.isLoading = flag
        
    case .load,
         .loadCached,
         .fetch:
        break
    }
}
