import SwiftUI

extension Color {
    static var appBlack: Color { return Color("AppBlack", bundle: .module) }
    static var appLightBlue: Color { return Color("AppBlue50", bundle: .module) }
    static var appLightRed: Color { return Color("AppRed50", bundle: .module) }
    static var appLightPurple: Color { return Color("AppPurple50", bundle: .module) }
    static var appLightGreen: Color { return Color("AppGreen50", bundle: .module) }
    static var appLightGrey: Color { return Color("AppGrey95", bundle: .module) }
    static var appGrey: Color { return Color("AppGrey60", bundle: .module) }
    static var appDarkBlue: Color { return Color("AppBlue", bundle: .module) }

    static var appAlertInfo: Color { return Color("AppBlueAlert", bundle: .module) }
    static var appAlertTextInfo: Color { return Color("AppBlueAlertText", bundle: .module) }

    static var appWarningInfo: Color { return Color("AppYellowAlert", bundle: .module) }
    static var appWarningTextInfo: Color { return Color("AppYellowAlertText", bundle: .module) }

    static var appSuccessInfo: Color { return Color("AppGreenAlert", bundle: .module) }
    static var appSuccessTextInfo: Color { return Color("AppGreenAlertText", bundle: .module) }

    static var appErrorInfo: Color { return Color("AppRedAlert", bundle: .module) }
    static var appErrorTextInfo: Color { return Color("AppRedAlertText", bundle: .module) }
}
