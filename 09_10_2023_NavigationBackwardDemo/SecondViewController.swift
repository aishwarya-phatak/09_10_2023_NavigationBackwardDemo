//
//  SecondViewController.swift
//  09_10_2023_NavigationBackwardDemo
//
//  Created by Vishal Jagtap on 29/11/23.
//

import UIKit

//step 1 : Write a protocol to pass data back
protocol BackDataPassingProtocol{
    func passDataBack(student : Student)
}

class SecondViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var middleNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    //step 2 : Create a property of that protocol - called as delegate
    var delegateToPassData : BackDataPassingProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
    
    
    @IBAction func btnClick(_ sender: Any) {
        
        guard let delegatePassData = delegateToPassData else { return }
        
        let retrivedFirstName = self.firstNameTextField.text
        let retrivedMiddleName = self.middleNameTextField.text
        let retrivedLastName = self.lastNameTextField.text
        
        let student = Student(
            firstName: retrivedFirstName ?? "Aditya",
            middleName: retrivedMiddleName ?? "Rajendra",
            lastName: retrivedLastName ?? "Chodhary")
        
        //step 3 : pass the data of Student by using function
        delegatePassData.passDataBack(student: student)
        
        self.navigationController?.popViewController(animated: true)
    }
}
