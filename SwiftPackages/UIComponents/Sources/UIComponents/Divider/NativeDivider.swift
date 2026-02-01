import SwiftUI

public struct NativeDivider: View {
    let height: CGFloat

    public init(height: CGFloat) {
        self.height = height
    }

    public var body: some View {
        Rectangle()
            .fill(Color.boschLightGrey)
            .frame(height: self.height)
            .edgesIgnoringSafeArea(.horizontal)
    }
}

struct NativeDivider_Previews: PreviewProvider {
    static var previews: some View {
        NativeDivider(height: 1)
    }
}
