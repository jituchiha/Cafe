import SwiftUI

struct MealListView: View {
    @StateObject private var viewModel = MealListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading || !viewModel.allImagesLoaded {
                    LoadingView()
                        .scaleEffect(1.5, anchor: .center)
                        .padding()
                } else {
                    // Only show the search bar and list when loading is complete
                    TextField("Search Recipes", text: $viewModel.searchQuery)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    if viewModel.filteredMeals.isEmpty {
                        Text("No matching recipes found.")
                            .font(.headline)
                            .foregroundColor(.gray)
                            .padding()
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
            }
            .navigationTitle(viewModel.isLoading ? "" : "Dessert Recipes")  // Conditional title
            .task {
                await viewModel.fetchDesserts()
            }
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
