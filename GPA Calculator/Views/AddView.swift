//
//  AddView.swift
//  GPA Calculator
//
//  Created by Segun Awe on 12/26/21.
//

import SwiftUI

struct AddView: View {
    @State var className = ""
    @State var grade = ""
    @State var num = ""
    @State var credits: Int16 = 0
    @State var notDone = false
    @ObservedObject var vm: classViewModel
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Color("Phoric").edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
            
            VStack(spacing: 30) {
                if notDone {
                VStack {
                    Text("Complete all text fields!")
                        .foregroundColor(.red)
                        .font(.title3)
                        .fontWeight(.medium)
                }.padding(.top)
                }
                Spacer().frame(height: 30)
                Text("Add Class Information")
                    .foregroundColor(.primary)
                    .font(.title)
                    .fontWeight(.medium)
              
                Group {
                TextField("Enter Class", text: $className)
                    .foregroundColor(.primary)
                    .frame(width: 250, height: 40)
                    .padding(5)
                    .background(colorScheme == .light ? Color.white.opacity(0.4) : Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .multilineTextAlignment(.center)
                
                TextField("Enter Grade", text: $grade)
                    .foregroundColor(.primary)
                    .frame(width: 200, height: 40)
                    .padding(5)
                    .background(colorScheme == .light ? Color.white.opacity(0.4) : Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .multilineTextAlignment(.center)
                TextField("Class Credits", text: $num)
                    .foregroundColor(.primary)
                    .frame(width: 200, height: 40)
                    .padding(5)
                    .background(colorScheme == .light ? Color.white.opacity(0.4) : Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .multilineTextAlignment(.center)
                    .keyboardType(.decimalPad)
                }
                
                Button {
                    if className.isEmpty || grade.isEmpty || num.isEmpty {
                        notDone = true
                    } else {
                        credits = Int16(num)!
                        vm.addClasses(name: className, letterGrade: grade, creditNum: credits)
                        className = ""
                        grade = ""
                        num = ""
                        notDone = false
                        vm.calculateGPA()
                    }
                    
                } label: {
                    Text("Add Class")
                        .foregroundColor(Color("Phoric"))
                        .frame(width: 180)
                        .padding()
                        .background(Color.primary)
                        .cornerRadius(20)
                }


                Spacer()
                Spacer()
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(vm: classViewModel())
    }
}
