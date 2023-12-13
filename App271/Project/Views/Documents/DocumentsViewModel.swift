//
//  DocumentsViewModel.swift
//  App271
//
//  Created by IGOR on 07/12/2023.
//

import SwiftUI
import Amplitude
import CoreData

final class DocumentsViewModel: ObservableObject {

    @AppStorage("proje") var proje: [String] = []
    @Published var currentProje = ""
    @AppStorage("totalBudget") var totalBudget: Int = 0
    @Published var documents: [DocumentsModel] = []
    @Published var selectedDoc = ""
    @Published var docTitle = ""
    @Published var docDescription = ""
    @Published var isAdd: Bool = false
    @Published var isAdd2: Bool = false
    
    func addDoc(selectedProje: String, completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "DocumentsModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let sub = NSEntityDescription.insertNewObject(forEntityName: "DocumentsModel", into: context) as! DocumentsModel
        
        sub.docTitle = docTitle
        sub.docDescription = docDescription
        sub.selectedProje = selectedProje
        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
    
    func fetchDoc() {
        
        CoreDataStack.shared.modelName = "DocumentsModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<DocumentsModel>(entityName: "DocumentsModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.documents = branch.filter{$0.selectedProje == currentProje}
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.documents = []
        }
    }
}
