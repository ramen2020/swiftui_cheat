import SwiftUI

struct AlerView: View {
    
    @State var isShowAlert = false
    
    var body: some View {
        Button(action: {
            isShowAlert.toggle()
        }) {
            Text("Button")
        }.alert(isPresented: $isShowAlert) {
            Alert(
                title: Text("タイトル"),
                message: Text("メッセージ"),
                primaryButton: .destructive(Text("NG")),
                secondaryButton: .default(Text("OK"), action: {
                    print("ログを表示: ここで何らかの処理ができる。")
                })
            )
        }
    }
}

struct Alert_Previews: PreviewProvider {
    static var previews: some View {
        AlerView()
    }
}
