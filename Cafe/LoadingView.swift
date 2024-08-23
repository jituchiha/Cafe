import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 30) {
            // Cafe Logo or Brand
            Image(systemName: "cup.and.saucer.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.brown)
                .padding(.top, 100)
            
            // Brand Name
            Text("Cafe")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.brown)
            
            // Fancy Progress Indicator
            ProgressView("Fetching Recipes...")
                .progressViewStyle(CircularProgressViewStyle(tint: .brown))
                .padding(.top, 20)
            
            Spacer()  // Push content upwards to avoid it being too centered vertically
        }
        .background(
            Image(systemName: "leaf.fill")
                .resizable()
                .scaledToFit()
                .opacity(0.05)
                .frame(width: 300, height: 300)
                .rotationEffect(.degrees(45))
                .offset(x: 50, y: 200)
        )
    }
}
