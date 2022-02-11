//
//  APIManager .swift
//  AnotherWeatehr
//
//  Created by Nikita on 15.12.2021.
//

import Foundation

class APIManager {

    enum APIErrors: Error {
        case noData
        case invalidURL
        case undefined
    }
    
    func getSomeCity(for cityName: String, _ completion: @escaping ((Result<Weather,APIErrors>) -> Void)) {
        
    
        let  urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=20a8058f6371f19dce68507fe0c9199a"

         guard let url = URL(string: urlString) else {
            return completion(.failure(.invalidURL))
            
         }

         URLSession.shared.dataTask(with: url) { (data, response, error) in
             if error != nil {
                return completion(.failure(.undefined))
             }
             
             guard let data = data else {
                return completion(.failure(.noData))
                
             }
             
             do {
                let currentModel = try JSONDecoder().decode(Weather.self, from: data)
                completion(.success(currentModel))
                
             } catch {
                 completion(.failure(.undefined))
             }
         }.resume()

    }
}
