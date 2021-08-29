//
//  ProgressBar
//  swiftui_cheat
//

import SwiftUI

struct ProgressBarView: View {
    
    var currentValue: Int = 38
    var maxValue: Int = 100
    
    var body: some View {
        
        List {
            // 赤 動的
            Section(header: Text("ProgressBar")) {
                Text("現在は、\(Int(currentValue) * 100 / Int(maxValue))% です。")
                
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
            }
            
            // 青 静的
            Section(header: Text("ProgressBar2")) {
                Text("現在は、49% です。")
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
            
            Section(header: Text("ProgressBar3 ios14~")) {
                ProgressView(value: 0.35)
                    .frame(height: 30)
            }
            
            Section(header: Text("ActiveIndicator")) {
                ProgressView(value: 0.35)
                    .frame(height: 30)
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.blue))
            }
            
            Section(header: Text("ActiveIndicator2")) {
                ProgressView(value: 0.35)
                    .scaleEffect(x: 2, y: 2, anchor: .center) // indicatorの大きさ
                    .frame(width: 30, height: 30)
                    .padding(24)
                    .background(Color.gray)
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                    .cornerRadius(30)
            }
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
