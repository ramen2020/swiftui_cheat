//
//  CheckBoxCell
//  swiftui_cheat
//

import SwiftUI

struct CheckBoxCell: View {

    @State private var checked = false

    var body: some View {
        HStack {
            CheckBox(checked: $checked, onTapped: {
                self.checked ? print("check！") : print("uncheck")
            })
            .padding(.vertical, 12)
            
            Text("チェックボックスです。")
                .font(.system(size: 14, weight: .semibold))
                .padding(8)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
        .onTapGesture {
            checked.toggle() // チェックボックスは小さくて押しにくいから、cellを押した時も反応するようにしている。
        }
    }
}

struct CheckBoxCell_Previews: PreviewProvider {
    static var previews: some View {
        CheckBoxCell()
    }
}
