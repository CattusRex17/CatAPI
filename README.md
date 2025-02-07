# CatAPI iOS App

## Overview
This is a simple iOS app built using SwiftUI that fetches and displays cat images and detail information from The Cat API. It consists of a list page with pagination and a detail page with additional information about each cat.

## Features
- Fetches cat images and detail information from an external API.
- Implements pagination for loading more data.
- Displays detailed information about each cat on a separate screen.
- Uses MVVM architecture.
- Provides unit tests and UI tests.
- Implements proper error handling and loading states.

## Requirements
- iOS 15.0+
- Xcode 14+
- Swift 6

## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/your-repository.git
   ```
2. Open the project in Xcode:
   ```sh
   cd CatAPIApp
   open CatAPIApp.xcodeproj
   ```
3. Run the project on a simulator or physical device.

## API Usage
This app uses [The Cat API](https://thecatapi.com/) to fetch cat data.

## Project Structure
- `Models/` - Contains the `Cat` and `Breed` models.
- `ViewModels/` - Contains `CatViewModel` for handling data logic.
- `Views/` - Contains `CatListView`, `CatRowView`, and `CatDetailView`.
- `Tests/` - Contains unit tests for the ViewModel and UI tests.

## Running Tests
To run unit and UI tests, open Xcode and press `Cmd + U` or run:
```sh
xcodebuild test -scheme CatAPIApp -destination 'platform=iOS Simulator,name=iPhone 14,OS=latest'
```

## Known Issues
- The API may sometimes return incomplete detail information.

## License
This project is licensed under the MIT License.
