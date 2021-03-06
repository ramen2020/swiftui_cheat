//
//  PickerView
//  swiftui_cheat
//

import SwiftUI

struct PickerView: View {
    @State private var selectedIndex = 0
    private var gohans = ["ぱん","白米", "うどん", "ラーメン"]
    
    var body: some View {
        VStack(spacing: 20) {
            NormalPickerView()
            FormPickerView()
            SegmentedPickerView()
            MenuPickerView()
            DatePickerView()
        }
    }
}


struct DatePickerView: View {

    @State private var selectionDate = Date()

    var body: some View {
        Form {
            DatePicker("お日付", selection: $selectionDate, displayedComponents: .date)
        }
    }
}

struct NormalPickerView: View {
    @State private var selectedIndex = 0
    private var gohans = ["ぱん","白米", "うどん", "ラーメン"]
    
    var body: some View {
        Picker("あいさつはしましょう", selection: $selectedIndex, content: {
            Text("おはよう")
                .tag(0)
            Text("こんにちわ")
                .tag(1)
            Text("こんばんわ")
                .tag(2)
        })
        Text("あいさつ: \(selectedIndex)")
    }
}

struct FormPickerView: View {
    @State private var selectedIndex = 0
    private var gohans = ["ぱん","白米", "うどん", "ラーメン"]
    
    var body: some View {
        Form {
            Section {
                Picker(selection: $selectedIndex, label: Text("選ばれしご飯: ")) {
                    ForEach(0 ..< gohans.count) {
                        Text(self.gohans[$0])
                    }
                }
                Text("ごはん: \(gohans[selectedIndex])")
            }
        }
    }
}

struct SegmentedPickerView: View {
    @State private var selectedIndex = 0
    private var gohans = ["ぱん","白米", "うどん", "ラーメン"]
    
    var body: some View {
        Form {
            Section {
                Picker(selection: $selectedIndex, label: Text("選ばれしご飯: ")) {
                    ForEach(0 ..< gohans.count) {
                        Text(self.gohans[$0])
                    }
                }
            .pickerStyle(SegmentedPickerStyle())

                Text("ごはん: \(gohans[selectedIndex])")
            }
        }
    }
}

struct MenuPickerView: View {
    @State private var selectedIndex = 0
    private var gohans = ["ぱん","白米", "うどん", "ラーメン"]
    
    var body: some View {
        Form {
            Section {
                Picker(selection: $selectedIndex, label: Text("選ばれしご飯: ")) {
                    ForEach(0 ..< gohans.count) {
                        Text(self.gohans[$0])
                    }
                }
            .pickerStyle(MenuPickerStyle())

                Text("ごはん: \(gohans[selectedIndex])")
            }
        }
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
