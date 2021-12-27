//
//  classViewModel.swift
//  GPA Calculator
//
//  Created by Segun Awe on 12/26/21.
//

import Foundation


class classViewModel: ObservableObject {
    
    @Published var classArray: [classModel] = [
        classModel(id: 1, className: "STAT 100", grade: "A", credits: 3),
        classModel(id: 2, className: "INST 126", grade: "A", credits: 3),
        classModel(id: 3, className: "BMGT 110", grade: "A", credits: 3)
    
    ]
    
    
}
