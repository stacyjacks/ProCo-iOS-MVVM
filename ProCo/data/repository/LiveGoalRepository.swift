//
//  GoalRepository.swift
//  ProCo
//
//  Created by Anastasia on 13/6/24.
//

import Foundation
import SwiftData

final class LiveGoalRepository: GoalRepository {
    let modelContainer = DataManager.shared.modelContainer
    private let modelContext: ModelContext
    
    @MainActor
    static let shared = LiveGoalRepository()
    
    @MainActor
    init() {
        self.modelContext = modelContainer.mainContext
    }
    
    func getGoalData() -> GoalDataEntity {
        do {
            return try modelContext.fetch(FetchDescriptor<GoalData>()).last?.goalDataToEntity() ?? GoalDataEntity(goal: 0.0, current: 0.0)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func addGoalData(goalData: GoalDataEntity) {
        do {
            try modelContext.delete(model: GoalData.self)
        } catch {
            fatalError(error.localizedDescription)
        }
        
        modelContext.insert(goalData.goalDataEntityToModel())
        
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func updateCurrent() {
        // to do
    }
    
    func resetCurrent() {
        // to do
    }
}
