
# Cafe Recipe App

## Overview
Cafe Recipe App is an iOS application that allows users to browse, search, and view detailed recipes from an online database. The app leverages SwiftUI for the UI and follows modern Swift Concurrency patterns using async/await for asynchronous data fetching. This app was built with a focus on providing a seamless user experience with intuitive navigation and efficient loading of recipe images.


## Features

- **Browse Recipes:** The app fetches and displays a list of dessert recipes, sorted alphabetically.
- **Search Functionality:** Users can search for specific recipes using the search bar. The search updates in real-time as the user types.
- **Detailed Recipe View:** Users can tap on a recipe to view detailed instructions, ingredients, and additional information such as the source, image source, and more.
- **Loading Indicators:** The app provides visual feedback while fetching data and loading images, ensuring a smooth user experience.
- **Persistent Scroll Position:** When navigating back from a recipe detail view, the app retains the user's scroll position in the recipe list.
- **Clear Search Query:** Users can easily clear the search bar with a built-in clear button.
- **Custom App Icon and Branding:** The app includes a custom icon and loading screen that reflects the "Cafe" brand.


**Developed by:** Jitesh Bhandari 
**Using:** XCode Version 15.4 (15F31d)  

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/cafe-recipe-app.git
   cd cafe-recipe-app

2. Open the project in Xcode:
   open Cafe.xcodeproj

3. Build and run the app on your simulator or device
   - Select your target device ( Simulator or Physical Device)
   - Press ' Cmd + R' to build and run the project


**Tested on:** iPhone 14 (Physical device), iPhone 15 Pro (Simulator)



## Future Scope
- **Additional Categories:** Expand the app to support more categories beyond just desserts.
- **Offline Mode:** Add functionality to allow viewing of previously fetched recipes even when offline.
- **Caching:** Implementing caching for images and API responses to improve performance on slower networks.
- **UI Features:** Would implement smooth transitions and better UI
- **User Authentication:** Plan to implement Google and Apple sign-in.
- **Social Features:** Enable users to share their favorite cafes on social media.
- **Advanced Filtering:** Introduce more filtering options for search (e.g., price range, ambiance).
- **Event Integration:** Show upcoming events at cafes.
- **Push Notifications:** Notify users of new reviews, updates, and offers.


## Contributing 
Contributions are welcome! If you have any improvements or bug fixes, feel free to submit a pull request.

1.Fork the repository

2.Create a new branch (git checkout -b feature/your-feature-name)

3.Commit your changes (git commit -m 'Add some feature')

4.Push to the branch (git push origin feature/your-feature-name)

5.Create a pull request


