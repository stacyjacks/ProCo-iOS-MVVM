//
//  DashboardViewModel.swift
//  ProCo
//
//  Created by Anastasia on 13/6/24.
//

import Foundation

final class DashboardViewModel: ObservableObject {
    
    @ObservationIgnored
    private let repository: GoalRepository
    
    init(repository: GoalRepository = GoalRepository.shared) {
        self.repository = repository
    }
    
    @Published var current: Float = 0.0
    @Published var goal: Float = 0.0
    @Published var input: [Float] = [] // to do should be an object instead of a single float
}
