//
//  SafariView.swift
//  Mapofm
//
//  Created by Jongwook Park on 2/17/25.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    @Binding var urlString: String

    func makeUIViewController(context: Context) -> SFSafariViewController {
        let url: URL = URL(string: urlString) ?? URL(string: "https://www.mapofm.net")!
        let controller = SFSafariViewController(url: url)
                        
        return controller
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
}
