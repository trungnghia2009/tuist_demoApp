import SwiftUI

@main
struct DemoAppApp: App {
    
    init() {
        logEnvironment()
    }
    
    func logEnvironment() {
        let apiURL = Bundle.main
            .object(forInfoDictionaryKey: "API_BASE_URL") as? String ?? ""

        print("API:", apiURL)

        #if DEV
        print("Running DEV")
        #elseif QA
        print("Running QA")
        #else
        print("Running PROD")
        #endif
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
