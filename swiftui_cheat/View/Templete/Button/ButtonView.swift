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
                CustomButton2()
                Spacer().frame(height: 30)
            }
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .navigationBarTitle("Button", displayMode: .large)
    }
}

struct CustomButton2: View {
    var body: some View {
        Button(action: {
            
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

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
