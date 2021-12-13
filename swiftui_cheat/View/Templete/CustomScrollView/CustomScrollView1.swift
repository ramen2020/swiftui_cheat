//
//  CustomScrollView1
//  swiftui_cheat
//

import SwiftUI

struct CustomScrollView1: View {
    var body: some View {
        CustomScrollView {
            ForEach(0...10, id: \.self) { index in
                Card1().padding()
            }
        } onRefresh: { endReflesh in
            print("API実行")
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                print("API接続成功：status code 200")
                endReflesh()
            }
            // 非同期処理の完了時に引数のクロージャ(done)を実行する
//            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: done)
        }
    }
}

struct CustomScrollView1_Previews: PreviewProvider {
    static var previews: some View {
        CustomScrollView1()
    }
}
