//
//  PopUpView
//  swiftui_cheat
//

import SwiftUI
import PopupView

struct PopUpView: View {
    
    @State var isShowPopup = false

    var body: some View {
        VStack{
            Button(action: {
                isShowPopup.toggle()
            }) {
                Text("Popup")
            }
        }
        .edgesIgnoringSafeArea(.all)
        .popup(isPresented: $isShowPopup, type: .default, closeOnTap: false) {
            createPopup()
        }
        .navigationBarTitle("PopUpView", displayMode:.large)
    }
    
    func createPopup() -> some View {
        VStack(spacing: 10) {
            Image(systemName: "32.circle.fill")
                .resizable()
                .aspectRatio(contentMode: ContentMode.fit)
                .frame(width: 100, height: 100)

            Text("Tutorial")
                .foregroundColor(.white)
                .fontWeight(.bold)

            Text("In this example floats are set to disappear after 2 seconds. Tap the toasts to dismiss or just open some other popup - previous one will be dismissed. This popup will only be closed if you tap the button.")
                .font(.system(size: 12))
                .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9))

            Spacer()

            Button(action: {
                self.isShowPopup = false
            }) {
                Text("Got it")
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                    .fontWeight(.bold)
            }
            .frame(width: 100, height: 40)
            .background(Color.white)
            .cornerRadius(20.0)
        }
        .padding(EdgeInsets(top: 70, leading: 20, bottom: 40, trailing: 20))
        .frame(width: 300, height: 400)
        .background(Color.red)
        .cornerRadius(10.0)
        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.13), radius: 10.0)
    }
}

struct PopUpView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpView()
    }
}
