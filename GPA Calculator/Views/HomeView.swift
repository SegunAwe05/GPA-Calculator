//
//  HomeView.swift
//  GPA Calculator
//
//  Created by Segun Awe on 12/26/21.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = classViewModel()
    @State var addButton = false
    @State var searchText = ""
    
    func dismissKey() {
           UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
       }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Phoric").edgesIgnoringSafeArea(.all)
                VStack(spacing: 20) {
                    Text("Your GPA is:")
                        .foregroundColor(.primary)
                        .font(.title)
                        .fontWeight(.medium)
                        .padding(.trailing, 225)
                    Text("\(vm.gpa.round)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .padding(10)
                    Text("You have \(vm.savedClasses.map{$0.classCredits}.reduce(0, +)) credits")
                        .foregroundColor(.secondary)
                        .font(.subheadline)
                        .padding(.trailing, 247)
                    Divider()
                    SearchBar(text: $searchText)
                        .padding(7)
                    List {
                        ForEach(vm.savedClasses.filter({($0.courseName?.localizedCaseInsensitiveContains(searchText))! || searchText.isEmpty })) { value in
                            ClassCard(name: value.courseName ?? "NA", grade: value.classGrade ?? "NA", credit: value.classCredits)
                        }.onDelete(perform: vm.listSwipeDelete)
                            .listRowBackground(Color("Phoric"))
                            .listRowSeparator(.hidden)
                        
                    }
                    .scrollContentBackground(.hidden)
                    .scrollIndicators(.hidden)
                    
                    Spacer()
                        
                }.padding(.top, 20)
                
                // the button
                VStack{
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            addButton.toggle()
                        } label: {
                            Image(systemName: "plus")
                                .foregroundColor(Color("Phoric"))
                                .font(.system(size: 35))
                        }.padding(8)
                            .background(Color.primary)
                            .clipShape(Circle())
                    }.padding(.trailing, 25)
                }.padding(.bottom, 20)
                
                
                    .sheet(isPresented: $addButton, content: {
                        AddView(vm: vm)
                    })
                
            }.navigationBarTitle("")
                .navigationBarHidden(true)
                .onAppear {
                    vm.calculateGPA()
                }
                .onTapGesture {
                    dismissKey()
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
