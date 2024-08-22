import SwiftUI
import Foundation

@MainActor
class MealListViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var searchQuery: String = ""
    @Published var allImagesLoaded = false  // New property
    
    var filteredMeals: [Meal] {
        if searchQuery.isEmpty {
            return meals
        } else {
            return meals.filter { $0.name.localizedCaseInsensitiveContains(searchQuery) }
        }
    }
    
    func fetchDesserts() async {
        isLoading = true
        allImagesLoaded = false
        errorMessage = nil
        
        do {
            meals = try await MealService.shared.fetchDesserts()
            await loadThumbnails()
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
    
    private func loadThumbnails() async {
        // Load all the images
        for meal in meals {
            guard let url = URL(string: meal.thumbnail) else { continue }
            _ = try? await URLSession.shared.data(from: url)
        }
        allImagesLoaded = true  // All images are now loaded
    }
}
