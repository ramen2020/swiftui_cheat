//
//  ProgressBar
//  swiftui_cheat
//

import SwiftUI

struct ProgressBarView: View {
    
    var currentValue: Int = 38
    var maxValue: Int = 100

    var body: some View {
        
        VStack(spacing: 20) {
            // 赤 動的
            GeometryReader { geometryReader in
                ZStack(alignment: .leading) {
                    Capsule()
                        .frame(height: 7)
                        .foregroundColor(Color(UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)))

                    Capsule()
                        .frame(width: self.progress(value: Double(currentValue),
                                                    maxValue: Double(maxValue),
                                                    width: geometryReader.size.width),
                               height: 7)
                        .foregroundColor(Color.red)
                }
            }.offset(y:-3)
            
            // 青 静的
            GeometryReader { geometryReader in
                ZStack(alignment: .leading) {
                    Capsule()
                        .frame(height: 7)
                        .foregroundColor(Color(UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)))

                    Capsule()
                        .frame(width: self.progress(value: Double(49),
                                                    maxValue: Double(100),
                                                    width: geometryReader.size.width),
                               height: 7)
                        .foregroundColor(Color.blue)
                }
            }.offset(y:-3)
        }
        .padding(50)
        .frame(maxWidth: .infinity)
    }
    
    private func progress(value: Double, maxValue: Double, width: CGFloat) -> CGFloat {
        let percentage = value / maxValue
        return width *  CGFloat(percentage)
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView()
    }
}
