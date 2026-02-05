// Copyright (c) 2023 Bosch. All rights reserved
// Created 2023

import SwiftUI

struct PrimaryButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        PrimaryButtonView(configuration: configuration)
    }
}

extension PrimaryButton {
    struct PrimaryButtonView: View {
        @Environment(\.isEnabled) var isEnabled

        let configuration: PrimaryButton.Configuration
        let buttonColorDisabled = Color.appGrey

        var body: some View {
            if isEnabled {
                return configuration.label
                    .foregroundColor(.white)
                    .padding()
                    .background(configuration.isPressed ? Color.appDarkBlue : Color.appLightBlue)

            } else {
                return configuration.label
                    .foregroundColor(.white)
                    .padding()
                    .background(buttonColorDisabled)
            }
        }
    }
}
