//
//  RegisterViewController.swift
//  MessagingApp
//
//  Created by Apple on 03/04/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailIDLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        if let emailID = emailIDLabel.text, let passwordVal = passwordLabel.text {
            Auth.auth().createUser(withEmail: emailID, password: passwordVal) { authResult, error in
                // if authentication is not done
                if let err = error {
                    let alert = UIAlertController(title: "Invalid Registration", message: err.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
                        print(err.localizedDescription)
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
                else {
                    // navigate to messaging view controller
                    self.performSegue(withIdentifier: IdsAndK.registerSegue, sender: self)
                }
            }
        }
    }
}
