//
//  MenuView
//  swiftui_cheat
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack{
            Menu {
                ForEach(0..<5){ index in
                    Button(action: {}) {
                        Text("index: \(index)")
                    }
                }
            } label: {
                Image(systemName: "plus")
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}


