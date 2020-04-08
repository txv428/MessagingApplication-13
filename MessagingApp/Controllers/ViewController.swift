//
//  ViewController.swift
//  MessagingApp
//
//  Created by Apple on 02/04/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var index = 0
        
        for ch in IdsAndK.appName {
            Timer.scheduledTimer(withTimeInterval: 0.1*Double(index), repeats: false) { _ in
                self.titleLabel.text?.append(ch)
            }
            index += 1
        }
    }
    
}

