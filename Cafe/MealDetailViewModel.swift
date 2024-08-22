//
//  MealDetailViewModel.swift
//  Cafe
//
//  Created by Jitesh Bhandari on 8/22/24.
//

import Foundation
import SwiftUI

@MainActor
class MealDetailViewModel: ObservableObject {
    @Published var mealDetail: MealDetail?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func fetchMealDetail(id: String) async {
        isLoading = true
        errorMessage = nil
        
        do {
            mealDetail = try await MealService.shared.fetchMealDetails(id: id)
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
