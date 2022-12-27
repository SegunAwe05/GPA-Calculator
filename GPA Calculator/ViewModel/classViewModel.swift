//
//  classViewModel.swift
//  GPA Calculator
//
//  Created by Segun Awe on 12/26/21.
//

import Foundation
import CoreData

class classViewModel: ObservableObject {
    @Published var savedClasses: [ClassEntity] = []
    @Published var gpa = 0.0
    var gpaDict = ["A+" : 4.0, "A" : 4.0, "A-":3.7, "B+": 3.3, "B" : 3.0, "B-" : 2.7, "C+" : 2.3, "C" : 2.0, "C-" : 1.7, "D+" : 1.3, "D" : 1.0, "D-" : 0.7, "F" : 0]
    let container:  NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "CoreData")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading data \(error)")
            }
        }
        fetchClassData()
    }
    
    func fetchClassData() {
        let request = NSFetchRequest<ClassEntity>(entityName: "ClassEntity")
        
        do {
            savedClasses = try container.viewContext.fetch(request)
        } catch let error {
            print("error fetching \(error)")
        }
    }
    
    
    func addClasses(name: String, letterGrade: String, creditNum: Int16) {
        let entity = ClassEntity(context: container.viewContext)
        entity.courseName = name
        entity.classGrade = letterGrade
        entity.classCredits = creditNum
        saveData()
    }
    
    func calculateGPA() {
        var gradePoints: [Double] = []
        var creditCount = savedClasses.map{$0.classCredits}.reduce(0, +)
        
        // taking out credits for the "P" classes
        for i in savedClasses {
            if i.classGrade == "P" {
            creditCount = creditCount - i.classCredits
                gpa = gradePoints.reduce(0, +) / Double(creditCount)
            }
        }
        
        //looping throught our classes and dict to make calculations
        for i in savedClasses {
            for (key, val) in gpaDict {
                if i.classGrade == key {
                    let total = Double(i.classCredits) * val
                    gradePoints.append(total)
                }
            }
        }
        gpa = gradePoints.reduce(0, +) / Double(creditCount)
        print(creditCount)
        
    }
    
    func listSwipeDelete(indexSet: IndexSet) {
            guard let index = indexSet.first else {return}
            let entity = savedClasses[index]
            container.viewContext.delete(entity)
            saveData()
            calculateGPA()
        }
   
    
    func saveData() {
          do {
              try container.viewContext.save()
              fetchClassData()
          } catch let error {
              print("error saving \(error)")
          }
      }
    
    
}



extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

extension Double {
    var round:String {
        return String(format: "%.2f", self)
    }
}
