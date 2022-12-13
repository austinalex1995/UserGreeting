//
//  NameGreetingVC.swift
//  UserGreeting
//
//  Created by Austin Alex on 3/28/22.
//

import UIKit

class NameGreetingVC: UIViewController {
    
    /*
     *
     * IBOutlet Connections
     *
     */
    
    @IBOutlet weak var oNameTF: UITextField!
    
    
    
    /*
     *
     * Member Variables
     *
     */
    
    
    
    /*
     *
     * Lifecycle Methods
     *
     */

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    /*
     *
     * Class Methods
     *
     */
    
    private func getDate() -> String {
        
        var message: String = ""
        
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        //let minutes = calendar.component(.minute, from: date)
        
        var dayOrNight: String = ""
        if (hour > 12) {
            dayOrNight = "PM"
        } else {
            dayOrNight = "AM"
        }
        
        if (hour > 0 && hour < 5 && dayOrNight == "AM") {
            message = "Good Night"
        } else if (hour > 0 && hour < 5 && dayOrNight == "PM") {
            message = "Good Afternoon"
        } else if (hour >= 5 && hour <= 12 && dayOrNight == "AM") {
            message = "Good Morning"
        } else if (hour >= 5 && hour <= 12 && dayOrNight == "PM") {
            message = "Good Evening"
        }
        
        return message
        
    }
    
    private func createDialog(message:String) {
        
        var buttonText = ""
        if (!message.isEmpty) {
            buttonText = "OK"
        } else {
            buttonText = "Thank You!"
        }
        
        let alert = UIAlertController(title: "", message: message, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: buttonText, style: .default, handler: {
            _ in
            self.oNameTF.text = ""
            alert.dismiss(animated: true, completion: nil)
        }))

        self.present(alert, animated: true)
        
    }
    
    
    
    /*
     *
     * Action Events
     *
     */
    
    @IBAction func aNextButtonClicked(_ sender: UIButton) {
        
        let testName = oNameTF.text!
        
        if (!testName.isEmpty) {
            
            createDialog(message: (getDate() + " " + testName))
            
        } else {
            
            createDialog(message: "Enter a name to continue")
            
        }
        
    }
    
}
