# ClarityTube

ClarityTube is a Safari extension designed to block distractions and promote mindful YouTube browsing. By addressing the challenges of endless video streaming and autoplay, it empowers users to stay focused and enhance productivity. Built with a modular architecture, it integrates shared and platform-specific components to ensure high performance and maintainability.

---

## Features

- **Distraction-Free Browsing:** Blocks recommended videos and restricts autoplay to reduce distractions.
- **Customizable Settings:** Allows users to personalize their browsing experience with adjustable filters and settings.
- **Shared Codebase:** Shared logic between iOS and macOS to reduce duplication.
- **Native App Support:** Dedicated folders for platform-specific code.
- **Extension Support:** Extensions for enhanced functionality, such as content blocking and web extensions.

---

## Project Structure

### Main Components

- **`Shared (App)`**: Contains shared application code for both iOS and macOS, including:
  - `ViewController.swift`: Shared logic for the main view controller.
  - `ContentView.swift`: Shared SwiftUI views.
  - `Resources` and `Assets.xcassets`: Shared resources and assets.
- **`iOS (App)`**: iOS-specific implementation with files such as:
  - `AppDelegate.swift` and `SceneDelegate.swift`: Handle app lifecycle events.
  - `Info.plist`: Configuration for the iOS app.
- **`macOS (App)`**: macOS-specific implementation including:
  - `AppDelegate.swift`: macOS-specific app lifecycle management.
  - `ClarityTube.entitlements`: macOS app entitlements file.
- **`ClarityTube.xcodeproj`**: The main Xcode project file, which includes:
  - `project.pbxproj`: Build configurations and project settings.

### Extensions

- **`iOS (Extension)`**: Contains an iOS content blocker extension with files such as:
  - `ContentBlockerRequestHandler.swift`: Handles content blocking logic.
  - `defaultBlockerList.json`: Configuration for the content blocker.
- **`macOS (Extension)`**: macOS-specific extension files.
- **`Shared (Extension)`**: Shared extension logic, including:
  - `SafariWebExtensionHandler.swift`: Handles Safari web extension functionality.

---

## Installation

### Prerequisites

- Xcode 13 or later.
- macOS 12.0 or later.

### Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/GoyalManas/ClarityTube.git
   ```
2. Open `ClarityTube.xcodeproj` in Xcode.
3. Select your target (iOS or macOS).
4. Build and run the project.

---

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch (`feature/your-feature-name`).
3. Commit your changes and push them to your fork.
4. Open a pull request to the main repository.

---

## License

This project is licensed under the [MIT License](LICENSE).

---

## Contact

For inquiries or feedback, please reach out to:

- **Manas Goyal**
- [GitHub Profile](https://github.com/GoyalManas)

