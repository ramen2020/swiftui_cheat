import SwiftUI

struct AlerView: View {

    @State var isShowAlert = false
    
    var body: some View {
        Button(action: {
            isShowAlert = true
        }) {
            Text("Button")
        }
    }
}

struct Alert_Previews: PreviewProvider {
    static var previews: some View {
        AlerView()
    }
}
