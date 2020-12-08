//
//  PopUpView
//  swiftui_cheat
//

import SwiftUI
import PopupView

struct PopUpView: View {
    
    @State var isShowPopup = false
    @State var isShowTopToast = false
    @State var isShowBottomToast = false
    @State var isShowTopFloater = false
    
    var body: some View {
        VStack{
            // popup
            PopUpViewButton(showing: $isShowPopup, buttonName: "Popup")
            
            Spacer().frame(height: 30)
            
            // 上からトースト
            PopUpViewButton(showing: $isShowTopToast, buttonName: "TopToast")
            
            Spacer().frame(height: 30)
            
            // 下からトースト
            PopUpViewButton(showing: $isShowBottomToast, buttonName: "BottomToast")
            
            Spacer().frame(height: 30)
            
            
            PopUpViewButton(showing: $isShowTopFloater, buttonName: "TopFloater")
            
            Spacer().frame(height: 30)
        }
        .navigationBarTitle("PopUpView", displayMode:.large)
        .popup(isPresented: $isShowPopup, type: .default, closeOnTap: false,
               closeOnTapOutside: true, backgroundColor: Color.black.opacity(0.5)) {
            createPopup()
        }
        .popup(isPresented: $isShowTopToast, type: .toast, position: .top, closeOnTap: false,
               closeOnTapOutside: true, backgroundColor: Color.black.opacity(0.5)) {
            createTopToast()
        }
        .popup(isPresented: $isShowBottomToast, type: .toast, position: .bottom, closeOnTap: false,
               closeOnTapOutside: true, backgroundColor: Color.black.opacity(0.5)) {
            createBottomToast()
        }
        .popup(isPresented: $isShowTopFloater, type: .floater(), position: .top, animation: .spring(), autohideIn: 2) {
            createTopFloater()
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
            .padding(15)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 110)
        .background(Color.materialColor(colorCode: .deepOrange))
        .cornerRadius(30)
    }
    
    // 下からトースト
    func createBottomToast() -> some View {
        VStack {
            VStack(alignment: .leading, spacing: 2) {
                HStack {
                    Text("お鍋が食べたい")
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
            .padding(.horizontal, 15)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 110)
        .background(Color.materialColor(colorCode: .deepPurple))
        .cornerRadius(30)
    }
    
    
    func createTopFloater() -> some View {
        HStack(spacing: 10) {
            Image("transaction_coffee")
                .resizable()
                .aspectRatio(contentMode: ContentMode.fill)
                .frame(width: 20, height: 20)
            VStack(spacing: 8) {
                Text("Coffee temperature")
                    .font(.system(size: 12))
                    .foregroundColor(.white)

                HStack(spacing: 0) {
                    Color(red: 1, green: 112/255, blue: 59/255)
                        .frame(width: 30, height: 5)
                    Color(red: 1, green: 1, blue: 1)
                        .frame(width: 70, height: 5)
                }.cornerRadius(2.5)
            }
        }
        .frame(width: 200, height: 60)
        .background(Color.materialColor(colorCode: .lightGreen))
        .cornerRadius(30.0)
    }
}

struct PopUpView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpView()
    }
}
