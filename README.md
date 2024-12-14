# ClarityTube

ClarityTube is a cross-platform application designed to provide a seamless video experience for iOS and macOS users. Built with a modular architecture, it integrates shared and platform-specific components to ensure high performance and maintainability.

---

## Features
- **Shared Codebase:** Shared logic between iOS and macOS to reduce duplication.
- **Native App Support:** Dedicated folders for platform-specific code.
- **Extension Support:** Extensions for enhanced functionality.

---

## Project Structure
- **`Shared (App)`**: Contains shared application code for both iOS and macOS.
- **`iOS (App)`**: iOS-specific implementation.
- **`macOS (App)`**: macOS-specific implementation.
- **`ClarityTube.xcodeproj`**: The main Xcode project file.
- **`iOS (Extension)`**: iOS-specific extensions.
- **`macOS (Extension)`**: macOS-specific extensions.
- **`Shared (Extension)`**: Shared logic for extensions.

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

