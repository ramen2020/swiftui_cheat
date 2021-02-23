//
//  CustomNavigationBarImageView
//  swiftui_cheat
//

import SwiftUI

struct CustomNavigationBarImageView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing:0) {
                CustomNavigationBar(imageName: "pop_eigyou_saikai", isReturn: true)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
    }
}

struct CustomNavigationBarImageView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationBarImageView()
    }
}
