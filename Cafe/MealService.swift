import Foundation

enum APIError: Error {
    case invalidURL
    case networkError(Error)
    case decodingError(Error)
}

class MealService {
    static let shared = MealService()
    private init() {}
    
    private let baseURL = "https://themealdb.com/api/json/v1/1"
    
    func fetchDesserts() async throws -> [Meal] {
        guard let url = URL(string: "\(baseURL)/filter.php?c=Dessert") else {
            throw APIError.invalidURL
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(MealListResponse.self, from: data)
            return response.meals
        } catch {
            throw APIError.networkError(error)
        }
    }
    
    func fetchMealDetails(id: String) async throws -> MealDetail {
        guard let url = URL(string: "\(baseURL)/lookup.php?i=\(id)") else {
            throw APIError.invalidURL
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(MealDetailResponse.self, from: data)
            return response.meals.first ?? MealDetail() // Use the custom initializer
        } catch {
            throw APIError.networkError(error)
        }
    }

}
