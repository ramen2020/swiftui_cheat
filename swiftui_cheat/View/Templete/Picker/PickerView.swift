//
//  PickerView
//  swiftui_cheat
//

import SwiftUI

struct PickerView: View {
    @State private var selectedColorIndex = 0
    var body: some View {
        VStack {
            Picker("あいさつはしましょう", selection: $selectedColorIndex, content: {
                Text("おはよう")
                    .tag(0)
                Text("こんにちわ")
                    .tag(1)
                Text("こんばんわ")
                    .tag(2)
            })
            Text("Selected color: \(selectedColorIndex)")
        }
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
