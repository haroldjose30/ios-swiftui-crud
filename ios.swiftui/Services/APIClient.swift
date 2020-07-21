//
//  APIClient.swift
//  ios.swiftui
//
//  Created by Harold Jose Barros Gonçalves on 20/07/20.
//  Copyright © 2020 Harold Jose Barros Gonçalves. All rights reserved.
//

import Foundation
import Combine

enum APIEndpoint {
    static let baseUrl = URL(string: "https://5f162bbba346a00016738b4e.mockapi.io/")!
    static let apiClient = APIClient()
    
    enum APIResources: String {
        case customers = "customers"
    }
}

extension APIEndpoint {
    static func resourceURL(resource:APIResources) -> URL {
        return baseUrl.appendingPathComponent(resource.rawValue)
    }
}


struct APIClient {
    
    struct Response<T> {
        let value: T
        let response: URLResponse
    }
    
    func run<T: Decodable>(_ request: URLRequest) -> AnyPublisher<Response<T>, Error> {
        
        //forDebug(request.url!)
        
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap {
                result -> Response<T> in
                let value = try JSONDecoder().decode(T.self, from: result.data)
                return Response(value: value, response: result.response)
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
    
    //usado apenas para debugar as requsicoes
    private func forDebug(url:URL){
        
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            // Check the response
            print(response)
            
            let strData = String(data: data!, encoding: String.Encoding.utf8)
            print("Body: \(strData)")
            
            
            // Check if an error occured
            if error != nil {
                // HERE you can manage the error
                print(error)
                return
            }
            
            // Serialize the data into an object
            do {
                let json = try JSONDecoder().decode([Customer].self, from: data! )
                //try JSONSerialization.jsonObject(with: data!, options: [])
                print(json)
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
            
        })
        task.resume()
    }
}


