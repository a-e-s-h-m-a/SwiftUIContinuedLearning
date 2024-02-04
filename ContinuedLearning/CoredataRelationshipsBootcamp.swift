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
    @Published var departments: [DepartmentEntity] = []
    @Published var employees: [EmployeeEntity] = []
    
    init() {
        getBusinesses()
        getDepartments()
        getEmployees()
    }
    
    func getBusinesses() {
        let request = NSFetchRequest<BusinessEntity>(entityName: "BusinessEntity")
        do {
            businesses = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
            
    }
    
    func getDepartments() {
        let request = NSFetchRequest<DepartmentEntity>(entityName: "DepartmentEntity")
        do {
            departments = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
            
    }
    
    func getEmployees() {
        let request = NSFetchRequest<EmployeeEntity>(entityName: "EmployeeEntity")
        do {
            employees = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
            
    }
    
    func addBusiness() {
        let newBusiness = BusinessEntity(context: manager.context)
        newBusiness.name = "Apple"
        
        // Add existing departments to the new business
        // newBusiness.departments = []
        
        // Add existing employees to the new business
        // newBusiness.employees = []
        
        // Add new business to the existing department
        // newBusiness.addToDepartments(DepartmentEntity)
        
        // Add new business to the existinf employee
        // newBusiness.addToEmployees(EmployeeEntity)
        
        save()
    }
    
    func addDepartment() {
        let newDepartment = DepartmentEntity(context: manager.context)
        newDepartment.name = "Marketing"
        newDepartment.businesses = [businesses[0]]
        
        save()
    }
    
    func addEmployee() {
        let newEmployee = EmployeeEntity(context: manager.context)
        newEmployee.age = 32
        newEmployee.dateJoined = Date()
        newEmployee.name = "Chris"
        
        newEmployee.business = businesses[0]
        newEmployee.department = departments[0]
        
        save()
    }
    
    func save() {
        businesses.removeAll()
        departments.removeAll()
        employees.removeAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.manager.save()
            self.getBusinesses()
            self.getDepartments()
            self.getEmployees()
        }
    }
}

struct CoredataRelationshipsBootcamp: View {
    
    @StateObject var vm = CoredataRelationshipsViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Button(action: {
                        vm.addEmployee()
                    }, label: {
                        Text("Perform action")
                            .foregroundStyle(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.cornerRadius(20))
                    })
                    
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(alignment: .top) {
                            ForEach(vm.businesses) { business in
                                BusinessView(entity: business)
                            }
                        }
                    }
                    
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(alignment: .top) {
                            ForEach(vm.departments) { department in
                                DepartmentView(entity: department)
                            }
                        }
                    }
                    
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(alignment: .top) {
                            ForEach(vm.employees) { employee in
                                EmployeeView(entity: employee)
                            }
                        }
                    }
                    
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
            
            if let departments = entity.departments?.allObjects as? [DepartmentEntity] {
                Text("Departments:")
                ForEach(departments) { department in
                    Text(department.name ?? "")
                }
            }
            
            if let employees = entity.employees?.allObjects as? [EmployeeEntity] {
                Text("Employees:")
                ForEach(employees) { employee in
                    Text(employee.name ?? "")
                }
            }
        }
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.gray.opacity(0.5))
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct DepartmentView: View {
    
    let entity: DepartmentEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Name: \(entity.name ?? "")")
                .bold()
            
            if let businesses = entity.businesses?.allObjects as? [BusinessEntity] {
                Text("Businesses:")
                ForEach(businesses) { business in
                    Text(business.name ?? "")
                }
            }
            
            if let employees = entity.employees?.allObjects as? [EmployeeEntity] {
                Text("Employees:")
                ForEach(employees) { employee in
                    Text(employee.name ?? "")
                }
            }
        }
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.green.opacity(0.5))
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct EmployeeView: View {
    
    let entity: EmployeeEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Name: \(entity.name ?? "")")
                .bold()
            Text("Age: \(entity.age)")
            Text("Date joined: \(entity.dateJoined ?? Date())")
            
            
            Text("Business:")
                .bold()
            
            Text(entity.business?.name ?? "")
            
            Text("Department:")
                .bold()
            
            Text(entity.department?.name ?? "")
        }
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.blue.opacity(0.5))
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

#Preview {
    CoredataRelationshipsBootcamp()
}
