import SwiftUI

extension Color {
    static var boschBlack: Color { return Color("BoschBlack", bundle: .module) }
    static var boschLightBlue: Color { return Color("BoschBlue50", bundle: .module) }
    static var boschLightRed: Color { return Color("BoschRed50", bundle: .module) }
    static var boschLightPurple: Color { return Color("BoschPurple50", bundle: .module) }
    static var boschLightGreen: Color { return Color("BoschGreen50", bundle: .module) }
    static var boschLightGrey: Color { return Color("BoschGrey95", bundle: .module) }
    static var boschGrey: Color { return Color("BoschGrey60", bundle: .module) }
    static var boschDarkBlue: Color { return Color("BoschBlue", bundle: .module) }

    static var boschAlertInfo: Color { return Color("BoschBlueAlert", bundle: .module) }
    static var boschAlertTextInfo: Color { return Color("BoschBlueAlertText", bundle: .module) }

    static var boschWarningInfo: Color { return Color("BoschYellowAlert", bundle: .module) }
    static var boschWarningTextInfo: Color { return Color("BoschYellowAlertText", bundle: .module) }

    static var boschSuccessInfo: Color { return Color("BoschGreenAlert", bundle: .module) }
    static var boschSuccessTextInfo: Color { return Color("BoschGreenAlertText", bundle: .module) }

    static var boschErrorInfo: Color { return Color("BoschRedAlert", bundle: .module) }
    static var boschErrorTextInfo: Color { return Color("BoschRedAlertText", bundle: .module) }
}
