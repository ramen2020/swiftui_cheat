//
//  PopUpView
//  swiftui_cheat
//

import SwiftUI
import PopupView

struct PopUpView: View {
    
    @State var isShowPopup = false
    @State var isShowTopToast = false

    var body: some View {
        VStack{
            
            // popup
            Button(action: {
                isShowPopup.toggle()
            }) {
                Text("Popup")
            }
            
            // 上からトースト
            Button(action: {
                isShowTopToast.toggle()
            }) {
                Text("TopToast")
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle("PopUpView", displayMode:.large)
        .popup(isPresented: $isShowPopup, type: .default, closeOnTap: false, closeOnTapOutside: true, backgroundColor: Color.black.opacity(0.5)) {
            createPopup()
        }
        .popup(isPresented: $isShowTopToast, type: .toast, position: .top, closeOnTap: false, closeOnTapOutside: true, backgroundColor: Color.black.opacity(0.5)) {
            createTopToast()
        }
    }
    
    // popup
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
    
    // 上からトースト
    func createTopToast() -> some View {
        VStack {
            Spacer(minLength: 20)
            HStack() {
                Image(systemName: "arrowshape.turn.up.right.fill")
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fill)
                    .frame(width: 25, height: 25)
                    .cornerRadius(10)

                VStack(alignment: .leading, spacing: 2) {
                    HStack {
                        Text("お肉が食べたい")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        Spacer()
                        Text("20:00")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                    }

                    Text("今日もお仕事を頑張りました。ので、ご褒美として、美味しいお肉が食べたいです。焼肉がいいです。ついでにレモンサワーもいただければ飛び跳ねます。")
                        .lineLimit(2)
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                }
            }
            .padding(15)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 110)
        .background(Color.materialColor(colorCode: .deepOrange))
        .cornerRadius(30)
        .offset(y: 100)
    }
}

struct PopUpView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpView()
    }
}
