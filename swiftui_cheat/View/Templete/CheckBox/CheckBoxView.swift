//
//  CheckBoxView
//  swiftui_cheat
//

import SwiftUI

struct CheckBoxView: View {
       
    var body: some View {
        VStack(spacing: 0) {
            CheckBoxCell().background(Color.materialColor(colorCode: .red))
            CheckBoxCell().background(Color.materialColor(colorCode: .yellow))
            CheckBoxCell().background(Color.materialColor(colorCode: .lightBlue))
            CheckBoxCell().background(Color.materialColor(colorCode: .lightGreen))
        }
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckBoxView()
    }
}
