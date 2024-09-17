//
//  InputRepository.swift
//  ProCo
//
//  Created by Anastasia on 16/9/24.
//

import Foundation

protocol InputRepository {
    func getAllInput() -> [InputEntity]
    func addInput(input: InputEntity)
    func deleteInputById(id: Int)
    func resetAllInput()
}
