//
//  XcodeReleasesCaller.swift
//  XcodeReleases
//
//  Created by bartvk on 16/08/2019.
//  Copyright © 2019 DutchVirtual. All rights reserved.
//

import Foundation
import Combine

class XcodeReleasesCaller: ObservableObject {
    var result: XcodeReleases = []
    var error: Error?
    var task: URLSessionTask?
    let objectWillChange = ObservableObjectPublisher()
    let useLocalData = true
    
    func call() {
        self.error = nil
        return self.useLocalData ? self.localCall() : self.remoteCall()
    }
    
    private func localCall() {
        guard let localURL = Bundle.main.resourceURL?.appendingPathComponent("localtestdata.json") else {
            fatalError("Error in local URL")
        }
        
        guard let fileExists = try? localURL.checkResourceIsReachable(), fileExists else {
            fatalError("Local data does not exist")
        }

        let releases: XcodeReleases
        do {
            let localData = try Data(contentsOf: localURL)
            releases = try JSONDecoder().decode(XcodeReleases.self, from: localData)
        } catch {
            fatalError("Error creating data from local URL:\n" + error.localizedDescription)
        }
        
        if releases.first != nil {
            self.result = releases
        }
        self.objectWillChange.send()
    }
    
    private func remoteCall() {
        let endpoint = xcodeReleases()
        self.task = URLSession.shared.load(endpoint) { localResult in
            switch localResult {
            case .success(let releases):
                if releases.first != nil {
                    self.result = releases
                }
            case .failure(let error):
                self.error = error
            }
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    
    init() {
    }
}
