//
//  SecurityToken.swift
//  GithubAPI
//
//  Created by Mehmed Muharemovic on 5/12/19.
//  Copyright © 2019 Mehmed Muharemovic. All rights reserved.
//

import Foundation

class SecurityToken {
    let token = "INSERT_TOKEN_HERE"
    
    public static let sharedInstance : SecurityToken = {
        let instance = SecurityToken()
        return instance
    }()
}
