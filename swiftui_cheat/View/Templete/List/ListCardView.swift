import SwiftUI

struct ListCardView: View {
    var body: some View {
        List {
            HStack(spacing: 0) {
                Image(systemName: "1.square")
                Spacer()
                Text("123.45")
                Spacer()
                Text("1229.2s")
            }
            .frame(maxWidth: .infinity, alignment: .trailing)

            HStack(spacing: 0) {
                Image(systemName: "1.square")
                Spacer()
                Text("9876.54.")
                Spacer()
                Text("-1229.2s")
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            
            HStack(spacing: 0) {
                Image(systemName: "1.square")
                Spacer()
                Text("67.8")
                Spacer()
                Text("12.2s")
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .frame(width: 300)
    }
}

struct ListCardView_Previews: PreviewProvider {
    static var previews: some View {
        ListCardView()
    }
}

