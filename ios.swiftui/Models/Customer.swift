//
//  Cliente.swift
//  ios.swiftui
//
//  Created by Harold Jose Barros Gonçalves on 19/07/20.
//  Copyright © 2020 Harold Jose Barros Gonçalves. All rights reserved.
//

import Foundation

struct Customer: Codable,Identifiable {
    var id: String
    var Name: String
    var Phone: String
    var CPF: String
    var Birthdate: String
    var Gender: String
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            id = try values.decode(String.self, forKey: .id)
        } catch {
            id = ""
            print("Unexpected Id error: \(error)")
        }
        
        do {
            Name = try values.decode(String.self, forKey: .Name)
        } catch {
            Name = ""
            print("Unexpected Name error: \(error)")
        }
        
        do {
            Phone = try values.decode(String.self, forKey: .Phone)
        } catch {
            Phone = ""
            print("Unexpected Phone error: \(error)")
        }
        
        do {
            CPF = try values.decode(String.self, forKey: .CPF)
        } catch {
            CPF = ""
            print("Unexpected CPF error: \(error)")
        }
        
        do {
            Birthdate = try values.decode(String.self, forKey: .Birthdate)
        } catch {
            Birthdate = ""
            print("Unexpected Birthdate error: \(error)")
        }
        
        
        do {
            Gender = try values.decode(String.self, forKey: .Gender)
        } catch {
            Gender = ""
            print("Unexpected Gender error: \(error)")
        }
        
    }
    
    init( id: String,
          Name: String,
          Phone: String,
          CPF: String,
          Birthdate: String,
          Gender: String)  {
        
        self.id = id
        self.Name = Name
        self.Phone = Phone
        self.CPF = CPF
        self.Birthdate = Birthdate
        self.Gender = Gender
        
    }
    
    
    func getBirthdate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let birthdateFormat = dateFormatter.date(from:Birthdate)!
        return birthdateFormat
    }
    
    
    func getYears() -> String {
        if (Birthdate.isEmpty){
            return ""
        }
        
        let birthdate = getBirthdate()
        
        if (birthdate == nil) {
             return ""
        }
        
        
        return String(yearsBetweenDate(startDate: birthdate, endDate: Date()))
    }
    
    
    private func yearsBetweenDate(startDate: Date?, endDate: Date?) -> Int {
        
        if (startDate == nil || endDate == nil) {
            return 0
        }
        
        let calendar = Calendar.current
        
        let components = calendar.dateComponents([.year], from: startDate!, to: endDate!)
        
        return components.year!
    }
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case Name = "name"
        case Phone = "Phone"
        case CPF = "CPF"
        case Birthdate = "Birthdate"
        case Gender = "Gender"
    }
    
    
    func Validate() -> ValidationResult {
        var result = ValidationResult()
        
        if (self.Name.isEmpty) {
            result.Errors.append((key: "Name", message: "Nome deve ser informado!"))
        }
        
        if (self.Phone.isEmpty) {
            result.Errors.append((key: "Phone", message: "Telefone deve ser informado!"))
        }
        
        if (self.CPF.isEmpty) {
            result.Errors.append((key: "CPF", message: "CPF deve ser informado!"))
        }
        
        if (self.Birthdate.isEmpty){
            result.Errors.append((key: "CPF", message: "Nascimento deve ser informado!"))
        }
        
        return result
    }
    
    
    
}
