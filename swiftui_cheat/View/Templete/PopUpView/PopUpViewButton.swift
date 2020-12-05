//
//  PopUpViewButton
//  swiftui_cheat
//

import SwiftUI

struct PopUpViewButton: View {

    @Binding var showing : Bool
    let buttonName: String

    var body: some View {
        Button(action: {
            showing.toggle()
        }) {
            Text(buttonName)
        }
    }
}

//struct PopUpViewButton_Previews: PreviewProvider {
//    static var previews: some View {
//        PopUpViewButton()
//    }
//}
