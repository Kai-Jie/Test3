//
//  APIService.swift
//  test3
//
//  Created by Neo Hsu on 2022/4/14.
//

import Foundation

protocol APIServiceType {
    func webAPI()
}

class APIService: APIServiceType
{
    static let shareInstance = APIService()
    
    func webAPI()
    {
        let url = URL(string: "https://google.com.tw")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            NotificationCenter.default.post(name:Notification.Name(rawValue:"TestNotificationName"),object: self)
        }.resume()
    }
}
