//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Swapnil on 26/07/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        saveEmployeeDetail()
        getEmployeeData()
    }

    func saveEmployeeDetail() {
        let employee = Employee(context: PersistentStorage.shared.context)
        employee.name = "Swapnil"
        PersistentStorage.shared.saveContext()
    }

    func getEmployeeData() {
        let directory = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask)
        debugPrint(directory[0])
        do {
            let result = try PersistentStorage.shared.context.fetch(Employee.fetchRequest())
            result.forEach { debugPrint($0.name)}
        } catch let error {
            debugPrint(error)
        }
    }
}

