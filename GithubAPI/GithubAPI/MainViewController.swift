//
//  ViewController.swift
//  GithubAPI
//
//  Created by Mehmed Muharemovic on 5/9/19.
//  Copyright © 2019 Mehmed Muharemovic. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        ServerRequestHandler.sharedInstance.getUserName { (response) in
            print(response)
        }
    }

    override func viewDidLoad() {
    
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}
