//
//  UIColor+Extension
//  swiftui_cheat
//

import Foundation
import SwiftUI

extension UIColor {
    
    // カラーコードでカラーを指定する。
    // ex) Color(UIColor(hex: "3d5a80"))
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let v = Int("000000" + hex, radix: 16) ?? 0
        let r = CGFloat(v / Int(powf(256, 2)) % 256) / 255
        let g = CGFloat(v / Int(powf(256, 1)) % 256) / 255
        let b = CGFloat(v / Int(powf(256, 0)) % 256) / 255
        self.init(red: r, green: g, blue: b, alpha: min(max(alpha, 0), 1))
    }
}
    
extension Color {

    enum AppColor: String {
        case red = "f44336"
        case pink = "E91E63"
        case purple = "9C27B0"
        case deepPurple = "673AB7"
        case indigo = "3F51B5"
        case blue = "2196F3"
        case lightBlue = "03A9F4"
        case cyan = "00BCD4"
        case teal = "009688"
        case green = "4CAF50"
        case lightGreen = "8BC34A"
        case lime = "CDDC39"
        case yellow = "FFEB3B"
        case amber = "FFC107"
        case orange = "FF9800"
        case deepOrange = "FF5722"
        case brown = "795548"
        case grey = "9E9E9E"
        case blueGrey = "607D8E"
    }
    
    static func materialColor(colorCode :Color.AppColor) -> Color {
        return Color(UIColor(hex: colorCode.rawValue))
    }
}
