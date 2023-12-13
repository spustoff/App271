//
//  BudgetViewModel.swift
//  App271
//
//  Created by IGOR on 11/12/2023.
//

import SwiftUI

final class BudgetViewModel: ObservableObject {

    @Published var isAddBudget: Bool = false
    @Published var currency_fc: [String] = ["EURUSD", "USDCHY", "EURCHY", "EURRUB", "USDRUB"]
    @Published var current_currency = "EURUSD"
}
