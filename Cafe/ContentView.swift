import SwiftUI

struct MealListView: View {
    @StateObject private var viewModel = MealListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Keep the search bar at the top
                VStack {
                    TextField("Search Recipes", text: $viewModel.searchQuery)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    if viewModel.isLoading || !viewModel.allImagesLoaded {
                        LoadingView()
                            .scaleEffect(1.5, anchor: .center)
                            .padding()
                    } else if let errorMessage = viewModel.errorMessage {
                        Text("Error: \(errorMessage)")
                            .foregroundColor(.red)
                    } else if viewModel.filteredMeals.isEmpty {
                        Spacer() // Pushes the "No matching recipes found" text to the center
                        Text("No matching recipes found.")
                            .font(.headline)
                            .foregroundColor(.gray)
                            .padding()
                        Spacer() // Pushes the "No matching recipes found" text to the center
                    } else {
                        List(viewModel.filteredMeals) { meal in
                            NavigationLink(destination: MealDetailView(mealId: meal.id)) {
                                HStack {
                                    AsyncImage(url: URL(string: meal.thumbnail)) { image in
                                        image.resizable()
                                             .aspectRatio(contentMode: .fill)
                                             .frame(width: 50, height: 50)
                                             .cornerRadius(8)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    Text(meal.name)
                                }
                            }
                        }
                        .listStyle(PlainListStyle())
                    }
                }
                .navigationTitle("Dessert Recipes")
            }
            .task {
                await viewModel.fetchDesserts()
            }
        }
    }
}

struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView("Fetching Recipes...")
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .padding()
            
            Text("Loading delicious desserts...")
                .font(.headline)
                .padding(.top, 10)
        }
    }
}

struct ContentView: View {
    var body: some View {
        MealListView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
