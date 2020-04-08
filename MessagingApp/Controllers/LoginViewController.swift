//
//  LoginViewController.swift
//  MessagingApp
//
//  Created by Apple on 03/04/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailIDEntered: UITextField!
    @IBOutlet weak var passwordEntered: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // LoginToMessaging
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        let emailID = emailIDEntered.text
        let passwordVal = passwordEntered.text
        
        if let email = emailID, let password = passwordVal {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                guard let strongSelf = self else { return }
                if let err = error {
                    let alert = UIAlertController(title: "Invalid Login", message: err.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
                        print(err.localizedDescription)
                    }))
                    strongSelf.present(alert, animated: true, completion: nil)
                }
                else {
                    strongSelf.performSegue(withIdentifier: IdsAndK.loginSegue, sender: self)
                }
            }
        }
    }
}
