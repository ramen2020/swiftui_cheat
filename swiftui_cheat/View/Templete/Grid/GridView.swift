//
//  GridView
//  swiftui_cheat
//

import SwiftUI

struct GridView: View {
    var body: some View {
        ScrollView {
            Section(header: "LazyVGridView1") {
                LazyVGridView1()
            }
            
            Section(header: "LazyVGridView2") {
                LazyVGridView2()
            }
            Section(header: "LazyHGridView") {
                LazyHGridView()
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
