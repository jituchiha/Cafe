import SwiftUI

struct MealDetailView: View {
    let mealId: String
    @StateObject private var viewModel = MealDetailViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let mealDetail = viewModel.mealDetail {
                    Text(mealDetail.name)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Instructions")
                        .font(.headline)
                    Text(mealDetail.instructions)
                    
                    Text("Ingredients")
                        .font(.headline)
                    ForEach(Array(zip(mealDetail.ingredients, mealDetail.measurements)), id: \.0) { ingredient, measurement in
                        Text("\(ingredient): \(measurement)")
                    }
                } else {
                    Text("No ingredients available")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding()
        }
        .navigationTitle("Meal Detail")
        .task {
            await viewModel.fetchMealDetail(id: mealId)
        }
        .overlay {
            if viewModel.isLoading {
                ProgressView()
            }
        }
        .alert("Error", isPresented: Binding<Bool>.constant(viewModel.errorMessage != nil), actions: {
            Button("OK") {}
        }, message: {
            Text(viewModel.errorMessage ?? "")
        })
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView(mealId: "53015") // Example ID
    }
}
