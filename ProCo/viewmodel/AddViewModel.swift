//
//  AddViewModel.swift
//  ProCo
//
//  Created by Anastasia on 14/6/24.
//

import Foundation

final class AddViewModel: ObservableObject {
    @Published var goal: Float = 0.0
    //@Published var savedItem
    @Published var input: Float = 0.0
}
