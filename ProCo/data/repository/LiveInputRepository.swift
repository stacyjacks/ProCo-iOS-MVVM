//
//  LiveInputRepository.swift
//  ProCo
//
//  Created by Anastasia on 16/9/24.
//

import Foundation
import SwiftData

final class LiveInputRepository: InputRepository {
    let modelContainer = DataManager.shared.modelContainer
    private let modelContext: ModelContext
    
    @MainActor
    static let shared = LiveInputRepository()
    
    @MainActor
    init() {
        self.modelContext = modelContainer.mainContext
    }
    
    func getAllInput() -> [InputEntity] {
        do {
            return try modelContext.fetch(FetchDescriptor<Input>()).map { input in
                input.inputToEntity()
            }
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func addInput(input: InputEntity) {
        modelContext.insert(input.inputEntityToModel())
        
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func deleteInputById(id: Int) {
        do {
            try modelContext.delete(model: Input.self, where: #Predicate { $0.id == id })
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func resetAllInput() {
        do {
            try modelContext.delete(model: Input.self)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
