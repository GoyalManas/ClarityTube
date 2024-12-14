// Notify the background script that the content script is active
browser.runtime.sendMessage({ greeting: "ClarityTube active" }).then((response) => {
    console.log("Background script responded with: ", response);
});

// Function to toggle visibility of elements
const toggleVisibility = (selectors, displayValue) => {
    document.querySelectorAll(selectors).forEach((el) => {
        el.style.display = displayValue;
    });
};

// Handle dynamic content loading using MutationObserver
const observeDynamicContent = (callback) => {
    const observer = new MutationObserver(callback);
    observer.observe(document.body, { childList: true, subtree: true });
};

// Action Handlers
const actions = {
    hideComments: () => toggleVisibility("ytd-comments, #comments, .comments, .ytd-comments", "none"),
    showComments: () => toggleVisibility("ytd-comments, #comments, .comments, .ytd-comments", ""),
    hideSidebar: () => toggleVisibility("#secondary, ytd-watch-next-secondary-results-renderer, .secondary, #related", "none"),
    showSidebar: () => toggleVisibility("#secondary, ytd-watch-next-secondary-results-renderer, .secondary, #related", ""),
    hideHomepageSuggestions: () => toggleVisibility("ytd-rich-grid-renderer, #chips-wrapper, #contents, #sections", "none"),
    showHomepageSuggestions: () => toggleVisibility("ytd-rich-grid-renderer, #chips-wrapper, #contents, #sections", "")
};

// Listening for toggle messages from the background script
browser.runtime.onMessage.addListener((request, sender, sendResponse) => {
    console.log("Received request from background script: ", request);

    if (actions[request.action]) {
        actions[request.action]();
        sendResponse({ status: `${request.action.replace("hide", "").replace("show", "")} ${request.action.includes("hide") ? "hidden" : "visible"}` });
    } else {
        sendResponse({ status: "Unknown action" });
    }
});

// Automatically handle dynamic content loading
observeDynamicContent(() => {
    // Apply hide logic for any dynamically loaded content
    actions.hideComments();
    actions.hideSidebar();
    actions.hideHomepageSuggestions();
});

// Initial execution to ensure elements are hidden on page load
actions.hideComments();
actions.hideSidebar();
actions.hideHomepageSuggestions();

