//
//  CoredataRelationshipsBootcamp.swift
//  ContinuedLearning
//
//  Created by Malith Madhushanka on 2024-02-01.
//

import SwiftUI
import CoreData

class CoredataManager {
    static let instance = CoredataManager()
    
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        self.container = NSPersistentContainer(name: "CoredataContainer")
        container.loadPersistentStores { NSEntityDescription, error in
            if let error = error {
                print("ERROR WHEN LOADING \(error)")
            }
        }
        context = container.viewContext
    }
    
    func save() {
        do {
            try context.save()
            print("saved successfully!")
        } catch let error {
            print("ERROR SAVING \(error.localizedDescription)")
        }
    }
}

class CoredataRelationshipsViewModel: ObservableObject {
    
    let manager = CoredataManager.instance
    @Published var businesses: [BusinessEntity] = []
    
    init() {
        getBusinesses()
    }
    
    func getBusinesses() {
        let request = NSFetchRequest<BusinessEntity>(entityName: "BusinessEntity")
        do {
            businesses = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
            
    }
    
    func addBusiness() {
        let newBusiness = BusinessEntity(context: manager.context)
        newBusiness.name = "Apple"
        save()
    }
    
    func save() {
        manager.save()
    }
}

struct CoredataRelationshipsBootcamp: View {
    
    @StateObject var vm = CoredataRelationshipsViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Button(action: {
                        vm.addBusiness()
                    }, label: {
                        Text("Perform action")
                            .foregroundStyle(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.cornerRadius(20))
                    })
                }
                .padding()
            }
            .navigationTitle("Relationships")
        }
    }
}

struct BusinessView: View {
    
    let entity: BusinessEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Name: \(entity.name ?? "")")
                .bold()
        }
    }
}

#Preview {
    CoredataRelationshipsBootcamp()
}
