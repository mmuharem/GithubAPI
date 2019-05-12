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
    
}
