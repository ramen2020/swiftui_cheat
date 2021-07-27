//
//  CustomButton1
//  swiftui_cheat
//

import SwiftUI

struct CustomButton1: View {
    var body: some View {
        Button(action: {
            
        }, label: {
            Text("CustomButton1")
                .foregroundColor(Color.white)
                .font(.system(size: 15, weight: .semibold))
                .padding(EdgeInsets(top: 8, leading: 15, bottom: 8, trailing: 15))
                .background(Color.pink)
                .cornerRadius(4)
            }
        )
    }
}

struct CustomButton1_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton1()
    }
}
