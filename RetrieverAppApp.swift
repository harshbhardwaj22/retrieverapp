
import SwiftUI
import UIKit

struct DeviceInfoViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> DeviceInfoViewController {
        DeviceInfoViewController()
    }

    func updateUIViewController(_ uiViewController: DeviceInfoViewController, context: Context) {
        
    }
}

@main
struct RetrieverAppApp: App {
    var body: some Scene {
        WindowGroup {
            DeviceInfoViewControllerWrapper() 
        }
    }
}
