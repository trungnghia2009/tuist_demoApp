import SwiftUI

public struct CTAButton: View {
    var buttonText: String
    let buttonType: CTAButtonType
    let buttonClick: () -> Void

    public init(
        text: String,
        function: @escaping () -> Void,
        type: CTAButtonType = CTAButtonType.primaryButton
    ) {
        buttonText = text
        buttonType = type
        buttonClick = function
    }

    public var body: some View {
        HStack {
            Button {
                self.buttonClick()
            } label: {
                Text(buttonText)
                    .frame(maxWidth: .infinity)
            }
            .customStyle(buttonType)
        }
    }
}

extension Button {
    @ViewBuilder
    func customStyle(_ style: CTAButtonType) -> some View {
        switch style {
        case .primaryButton:
            buttonStyle(PrimaryButton())
        case .secondaryButton:
            buttonStyle(SecondaryButton())
        }
    }
}

struct CTAButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CTAButton(text: "Select", function: {}, type: .primaryButton)
            CTAButton(text: "Cancel", function: {}, type: .secondaryButton)
            CTAButton(text: "Delete", function: {}, type: .primaryButton).disabled(true)
            CTAButton(text: "Edit", function: {}, type: .secondaryButton).disabled(true)
        }
    }
}
