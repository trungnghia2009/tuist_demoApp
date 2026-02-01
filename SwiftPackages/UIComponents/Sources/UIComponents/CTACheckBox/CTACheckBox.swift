import SwiftUI

public struct CTACheckBox: View {
    @Binding var isChecked: Bool

    private var buttonText: String

    var checkboxFontColor: Color = .black
    var checkboxBgColor: Color = .white
    var checkboxBgActiveColor: Color = .boschLightBlue
    var checkboxIcon = UIImage(systemName: "checkmark")!

    public init(buttonText: String, isChecked: Binding<Bool>) {
        self.buttonText = buttonText
        _isChecked = isChecked
    }

    public init(isChecked: Binding<Bool>) {
        buttonText = ""
        _isChecked = isChecked
    }

    public var body: some View {
        Button {
            self.isChecked.toggle()
        } label: {
            HStack(alignment: .firstTextBaseline) {
                Image(uiImage: checkboxIcon)
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: SizeUtils.rem, height: SizeUtils.rem)
                    .foregroundColor(self.isChecked ? .white : checkboxBgColor)
                    .background(Rectangle().fill(self.isChecked ? checkboxBgActiveColor : checkboxBgColor)
                        .frame(width: SizeUtils.rem15, height: SizeUtils.rem15)
                        .border(.gray, width: 1)
                    )

                if !buttonText.isEmpty {
                    Text(buttonText)
                        .font(.system(size: SizeUtils.rem))
                        .padding(.leading, SizeUtils.rem05)
                }
            }
        }
    }
}

struct CTACheckBox_Previews: PreviewProvider {
    @State private static var isChecked = true

    static var previews: some View {
        LazyVStack {
            CTACheckBox(buttonText: "Hello world!!", isChecked: $isChecked)
            CTACheckBox(buttonText: "Have you ever been here before", isChecked: $isChecked)
            Text(isChecked ? "On" : "Off")
        }
    }
}
