//
//  ServerRequestHandler.swift
//  GithubAPI
//
//  Created by Mehmed Muharemovic on 5/11/19.
//  Copyright © 2019 Mehmed Muharemovic. All rights reserved.
//

import Foundation
import Apollo
import Alamofire

class ServerRequestHandler {
    
    var graphQLEndpoint = "https://api.github.com/graphql"
    var apollo : ApolloClient?
    var viewer : Viewer?
    var commitHistory : [CommitHistoryNode] = []
    
    public static let sharedInstance : ServerRequestHandler = {
        let instance = ServerRequestHandler()
        return instance
    }()
    
    public func setApollo() {
        
        let apollo2 : ApolloClient = {
            let configuration = URLSessionConfiguration.default
            // Add additional headers as needed

            configuration.httpAdditionalHeaders = ["Authorization": "Bearer \(SecurityToken.sharedInstance.token)"] // Replace `<token>`

            let url = URL(string: graphQLEndpoint)!
            return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
        }()
        
        apollo = apollo2
    }
    
    public func getUserName(completion: @escaping (String) -> Void) {
        guard let apollo = self.apollo else {
            completion("Error")
            return
        }
        
        apollo.fetch(query: GetViewerQuery()) { (result, error) in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion("Error: \(error.localizedDescription)")
                return
            }
            
            guard let viewer = result?.data?.viewer else {
                print("Error returning information")
                return
            }
            
            self.viewer  = Viewer(dictionary: ["login" : viewer.login])
            
            completion("Success")
        }
    }
    
    func getRepositoryCommitHistory(completion: @escaping (String) -> Void) {
        
        guard let apollo = self.apollo else {
            completion("Error")
            return
        }
        
        _ = apollo.clearCache()
        
        
        apollo.fetch(query: GetRepositoryCommitHistoryQuery()) { (result, error) in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion("Error: \(error.localizedDescription)")
                return
            }
    
            guard let repository = result?.data?.repository else {
                print("Error returning information - repo")
                return
            }
            
            guard let ref = repository.ref else {
                print("Error returning information - ref")
                return
            }
            
            guard let commits = ref.target.asCommit else {
                print("Error returning information - commits")
                return
            }

            guard let edges = commits.history.edges else {
                print("Error returning information - edges")
                return
            }
            
            self.commitHistory = []
            
            for node in edges {
                if let _node = node?.node {
                    var dictionary : [String : Any] = [:]
                    dictionary["messageHeadline"] = _node.messageHeadline
                    dictionary["oid"] = _node.oid
                    dictionary["message"] = _node.message

                    if let _author = _node.author {
                        var authorDictionary : [String : Any] = [:]
                        
                        if let _name = _author.name {
                            authorDictionary["name"] = _name
                        }
                        
                        if let _date = _author.date {
                            authorDictionary["date"] = _date
                        }
                        
                        if let _email = _author.email {
                            authorDictionary["email"] = _email
                        }
                        
                        dictionary["author"] = authorDictionary
                    }
                    
                    let commitNode = CommitHistoryNode(dictionary: dictionary)
                    self.commitHistory.append(commitNode)
                }
            }
            
            completion("Success")

        }
        
    }
    
    
}
