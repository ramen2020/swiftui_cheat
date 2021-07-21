//
//  ButtonView
//  swiftui_cheat
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Spacer().frame(height: 30)
                
                Spacer().frame(height: 30)
            }
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .navigationBarTitle("Button", displayMode: .large)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
