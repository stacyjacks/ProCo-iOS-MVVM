//
//  Mappers.swift
//  ProCo
//
//  Created by Anastasia on 14/6/24.
//

import Foundation

extension GoalData {
    func goalDataToEntity() -> GoalDataEntity {
        return GoalDataEntity(
            goal: goal,
            current: current
        )
    }
}

extension GoalDataEntity {
    func goalDataEntityToModel() -> GoalData {
        return GoalData(
            goal: goal,
            current: current
        )
    }
}
