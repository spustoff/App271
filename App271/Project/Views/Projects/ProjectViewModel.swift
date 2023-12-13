//
//  ProjectViewModel.swift
//  App271
//
//  Created by IGOR on 06/12/2023.
//

import SwiftUI
import CoreData
import Alamofire

final class ProjectViewModel: ObservableObject {

    @Published var projTitle = ""
    @Published var projProgress = ""
    @Published var projBudget = ""

    @Published var isAddBudget: Bool = false
    @Published var isDetailBudget: Bool = false
    @Published var isGraph: Bool = false
    
    @Published var percents: [String] = ["20%", "50%", "80%", "100%"]
    @Published var currentPercent = ""

    @Published var addBudget = ""
    
    @Published var stages: [String] = ["Base", "Walls", "Roof", "Decor"]
    @Published var currentStage = ""
    
    @Published var biuldings: [BuildingModel] = []
    
    @AppStorage("proje") var proje: [String] = []
    @AppStorage("projeSaved") var projeSaved: [String] = []
    @AppStorage("SelectedProje") var SelectedProje = ""
    @Published var currentProje = ""
    @AppStorage("totalBudget") var totalBudget: Int = 0
    
    func addBuilding(selectedProje: String, completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "BuildingModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let sub = NSEntityDescription.insertNewObject(forEntityName: "BuildingModel", into: context) as! BuildingModel
        
        sub.projTitle = projTitle
        sub.projProgress = Int16(Int(projProgress) ?? 0)
        sub.projBudget = Int16(Int(projBudget) ?? 0)
        sub.itemID = Int16.random(in: 1...4329)
        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
    
    func fetchBuildings() {
        
        CoreDataStack.shared.modelName = "BuildingModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<BuildingModel>(entityName: "BuildingModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.biuldings = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.biuldings = []
        }
    }

    
    func favoritesManager(_ sproj: String) {
        
        if projeSaved.contains(sproj) {
            
            if let indexer = projeSaved.firstIndex(of: sproj) {
                
                projeSaved.remove(at: indexer)
            }
            
        } else {
            
            projeSaved.append(sproj)

        }
    }
    
    func isFavorited(_ sproj: String) -> Bool {
        
        return projeSaved.contains(sproj) ? true : false
    }
}
