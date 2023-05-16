import Foundation
import UIKit

class WebService {
    static func getEvents(completion: @escaping ([EventModel]?) -> Void) {
        
        if let url = URL(string: "http://5f5a8f24d44d640016169133.mockapi.io/api/events") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let error = error {
                    print(error.localizedDescription)
                    completion(nil)
                } else if let data = data {
                    let event = try? JSONDecoder().decode([EventModel].self, from: data)
                    completion(event)
                }
            }.resume()
        } else {
            completion(nil)
        }
    }
}
