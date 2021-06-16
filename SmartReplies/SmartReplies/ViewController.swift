//
//  ViewController.swift
//  SmartReplies
//
//

import UIKit
import MLKitSmartReply

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var conversation: [TextMessage] = []

        // Then, for each message sent and received:
        let message = TextMessage(
            text: "Hello",
            timestamp: Date().timeIntervalSince1970,
            userID: "userId",
            isLocalUser: false)
        conversation.append(message)

        
        SmartReply.smartReply().suggestReplies(for: conversation) { result, error in
            guard error == nil, let result = result else {
                return
            }
            if (result.status == .notSupportedLanguage) {
                // The conversation's language isn't supported, so
                // the result doesn't contain any suggestions.
            } else if (result.status == .success) {
                for suggestion in result.suggestions {
                  print("Suggested reply: \(suggestion.text)")
                }
            }
        }
        
        
    }


}

