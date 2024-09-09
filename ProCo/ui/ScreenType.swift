//
//  ScreenType.swift
//  ProCo
//
//  Created by Anastasia on 14/6/24.
//

import Foundation

enum ScreenType {
    case AddGoal, AddSaved, AddInput
    
    var title: String {
        switch self {
        case .AddGoal:
            return "Set goal"
        case .AddSaved:
            return "New preset"
        case .AddInput:
            return "New input"
        }
    }
}
