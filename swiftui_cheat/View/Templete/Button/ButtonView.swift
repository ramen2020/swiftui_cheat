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
                CustomButton1()
                Spacer().frame(height: 30)
            }
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .navigationBarTitle("Button", displayMode: .large)
    }
}

struct CustomButton1: View {
    var body: some View {
        Button(action: {
            
        }, label: {
            Text("すべて")
                .foregroundColor(Color.white)
                .font(.system(size: 15, weight: .semibold))
                .padding(EdgeInsets(top: 8, leading: 15, bottom: 8, trailing: 15))
                .background(Color.pink)
                .cornerRadius(4)
            }
        )
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
