//
//  Starships.swift
//  DZ STARSHIPS
//
//  Created by BK on 13.03.2024.
//

import Foundation
import Alamofire

class Starships {
    
    static let shared = Starships()
    
    
    func getCharacters(completion: @escaping (StarshipsResponse?) -> Void) {
        let url = URL(string: "https://swapi.py4e.com/api/starships/")!
        
        AF.request(url).response { response in
            
            print(response.response?.statusCode)
            
            if let data = response.data {
                let decoder = JSONDecoder()
                do {
                    let character = try decoder.decode(StarshipsResponse.self, from: data)
                    completion(character)
                }catch {
                    completion(nil)
                }
            }
        }
    }
}

struct StarshipsResponse: Codable {
    var results: [StarshipsCharacter]
}

struct StarshipsCharacter: Codable {
    var name: String
    var model: String
    var max_atmosphering_speed: String
}

