//
//  MessagingViewController.swift
//  MessagingApp
//
//  Created by Apple on 03/04/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import Firebase

class MessagingViewController: UIViewController {
    
    @IBOutlet weak var messagesTableView: UITableView!
    @IBOutlet weak var messageTypedLabel: UITextField!
    
    var messagesArray: [Messages] = [Messages(username: "teja@gmail.com", message: "Hey, whatsup?")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = IdsAndK.appName
        navigationItem.hidesBackButton = true
        messagesTableView.dataSource = self
        
        messagesTableView.register(UINib(nibName: IdsAndK.msgCellNibName, bundle: nil), forCellReuseIdentifier: IdsAndK.msgCellNibId)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        let messageEntered = messageTypedLabel.text
    }
    
    @IBAction func logOutButtonPressed(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
}

extension MessagingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IdsAndK.msgCellNibId, for: indexPath) as! TableViewCell
        cell.messageLabel?.text = messagesArray[indexPath.row].message
        return cell
    }
}
