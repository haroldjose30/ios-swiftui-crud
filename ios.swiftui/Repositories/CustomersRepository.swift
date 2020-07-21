//
//  CustomersRepository.swift
//  ios.swiftui
//
//  Created by Harold Jose Barros Gonçalves on 21/07/20.
//  Copyright © 2020 Harold Jose Barros Gonçalves. All rights reserved.
//
import Foundation
import Combine

class CustomersRepository:ICustomersRepository {
    //todo: injetar o APIClient, verificar como fazer
    
    
    //configura o endpoint completo
    let resourceURL:URL = APIEndpoint.resourceURL(resource: APIEndpoint.APIResources.customers)
    
    /**
     Retorna todos os clientes cadastrado da API
     */
    func getAll() -> AnyPublisher<[Customer], Error>{
        guard let components = URLComponents(url: resourceURL, resolvingAgainstBaseURL: true) else { fatalError("Couldn't create URLComponents") }
        
        let request = URLRequest(url: components.url!)
        
        let result:AnyPublisher<[Customer], Error> =  APIEndpoint.apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
        
        return result
    }
    
    
    func get( identifier:String ) -> Customer?{
        //TODO: Pendente de implementacao
        return nil
    }
    
    
    
    /**
     Inclui um cliente novo
     */
    func create( customer:Customer ) -> ValidationResult {
        
        
        let validationResult = customer.Validate()
        if (!validationResult.IsValid) {
            return validationResult;
        }
        
        
       //TODO: evoluir o APIEndpoint.apiClient.run(request) para aceitar httpPost e retornar um Observable<Bool> para que possa ser utilizado como estado de um loading ou algo do tipo
        
      
        let session = URLSession.shared
       
        var request = URLRequest(url: resourceURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
       
        do {
             let jsonData = try JSONEncoder().encode(customer)
            
            let task = session.uploadTask(with: request, from: jsonData) { data, response, error in
                      //todo: tratar quando houver erro de requisicao
                   }
                   task.resume()
            
        } catch  {
            var result = ValidationResult()
            result.Errors.append((key: "Encoder", message: "Erro encoder"))
            return result
        }
        
        return ValidationResult()
    }
    
    func update( customer:Customer ) -> ValidationResult {
        //TODO: Pendente de implementacao
        return ValidationResult()
    }
    
    func delete( customer:Customer ) -> ValidationResult {
        //TODO: Pendente de implementacao
        return ValidationResult()
    }
}
