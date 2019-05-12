//
//  Viewer.swift
//  GithubAPI
//
//  Created by Mehmed Muharemovic on 5/12/19.
//  Copyright © 2019 Mehmed Muharemovic. All rights reserved.
//

import Foundation

class Viewer {
    
    var login : String?
    
    init(dictionary : [String: Any] ) {
        self.login = (dictionary["login"].map {$0 as? String} ?? "")
    }
}
