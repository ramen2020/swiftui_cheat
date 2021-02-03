//
//  WKWebView
//  swiftui_cheat
//

import SwiftUI
import WebKit

struct CustomWKWebView: View {
    
    let urlString: String

    var body: some View {
        MakeCustomWKWebView(urlString: urlString)
            .navigationBarTitle(Text(urlString), displayMode: .inline)
    }
}

struct WKWebView_Previews: PreviewProvider {
    static var previews: some View {
        CustomWKWebView(urlString: "https://www.apple.com/jp/")
    }
}

struct MakeCustomWKWebView: UIViewRepresentable {
    let urlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = URL(string: urlString) else {
            return
        }
        uiView.load(URLRequest(url: url))
    }
}

struct MakeCustomWKWebView_Previews: PreviewProvider {
    static var previews: some View {
        MakeCustomWKWebView(urlString: "https://www.apple.com/jp/")
    }
}
