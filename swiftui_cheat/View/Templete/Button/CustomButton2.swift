//
//  CustomButton2
//  swiftui_cheat
//

import SwiftUI

struct CustomButton2: View {
    var body: some View {
        Button(action: {
            //
        }, label: {
            Text("CustomButton2")
                .foregroundColor(Color.gray)
                .font(.system(size: 15, weight: .semibold))
                .padding(EdgeInsets(top: 8, leading: 15, bottom: 8, trailing: 15))
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.gray, lineWidth: 1)
                )
        })
    }
}

struct CustomButton2_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton2()
    }
}
