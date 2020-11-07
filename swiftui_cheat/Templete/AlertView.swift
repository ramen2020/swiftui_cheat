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
                primaryButton: .cancel(),
                secondaryButton: .default(Text("OK"))
            )
        }
    }
}

struct Alert_Previews: PreviewProvider {
    static var previews: some View {
        AlerView()
    }
}
