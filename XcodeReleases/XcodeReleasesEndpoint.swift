//
//  XcodeReleasesEndpoint.swift
//  XcodeReleases
//
//  Created by bartvk on 15/08/2019.
//  Copyright © 2019 DutchVirtual. All rights reserved.
//

import Foundation
import TinyNetworking

struct XcodeRelease: Codable {
    let name: String
}

func xcodeReleases() -> Endpoint<Array<XcodeRelease>> {
    return Endpoint(json: .get, url: URL(string: "https://xcodereleases.com/data.json")!)
}
