//
//  text+Extension.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 7/8/21.
//

import Foundation
import SwiftUI

extension Text {
    
    func withPrimaryTextStyle() -> some View {
        return self
        .padding(10)
        .foregroundColor(Color.white)
        .background(Color("Color1"))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
    }
    
    func withSecondaryTextStyle() -> some View {
        return self
            .padding(10)
        .foregroundColor(Color.black)
        .background(Color(#colorLiteral(red: 0.9607525468, green: 0.9647365212, blue: 0.9802598357, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
    }
    
}

