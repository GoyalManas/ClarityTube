import SafariServices

class ContentBlockerRequestHandler: NSObject, NSExtensionRequestHandling {
    func beginRequest(with context: NSExtensionContext) {
        // Locate the JSON file in the extension bundle
        guard let blockerListURL = Bundle.main.url(forResource: "defaultBlockerList", withExtension: "json") else {
            fatalError("defaultBlockerList.json not found in the extension bundle.")
        }

        // Attach the JSON file to the extension context
        guard let attachment = NSItemProvider(contentsOf: blockerListURL) else {
            fatalError("Failed to create NSItemProvider for defaultBlockerList.json.")
        }

        let item = NSExtensionItem()
        item.attachments = [attachment]

        // Complete the request and return the JSON file to Safari
        context.completeRequest(returningItems: [item]) { success in
            if success {
                print("Content blocker rules successfully loaded.")
            } else {
                print("Failed to load content blocker rules.")
            }
        }
    }
}

