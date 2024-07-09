//
//  NetworkManager.swift
//  euro2024app
//
//  Created by Damir Rakhmatullin on 9.07.24.
//

import Foundation

class NetworkManager {
    let sessionConfiguration = URLSessionConfiguration.default
    let session = URLSession.shared
    let decoder = JSONDecoder()
    
    func getInfoFromJSON(completion: @escaping (Welcome) -> Void) {
        
        guard let url = URL(string: "https://raw.githubusercontent.com/openfootball/euro.json/master/2024/euro.json") else {return}
        
        
        session.dataTask(with: url) {[weak self] data, response, error in
            guard let strongSelf = self else {return}
            if error == nil, let parsData = data {
                guard let posts = try? strongSelf.decoder.decode(Welcome.self, from: parsData) else {
                    return
                }
//                print(posts.rounds.first)
                DispatchQueue.main.async {
                    completion(posts)
                }
                
            } else {
                print("Error")
            }
        }.resume()
         
//        let url = NSURLConnection("")
    }
}
