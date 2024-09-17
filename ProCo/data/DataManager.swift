//
//  DataManager.swift
//  ProCo
//
//  Created by Anastasia on 16/9/24.
//

import Foundation
import SwiftData

class DataManager {
    static let shared = DataManager()
    
    let modelContainer: ModelContainer
    
    private init() {
        modelContainer = try! ModelContainer(for: GoalData.self, Input.self)
    }
}
