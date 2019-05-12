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
    
    @IBOutlet var mainUserLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        ServerRequestHandler.sharedInstance.getUserName { (response) in
            guard let viewer = ServerRequestHandler.sharedInstance.viewer?.login else {
                return
            }
            
            self.mainUserLabel.text = "\(viewer) Commit History"
        }
    }

    override func viewDidLoad() {
    
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}
