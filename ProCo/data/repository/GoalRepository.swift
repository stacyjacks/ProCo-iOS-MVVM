//
//  GoalRepository.swift
//  ProCo
//
//  Created by Anastasia on 13/6/24.
//

import Foundation
import SwiftData

final class GoalRepository {
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    
    @MainActor
    static let shared = GoalRepository()
    
    @MainActor
    private init() {
        self.modelContainer = try! ModelContainer(for: GoalData.self)
        self.modelContext = modelContainer.mainContext
    }
    
    func getGoalData() -> GoalDataEntity {
        do {
            return try modelContext.fetch(FetchDescriptor<GoalData>()).first!.goalDataToEntity()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func addGoalData(goalData: GoalDataEntity) {
        modelContext.insert(goalData.goalDataEntityToModel())
        
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func updateCurrent() {
        
    }
    
    func resetCurrent() {
        
    }
}
