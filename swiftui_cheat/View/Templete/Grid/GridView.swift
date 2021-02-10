//
//  GridView
//  swiftui_cheat
//

import SwiftUI

struct GridView: View {
    var body: some View {
        ScrollView {
            LazyVGridView1()
            Divider()
            LazyVGridView2()
            Divider()
            LazyHGridView()
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
