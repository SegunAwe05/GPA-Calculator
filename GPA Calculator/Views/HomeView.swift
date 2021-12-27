//
//  HomeView.swift
//  GPA Calculator
//
//  Created by Segun Awe on 12/26/21.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = classViewModel()
    
    var body: some View {
        ZStack {
            Color("Phoric").edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                Text("Your GPA is:")
                    .foregroundColor(.primary)
                    .font(.title)
                    .fontWeight(.medium)
                    .padding(.trailing, 225)
                Text("\(3.174)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(10)
                Text("You have \(44) credits")
                    .foregroundColor(.secondary)
                    .font(.subheadline)
                    .padding(.trailing, 247)
                Divider()
                List {
                    ForEach(vm.classArray) { value in
                        ClassCard(name: value.className, grade: value.grade, credit: value.credits)
                    }.listRowBackground(Color("Phoric"))
                        .listRowSeparator(.hidden)
                }.listStyle(PlainListStyle())
                    
                
                Spacer()
            }.padding(.top, 20)
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
