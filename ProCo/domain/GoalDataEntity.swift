//
//  GoalEntity.swift
//  ProCo
//
//  Created by Anastasia on 14/6/24.
//

import Foundation

class GoalDataEntity {
    var goal: Float
    var current: Float
    
    init(goal: Float = 0.0, current: Float = 0.0) {
        self.goal = goal
        self.current = current
    }
}
