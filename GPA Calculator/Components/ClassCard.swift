//
//  ClassCard.swift
//  GPA Calculator
//
//  Created by Segun Awe on 12/26/21.
//

import SwiftUI

struct ClassCard: View {
    @Environment(\.colorScheme) var colorScheme
    var name: String
    var grade: String
    var credit: Int16
    
    var body: some View {
        VStack {
        Text(name)
                .foregroundColor(.primary)
            HStack {
                Text("Grade: \(grade)")
                Spacer()
                Text("Credit: \(credit) ")
            }
        }.frame(width: 335)
            .padding()
            .background(colorScheme == .light ? Color.white.opacity(0.4) : Color.gray.opacity(0.1))
            .cornerRadius(10)
    }
}

struct ClassCard_Previews: PreviewProvider {
    static var previews: some View {
        ClassCard(name: "STAT 100", grade: "A", credit: 3)
    }
}
