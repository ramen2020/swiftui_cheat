//
//  CustomScrollView
//  swiftui_cheat
//

import SwiftUI
import UIKit

// link: https://qiita.com/ruwatana/items/0598af785f19ed907e81

struct CustomScrollView<Content: View>: UIViewControllerRepresentable {
    typealias OnRefresh = (_ endReflesh: @escaping () -> Void) -> Void

    private let content: () -> Content
    private let onRefresh: OnRefresh

    init(
        @ViewBuilder content: @escaping () -> Content,
        onRefresh: @escaping OnRefresh
    ) {
        self.content = content
        self.onRefresh = onRefresh
    }

    func makeUIViewController(context: Context) -> CustomScrollViewController<Content> {
        CustomScrollViewController(content: content, onRefresh: onRefresh)
    }

    func updateUIViewController(_ viewController: CustomScrollViewController<Content>, context: Context) {
        viewController.update()
    }
}
