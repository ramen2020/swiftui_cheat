
import SwiftUI
import PartialSheet

@main
struct swiftui_cheatApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(PartialSheetManager())
        }
    }
}
