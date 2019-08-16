//
//  ContentView.swift
//  XcodeReleases
//
//  Created by bartvk on 15/08/2019.
//  Copyright © 2019 DutchVirtual. All rights reserved.
//

// https://xcodereleases.com/data.json

import SwiftUI
import Combine

class XcodeReleasesCaller: ObservableObject {
    var result: String = ""
    var task: URLSessionTask?
    let objectWillChange = ObservableObjectPublisher()
    
    func call() {
        let endpoint = xcodeReleases()
        self.task = URLSession.shared.load(endpoint) { localResult in
            switch localResult {
            case .success(let releases):
                if let first = releases.first {
                    self.result = first.name
                } else {
                    self.result = "No results"
                }
            case .failure(let error):
                self.result = error.localizedDescription
            }
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    
    init() {
    }
}

struct ContentView: View {
    @ObservedObject var caller = XcodeReleasesCaller()
    var body: some View {
        VStack {
            Text("Hello World")
            Text("Result = [" + caller.result + "]")
        }.onAppear {
            self.caller.call()
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
