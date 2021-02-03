//
//  WebView
//  swiftui_cheat
//

import SwiftUI

struct WebView: View {
    var body: some View {
        NavigationLink(destination: CustomWKWebView(urlString: "https://www.apple.com/jp/")) {
            Text("CustomWKWebView")
        }
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView()
    }
}
