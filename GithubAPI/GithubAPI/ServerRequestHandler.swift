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
    let token : String = "9bab9420cad7ce8525c9da58793f915cd5bcbb8b" //client secret - should be hidden
    var apollo : ApolloClient?
    
    public static let sharedInstance : ServerRequestHandler = {
        let instance = ServerRequestHandler()
        return instance
    }()
//
//    var apollo: ApolloClient = {
//        let configuration = URLSessionConfiguration.default
//
//        let url = URL(string: graphQLEndpoint)!
//
//        return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
//    }()
    
    public func setApollo() {
        
        print("Setting apollo with token: \(token)")
        
        let apollo2 : ApolloClient = {
            let configuration = URLSessionConfiguration.default
            // Add additional headers as needed

            configuration.httpAdditionalHeaders = ["Authorization": "Bearer \(token)"] // Replace `<token>`

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
            dump(result)
        }
    }
    
}
