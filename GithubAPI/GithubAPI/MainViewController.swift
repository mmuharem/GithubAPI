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
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(self.handleRefresh),
                                 for: UIControl.Event.valueChanged)
        return refreshControl
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        setupView()
    }

    override func viewDidLoad() {
    
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupTable()
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        self.setupView()
        refreshControl.endRefreshing()
    }
    
    func setupView() {
        ServerRequestHandler.sharedInstance.getUserName { (response) in
            guard let viewer = ServerRequestHandler.sharedInstance.viewer?.login else {
                return
            }
            
            self.mainUserLabel.text = "\(viewer) Commit History"
            
            ServerRequestHandler.sharedInstance.getRepositoryCommitHistory(completion: { (response) in
                self.tableView.reloadData()
            })
        }
    }


}

extension MainViewController : UITableViewDelegate, UITableViewDataSource {
    
    func setupTable() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.tableFooterView = UIView()
        
        self.tableView.estimatedRowHeight = 200
        self.tableView.rowHeight = 200
        
        self.tableView.addSubview(refreshControl)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("did select row: \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ServerRequestHandler.sharedInstance.commitHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let commitHistory = ServerRequestHandler.sharedInstance.commitHistory[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommitHistoryTableViewCell") as! CommitHistoryTableViewCell
        
        cell.commitHistory = commitHistory
        
        return cell
    }
}

class CommitHistoryTableViewCell : UITableViewCell {
    
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var commitHashLabel: UILabel!
    @IBOutlet var commitMessage: UILabel!
    
    var commitHistory : CommitHistoryNode! {
        didSet {
            commitHashLabel.text = commitHistory.oid ?? ""
            commitMessage.text = commitHistory.message ?? ""
            authorLabel.text = commitHistory.author?.name ?? ""
        }
    }
}
