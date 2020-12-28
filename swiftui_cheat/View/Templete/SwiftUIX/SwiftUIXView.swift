//
//  SwiftUIXView
//  swiftui_cheat
//

import SwiftUI
import SwiftUIX

struct SwiftUIXView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .navigationBarTitleView(Image(systemName:"house"), displayMode: .inline)
    }
}

struct SwiftUIXView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIXView()
    }
}
