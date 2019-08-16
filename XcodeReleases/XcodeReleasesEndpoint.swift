//
//  XcodeReleasesEndpoint.swift
//  XcodeReleases
//
//  Created by bartvk on 15/08/2019.
//  Copyright © 2019 DutchVirtual. All rights reserved.
//

import Foundation
import TinyNetworking

typealias XcodeReleases = Array<XcodeRelease>

func xcodeReleases() -> Endpoint<XcodeReleases> {
    guard let remoteURL = URL(string: "https://xcodereleases.com/data.json") else {
        fatalError("Error in URL")
    }
    
    let endpoint = Endpoint<XcodeReleases>(json: .get, url: remoteURL)
    return endpoint
}
