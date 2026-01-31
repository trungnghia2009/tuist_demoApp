// Copyright (c) 2023 Bosch. All rights reserved
// Created 2023

import SwiftUI

struct SecondaryButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        SecondaryButtonView(configuration: configuration)
    }
}

extension SecondaryButton {
    struct SecondaryButtonView: View {
        @Environment(\.isEnabled) var isEnabled

        let configuration: PrimaryButton.Configuration
        let buttonColorActive = Color.boschLightBlue
        let buttonColorDisabled = Color.boschGrey

        var body: some View {
            if isEnabled {
                return configuration.label
                    .foregroundColor(buttonColorActive)
                    .padding()
                    .border(buttonColorActive, width: 1)
                    .background(
                        configuration.isPressed ? Color.boschLightBlue.opacity(0.1) : Color.boschLightBlue.opacity(0.0)
                    )
            } else {
                return configuration.label
                    .foregroundColor(buttonColorDisabled)
                    .padding()
                    .border(buttonColorDisabled, width: 1)
                    .background(buttonColorDisabled.opacity(0.0))
            }
        }
    }
}
