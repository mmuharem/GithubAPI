//
//  CommitHistoryNode.swift
//  GithubAPI
//
//  Created by Mehmed Muharemovic on 5/12/19.
//  Copyright © 2019 Mehmed Muharemovic. All rights reserved.
//

import Foundation

class CommitHistoryNode {
    
    var messageHeadline : String?
    var oid: String?
    var message : String?
    var author : Author?
    
    init(dictionary : [String: Any] ) {
        self.messageHeadline = (dictionary["messageHeadline"].map {$0 as? String} ?? "")
        self.oid = (dictionary["oid"].map {$0 as? String} ?? "")
        self.message = (dictionary["message"].map {$0 as? String} ?? "")

        if let tempAuthor = dictionary["author"] as? [String: Any] {
            self.author = Author(dictionary: tempAuthor)
        }
    }
    
}

class Author {
    
    var name: String?
    var email: String?
    var date : String?
    
    init(dictionary : [String: Any] ) {
        self.name = (dictionary["name"].map {$0 as? String} ?? "")
        self.email = (dictionary["email"].map {$0 as? String} ?? "")
        self.date = (dictionary["date"].map {$0 as? String} ?? "")
    }
}
