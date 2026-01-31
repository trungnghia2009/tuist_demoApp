import SwiftUI
import Alamofire
import UIComponents

public struct ContentView: View {
    public init() {}

    public var body: some View {
        VStack(spacing: 8.0) {
            Text("Welcome to the Demo App")
            CTAButton(text: "Primary Action", function: {
                print("Primary button tapped")
            }, type: .primaryButton)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
