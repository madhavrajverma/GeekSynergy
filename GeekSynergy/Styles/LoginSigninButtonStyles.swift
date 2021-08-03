//
//  LoginSigninButtonStyles.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 7/8/21.
//

import Foundation
import SwiftUI

struct ButtonBackgroundStyle: ButtonStyle {

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(12)
            .foregroundColor(.white)
            .background(Color("Color1").opacity(configuration.isPressed ? 0.5 : 1))
            .cornerRadius(10)
            .shadow(radius: 1)
    }
}
