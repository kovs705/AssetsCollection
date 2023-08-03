//
// MARK: Safari View module
//
//
//  Created by Kovs on 02.08.2023.
//  Copyright © 2023 CodingKovs. All rights reserved.
//

import SwiftUI
import SafariServices

/*
    USAGE:
        SafariView(url: URL(string "...")
            .edgesIgnoringSafeArea(.all)
 
 */

@available(iOS 13.0, *)
struct SafariView: UIViewControllerRepresentable {

    // MARK: Stored Properties

    let url: URL

    // MARK: Methods

    func makeUIViewController(context: Context) -> SFSafariViewController {
        let configuration = SFSafariViewController.Configuration()
        configuration.barCollapsingEnabled = false
        return SFSafariViewController(url: url, configuration: configuration)
    }

    func updateUIViewController(_ controller: SFSafariViewController, context: Context) {

    }

}


