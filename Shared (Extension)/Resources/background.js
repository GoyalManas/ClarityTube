// Listen for messages from content.js
browser.runtime.onMessage.addListener((message, sender, sendResponse) => {
    console.log("Message received in background script: ", message);

    if (message.greeting === "ClarityTube active") {
        sendResponse({ response: "Extension acknowledged." });
    }
});

// Toggle state variables to manage comments and sidebar visibility
let areCommentsHidden = false;
let isSidebarHidden = false;

// Handle browser action click (e.g., toolbar button)
browser.action.onClicked.addListener((tab) => {
    // Toggle comments visibility
    areCommentsHidden = !areCommentsHidden;

    const action = areCommentsHidden ? "hideComments" : "showComments";
    browser.tabs.sendMessage(tab.id, { action }).then(() => {
        console.log(`Toggled comments: ${areCommentsHidden ? "Hidden" : "Visible"}`);
    }).catch((error) => {
        console.error("Error toggling comments: ", error);
    });
});

// Additional commands (e.g., toggle sidebar via keyboard shortcuts or other triggers)
browser.commands.onCommand.addListener((command) => {
    if (command === "toggleSidebar") {
        // Toggle sidebar visibility
        isSidebarHidden = !isSidebarHidden;

        browser.tabs.query({ active: true, currentWindow: true }).then((tabs) => {
            const action = isSidebarHidden ? "hideSidebar" : "showSidebar";
            browser.tabs.sendMessage(tabs[0].id, { action }).then(() => {
                console.log(`Toggled sidebar: ${isSidebarHidden ? "Hidden" : "Visible"}`);
            }).catch((error) => {
                console.error("Error toggling sidebar: ", error);
            });
        });
    }
});

