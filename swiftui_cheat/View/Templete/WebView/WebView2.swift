//
//  CustomWebView
//  swiftui_cheat
//

import SwiftUI
import WebKit

struct CustomWebView: View {
    var body: some View {
        CustomWebView2(urlString: "https://medium.com/", navigationTitle: "CustomWebView")
    }
}

struct CustomWebView2: View {

    private var webView: WebView2
    var navigationTitle: String
    var urlString: String

    init(urlString: String, navigationTitle: String) {
        self.urlString = urlString
        self.webView = WebView2(urlString: urlString)
        self.navigationTitle = navigationTitle
    }

    var body: some View {
        VStack() {
            CustomNavigationBar(title: navigationTitle, isReturn: true)

            webView

            HStack(alignment: .top) {
                Button(action: {
                    webView.backPage()
                }) {
                    Image(systemName: "chevron.backward")
                        .font(.title3)
                        .padding(20)
                }

                Button(action: {
                    webView.nextPage()
                }) {
                    Image(systemName: "chevron.forward")
                        .font(.title3)
                        .padding(20)
                }
                
                Spacer()
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct WebView2: UIViewRepresentable {
    var webView = WKWebView()
    var urlString: String

    class Coordinator: NSObject, WKUIDelegate, WKNavigationDelegate {
        var parent: WebView2

        init(_ parent: WebView2) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
            if navigationAction.targetFrame == nil {
                webView.load(navigationAction.request)
            }
            return nil
        }

        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
            if let url = navigationAction.request.url?.absoluteString {
                if (url.hasPrefix("http")) {
                    decisionHandler(WKNavigationActionPolicy.allow)
                } else {
                    decisionHandler(WKNavigationActionPolicy.cancel)
                }
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> WKWebView {
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {

        webView.uiDelegate = context.coordinator
        webView.navigationDelegate = context.coordinator
        webView.allowsBackForwardNavigationGestures = true

        guard let url = URL(string: urlString) else {
            return
        }
        let request = URLRequest(url: url)
        webView.load(request)
    }

    func backPage() {
        webView.goBack()
    }

    func nextPage() {
        webView.goForward()
    }
}
