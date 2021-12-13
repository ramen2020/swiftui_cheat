//
//  ScrollViewController
//  swiftui_cheat
//

import Foundation
import UIKit
import SwiftUI


// link: https://qiita.com/ruwatana/items/0598af785f19ed907e81
final class CustomScrollViewController<Content: View>: UIViewController {
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.alwaysBounceVertical = true
        view.refreshControl = refreshControl
        return view
    }()
    private lazy var refreshControl: UIRefreshControl = {
        let control = UIRefreshControl()
        control.addTarget(
            self,
            action: #selector(onValueChanged(sender:)),
            for: .valueChanged
        )
        return control
    }()
    private lazy var hostingController: UIHostingController<Content> = UIHostingController(rootView: content())

    typealias OnRefresh = (_ done: @escaping () -> Void) -> Void
    private let content: () -> Content
    private let onRefresh: OnRefresh

    init(content: @escaping () -> Content, onRefresh: @escaping OnRefresh) {
        self.content = content
        self.onRefresh = onRefresh
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // refreshControlを持ったUIScrollViewを画面いっぱいに貼る
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            view.topAnchor.constraint(equalTo: scrollView.topAnchor),
            view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])

        // UIScrollViewの中にSwiftUIのコンテンツをいっぱいに貼る
        scrollView.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addConstraints([
            scrollView.topAnchor.constraint(equalTo: hostingController.view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: hostingController.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: hostingController.view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: hostingController.view.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: hostingController.view.widthAnchor)
        ])
    }

    func update() {
        hostingController.rootView = content()

        // 描画更新時に適切に制約が変わるように明示的に呼ぶ
        hostingController.view.setNeedsUpdateConstraints()
    }

    @objc private func onValueChanged(sender: UIRefreshControl) {
        // 非同期処理を呼び出し、Refresh終了時にUIRefreshControlを終了させる
        onRefresh(sender.endRefreshing)
    }
}
