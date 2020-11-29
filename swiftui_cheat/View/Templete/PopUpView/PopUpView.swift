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
        .popup(isPresented: $isShowPopup, type: .default, closeOnTap: false, closeOnTapOutside: true, backgroundColor: Color.black.opacity(0.5)) {
            createPopup()
        }
        .navigationBarTitle("PopUpView", displayMode:.large)
    }
    
    func createPopup() -> some View {
        VStack(spacing: 13) {
            Image(systemName: "32.circle.fill")
                .resizable()
                .aspectRatio(contentMode: ContentMode.fit)
                .frame(width: 100, height: 150)

            Text("Coffee")
                .foregroundColor(.white)
                .fontWeight(.bold)

            Text("offee is good. If you drink it before going to bed at night, you won't be able to wake up in the morning!")
                .font(.system(size: 12))
                .fixedSize(horizontal: false, vertical: true)

            Spacer()

            Button(action: {
                self.isShowPopup = false
            }) {
                Text("Got it")
                    .font(.system(size: 14))
                    .fontWeight(.bold)
            }
            .frame(width: 100, height: 40)
            .background(Color.white)
            .cornerRadius(15)
        }
        .padding(40)
        .frame(width: 300, height: 400)
        .background(Color.materialColor(colorCode: .lightGreen))
        .cornerRadius(10)
    }
}

struct PopUpView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpView()
    }
}
