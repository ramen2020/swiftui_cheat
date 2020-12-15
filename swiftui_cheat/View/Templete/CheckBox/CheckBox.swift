//
//  CheckBox
//  swiftui_cheat
//

import SwiftUI


struct CheckBox: View {
    
    @Binding var checked: Bool
    
    init(checked: Binding<Bool>, onTapped: @escaping () -> Void) {
        self._checked = checked
    }
    
    var body: some View {
        Button(action: {
            self.$checked.wrappedValue.toggle()
        }) {
            if !checked {
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.gray, lineWidth: 1)
                    .frame(width: 20, height: 20)
                    .background(Color.white)
                    .cornerRadius(4)
            } else {
                Image(systemName: "checkmark.square.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

//
//struct CheckBox_Previews: PreviewProvider {
//    static var previews: some View {
//        CheckBox()
//    }
//}
