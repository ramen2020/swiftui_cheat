//
//  CustomNavigationBarView
//  swiftui_cheat
//

import SwiftUI

struct CustomNavigationBarView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing:0) {
                CustomNavigationBar(title: "custom navigation bar", isReturn: true)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
    }
}

struct CustomNavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationBarView()
    }
}
