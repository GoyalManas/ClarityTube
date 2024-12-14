import WebKit

#if os(iOS)
import UIKit
typealias PlatformViewController = UIViewController
#elseif os(macOS)
import Cocoa
import SafariServices
typealias PlatformViewController = NSViewController
#endif

let extensionBundleIdentifier = "com.ManasGoyal.ClarityTube.ClarityTube.Extension"

class ViewController: PlatformViewController, WKNavigationDelegate, WKScriptMessageHandler {

    @IBOutlet var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure WebView
        self.webView.navigationDelegate = self
        self.webView.configuration.userContentController.add(self, name: "controller")
        
#if os(iOS)
        self.webView.scrollView.isScrollEnabled = false
#endif

        // Load HTML content
        guard let htmlURL = Bundle.main.url(forResource: "Main", withExtension: "html") else {
            print("Error: Main.html not found in bundle.")
            return
        }
        self.webView.loadFileURL(htmlURL, allowingReadAccessTo: Bundle.main.resourceURL!)
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
#if os(iOS)
        webView.evaluateJavaScript("show('ios')")
#elseif os(macOS)
        webView.evaluateJavaScript("show('mac')")

        SFSafariExtensionManager.getStateOfSafariExtension(withIdentifier: extensionBundleIdentifier) { (state, error) in
            if let error = error {
                print("Error checking Safari extension state: \(error.localizedDescription)")
                return
            }

            guard let state = state else {
                print("Error: Unable to fetch Safari extension state.")
                return
            }

            DispatchQueue.main.async {
                if #available(macOS 13, *) {
                    webView.evaluateJavaScript("show('mac', \(state.isEnabled), true)")
                } else {
                    webView.evaluateJavaScript("show('mac', \(state.isEnabled), false)")
                }
            }
        }
#endif
    }

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
#if os(macOS)
        guard let action = message.body as? String, action == "open-preferences" else {
            print("Invalid message received: \(message.body)")
            return
        }

        SFSafariApplication.showPreferencesForExtension(withIdentifier: extensionBundleIdentifier) { error in
            if let error = error {
                print("Error opening Safari preferences: \(error.localizedDescription)")
                return
            }

            DispatchQueue.main.async {
                NSApp.terminate(self)
            }
        }
#endif
    }

}

