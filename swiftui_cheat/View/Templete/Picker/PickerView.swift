//
//  PickerView
//  swiftui_cheat
//

import SwiftUI

struct PickerView: View {
    @State private var selectedIndex = 0
    var body: some View {
        VStack {
            Picker("あいさつはしましょう", selection: $selectedIndex, content: {
                Text("おはよう")
                    .tag(0)
                Text("こんにちわ")
                    .tag(1)
                Text("こんばんわ")
                    .tag(2)
            })
            Text("あいさつ: \(selectedIndex)")
        }
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
