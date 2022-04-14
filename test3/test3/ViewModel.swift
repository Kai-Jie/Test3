//
//  ViewModel.swift
//  test3
//
//  Created by Neo Hsu on 2022/4/14.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var testModel:[Model] = []
    let apiServer = APIService.shareInstance
    
    init()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(testHandler), name:Notification.Name(rawValue:"TestNotificationName"), object:apiServer)
        
        loadData()
    }

    private func loadData()
    {
        apiServer.webAPI()
    }
    
    @objc func testHandler(_ notification: Notification) {
        DispatchQueue.main.async {
            self.testModel.append(Model())
        }
    }
}
