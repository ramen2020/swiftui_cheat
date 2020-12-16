//
//  RadioButton
//  swiftui_cheat
//

import SwiftUI

import SwiftUI

struct RadioButtonModel: Identifiable, Hashable {
    let id = UUID()
    let index: Int
    let text: String
    
    init(index: Int, text: String) {
        self.index = index
        self.text = text
    }
}

struct RadioButton: View {
    
    enum Axis {
        case horizontal
        case vertical
    }
    
    @Binding var selectedIndex: Int
    private let axis: Axis
    private var models: [RadioButtonModel] = []
    
    init(selectedIndex: Binding<Int>, axis: Axis, texts: [String]) {
        self._selectedIndex = selectedIndex
        self.axis = axis
        
        var index = 0
        texts.forEach { text in
            let model = RadioButtonModel(index: index, text: text)
            models.append(model)
            index += 1
        }
    }
    
    var body: some View {
        if axis == .vertical {
            return configureVertical()
        } else {
            return configureHorizontal()
        }
    }
    
    private func configureHorizontal() -> AnyView {
        return AnyView(
            HStack {
                configure()
            }
        )
    }
    
    private func configureVertical() -> AnyView {
        return AnyView(
            VStack(alignment: .leading) {
                configure()
            }
        )
    }
    
    private func configure() -> AnyView {
        return AnyView(
            ForEach(models) { model in
                HStack {
                    if model.index == self.selectedIndex {
                        ZStack {
                            Circle()
                                .stroke(Color.materialColor(colorCode: .grey), style: StrokeStyle(lineWidth: 1))
                                .frame(width: 22, height: 22)
                            Circle()
                                .fill(Color.accentColor)
                                .frame(width: 14, height: 14)
                        }
                    } else {
                        Circle()
                            .stroke(Color.materialColor(colorCode: .grey), style: StrokeStyle(lineWidth: 1))
                            .frame(width: 22, height: 22)
                    }
                    Text(model.text)
                        .font(.system(size: 16))
                }
                .onTapGesture {
                    self._selectedIndex.wrappedValue = model.index
                }
            }
        )
    }
}
//
//struct RadioButton_Previews: PreviewProvider {
//    static var previews: some View {
//        RadioButton()
//    }
//}
