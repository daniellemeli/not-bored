//
//  Service.swift
//  NotBored
//
//  Created by Danielle Nozaki Ogawa on 06/09/22.
//

import Foundation


class Service {
    let session = URLSession.shared
    let decoder = JSONDecoder()
    
    func loadRandomActivity(participants: Int, completion: @escaping (Activity) -> Void){
        
        let participantsString = String(participants)

        
        let url = "http://www.boredapi.com/api/activity/" + "?participants=" + participantsString
        
        let urlApi = URL(string: url)!
        
        let task = session.dataTask(with: urlApi) { data, url, error in
            if let error = error {
                print(error)
            }
            
            guard let data = data else { return }
            do {
                let activity = try self.decoder.decode(Activity.self, from: data)
                completion(activity)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    
    func loadActivity(participants: Int, activity: String, completion: @escaping (Activity) -> Void){
        
        let participantsString = String(participants)

        let url = "http://www.boredapi.com/api/activity/" + "?participants=" + participantsString + "&type=" + activity

        let urlApi = URL(string: url)!
    
        let task = session.dataTask(with: urlApi) { data, url, error in
            if let error = error {
                print(error)
            }
            
            guard let data = data else { return }
            do {
                let activity = try self.decoder.decode(Activity.self, from: data)
                completion(activity)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
