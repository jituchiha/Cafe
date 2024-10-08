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
                    // Search Bar with Clear Button
                    HStack {
                        TextField("Search Recipes", text: $viewModel.searchQuery)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        if !viewModel.searchQuery.isEmpty {
                            Button(action: {
                                viewModel.searchQuery = ""
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
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
                                    AsyncImage(url: URL(string: meal.thumbnail)) { phase in
                                        if let image = phase.image {
                                            image.resizable()
                                                 .aspectRatio(contentMode: .fill)
                                                 .frame(width: 50, height: 50)
                                                 .cornerRadius(8)
                                        } else if phase.error != nil {
                                            Image(systemName: "photo.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 50, height: 50)
                                                .cornerRadius(8)
                                                .foregroundColor(.gray)
                                        } else {
                                            ProgressView()
                                                .frame(width: 50, height: 50)
                                        }
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
        }
        .onAppear {
            if viewModel.meals.isEmpty {
                Task {
                    await viewModel.fetchDesserts()
                }
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
