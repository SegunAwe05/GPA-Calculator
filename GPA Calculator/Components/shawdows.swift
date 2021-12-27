//
//  shawdows.swift
//  GPA Calculator
//
//  Created by Segun Awe on 12/26/21.
//

import Foundation
import SwiftUI


struct BarShadowsLight: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
            .shadow(color: Color.white.opacity(0.4), radius: 10, x: -5, y: -5)
        
    }
}

struct BarShadowsDark: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color("DarkShadow"), radius: 10, x: -10, y: -10)
            .shadow(color: Color("DarkShadow2"), radius: 10, x: 10, y: 10)
        
    }
}
