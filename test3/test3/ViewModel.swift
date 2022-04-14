//
//  ViewModel.swift
//  test3
//
//  Created by Neo Hsu on 2022/4/14.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var testModel:[Model] = []
    let apiServer: APIServiceType
    init(apiServer: APIServiceType = APIService.shareInstance)
    {
        self.apiServer = apiServer
        NotificationCenter.default.addObserver(self, selector: #selector(testHandler), name:Notification.Name(rawValue:"TestNotificationName"), object:apiServer)
        
        loadData()
    }

    private func loadData()
    {
        apiServer.webAPI()
    }
    
    @objc func testHandler(_ notification: Notification) {
        guaranteeMainThread {
            self.testModel.append(Model())
        }
    }
}

private func guaranteeMainThread(_ work: @escaping ()->()) {
    if Thread.isMainThread {
        work()
    } else {
        DispatchQueue.main.async {
            work()
        }
    }
}
