//
//  ViewController.swift
//  09_10_2023_NavigationBackwardDemo
//
//  Created by Vishal Jagtap on 28/11/23.
//

import UIKit

class ViewController: UIViewController, BackDataPassingProtocol{

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var middleNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    var secondViewController : SecondViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func passDataToSVC(_ sender: Any) {
        secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        secondViewController!.delegateToPassData = self
        //secondViewController!.delegateToPassData = self
        self.navigationController?.pushViewController(secondViewController!, animated: true)
    }
    
    func passDataBack(student: Student) {
        self.firstNameLabel.text = student.firstName
        self.middleNameLabel.text = student.middleName
        self.lastNameLabel.text = student.lastName
    }
}
