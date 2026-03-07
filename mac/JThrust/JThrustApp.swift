import SwiftUI

@main
struct JThrustApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .background(.black)
        }
        .windowStyle(.hiddenTitleBar)
        .defaultSize(width: 800, height: 600)
        .windowResizability(.contentSize)
    }
}
