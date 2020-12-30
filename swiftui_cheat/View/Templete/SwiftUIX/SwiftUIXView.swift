//
//  SwiftUIXView
//  swiftui_cheat
//

import SwiftUI
import SwiftUIX

struct SwiftUIXView: View {
    
    var body: some View {
        VStack{
            ActivityIndicator()
        }
        .navigationBarTitleView(Image(systemName:"house"), displayMode: .inline)
    }
}

struct SwiftUIXView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIXView()
    }
}
