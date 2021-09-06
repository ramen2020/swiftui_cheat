//
//  ParchmentのPageViewをカスタマイズしたView
//  https://github.com/rechsteiner/Parchment
//

import SwiftUI
import Parchment

@available(iOS 13.0, *)
public struct CustomPageView<Item: PagingItem, Page: View>: View {
    let content: (Item) -> Page

    private let options: PagingOptions
    private var items = [Item]()
    private var onWillScroll: ((PagingItem) -> Void)?
    private var onDidScroll: ((PagingItem) -> Void)?
    private var onDidSelect: ((PagingItem) -> Void)?
    private var isHiddenTabBorder: Bool
    @Binding private var selectedIndex: Int

    public init(
        options: PagingOptions = PagingOptions(),
        items: [Item],
        selectedIndex: Binding<Int> = .constant(Int.max),
        isHiddenTabBorder: Bool = false,
        content: @escaping (Item) -> Page
    ) {
        _selectedIndex = selectedIndex
        self.options = options
        self.items = items
        self.isHiddenTabBorder = isHiddenTabBorder
        self.content = content
    }

    public var body: some View {
        PagingController(
            items: items,
            options: options,
            content: content,
            onWillScroll: onWillScroll,
            onDidScroll: onDidScroll,
            onDidSelect: onDidSelect,
            isHiddenTabBorder: isHiddenTabBorder,
            selectedIndex: $selectedIndex
        )
    }

    // スクロールした時
    public func didScroll(_ action: @escaping (PagingItem) -> Void) -> Self {
        var view = self
        view.onDidScroll = action
        return view
    }

    // スクロールする時
    public func willScroll(_ action: @escaping (PagingItem) -> Void) -> Self {
        var view = self
        view.onWillScroll = action
        return view
    }

    // 選択した時
    public func didSelect(_ action: @escaping (PagingItem) -> Void) -> Self {
        var view = self
        view.onDidSelect = action
        return view
    }

    final class CustomPagingViewController: PagingViewController {
        var items: [Item]?
    }

    struct PagingController: UIViewControllerRepresentable {
        let items: [Item]
        let options: PagingOptions
        let content: (Item) -> Page
        var onWillScroll: ((PagingItem) -> Void)?
        var onDidScroll: ((PagingItem) -> Void)?
        var onDidSelect: ((PagingItem) -> Void)?
        var isHiddenTabBorder: Bool

        @Binding var selectedIndex: Int

        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }

        func makeUIViewController(context: UIViewControllerRepresentableContext<PagingController>) -> CustomPagingViewController {
            let pagingViewController = CustomPagingViewController(options: options)
            if isHiddenTabBorder {
                pagingViewController.indicatorOptions = .hidden // 下線を消す
            } else {
                if items.count == 1 { pagingViewController.indicatorOptions = .hidden } // １つの時はタブのbuttonの下線を消す
                pagingViewController.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold) // 選択されていないfontの変更
                pagingViewController.textColor = UIColor(Color.green) // 選択されていないTextColorの変更
                pagingViewController.selectedFont = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold) // 選択されてるfontの変更
                pagingViewController.selectedTextColor = UIColor(Color.green) // 選択されているTextColorの変更
                pagingViewController.menuInteraction = .scrolling // タブ全体を横スクロールできるように変更
            }
            pagingViewController.borderOptions = .hidden
            pagingViewController.dataSource = context.coordinator
            pagingViewController.delegate = context.coordinator
            return pagingViewController
        }

        func updateUIViewController(_ pagingViewController: CustomPagingViewController,
                                    context: UIViewControllerRepresentableContext<PagingController>) {
            context.coordinator.parent = self

            if pagingViewController.dataSource == nil {
                pagingViewController.dataSource = context.coordinator
            }

            if let previousItems = pagingViewController.items,
                !previousItems.elementsEqual(items, by: { $0.isEqual(to: $1) }) {
                pagingViewController.reloadData()
            }

            pagingViewController.items = items

            guard selectedIndex != Int.max else {
                return
            }

            pagingViewController.select(index: selectedIndex, animated: true)
        }
    }

    final class Coordinator: PagingViewControllerDataSource, PagingViewControllerDelegate {
        var parent: PagingController

        init(_ pagingController: PagingController) {
            parent = pagingController
        }

        func numberOfViewControllers(in _: PagingViewController) -> Int {
            return parent.items.count
        }

        func pagingViewController(_: PagingViewController, viewControllerAt index: Int) -> UIViewController {
            let view = parent.content(parent.items[index])
            let hostingViewController = UIHostingController(rootView: view)
//            let backgroundColor = parent.options.pagingContentBackgroundColor
//            hostingViewController.view.backgroundColor = backgroundColor
            return hostingViewController
        }

        func pagingViewController(_: PagingViewController, pagingItemAt index: Int) -> PagingItem {
            parent.items[index]
        }

        func pagingViewController(_ controller: PagingViewController,
                                  didScrollToItem pagingItem: PagingItem,
                                  startingViewController _: UIViewController?,
                                  destinationViewController _: UIViewController,
                                  transitionSuccessful _: Bool) {
            if let item = pagingItem as? Item,
                let index = parent.items.firstIndex(where: { $0.isEqual(to: item) }) {
                DispatchQueue.main.async {
                    self.parent.selectedIndex = index
                }
            }

            parent.onDidScroll?(pagingItem)

        }

        func pagingViewController(_: PagingViewController,
                                  willScrollToItem pagingItem: PagingItem,
                                  startingViewController _: UIViewController,
                                  destinationViewController _: UIViewController) {
            parent.onWillScroll?(pagingItem)
        }

        func pagingViewController(_: PagingViewController, didSelectItem pagingItem: PagingItem) {
            parent.onDidSelect?(pagingItem)
        }
    }
}
