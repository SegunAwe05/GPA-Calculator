//
//  ClassModel.swift
//  GPA Calculator
//
//  Created by Segun Awe on 12/26/21.
//

import Foundation

struct classModel: Identifiable, Hashable {
    var id: Int
    var className: String
    var grade: String
    var credits: Int
}
