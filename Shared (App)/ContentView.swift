import SwiftUI
import SafariServices

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("ClarityTube")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("How to Enable ClarityTube:")
                .font(.headline)

            VStack(alignment: .leading, spacing: 10) {
                Text("1. Open Safari settings.")
                Text("2. Navigate to Extensions.")
                Text("3. Enable 'ClarityTube'.")
                Text("4. Visit YouTube to enjoy a distraction-free experience!")
            }
            .padding()

#if os(macOS)
            if #available(macOS 10.15, *) {
                Button(action: openSafariPreferences) {
                    Text("Open Safari Preferences")
                        .font(.body)
                        .padding()
                }
            } else {
                Text("Please update to macOS 10.15 or later to use this feature.")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
#endif

            Spacer()
        }
        .padding()
    }

#if os(macOS)
    func openSafariPreferences() {
        guard #available(macOS 10.15, *) else {
            print("This feature requires macOS 10.15 or later.")
            return
        }

        let extensionIdentifier = "com.ManasGoyal.ClarityTube.ClarityTube.Extension"
        SFSafariApplication.showPreferencesForExtension(withIdentifier: extensionIdentifier) { error in
            if let error = error {
                print("Error opening Safari preferences: \(error.localizedDescription)")
            }
        }
    }
#endif
}

