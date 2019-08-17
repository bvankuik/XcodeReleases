//
//  XcodeRelease.swift
//  XcodeReleases
//
//  Created by bartvk on 16/08/2019.
//  Copyright © 2019 DutchVirtual. All rights reserved.
//

import Foundation
import SwiftUI

struct Compilers: Codable {
    let clang: [Version]
    let swift: [Version]
}

struct XcodeRelease: Codable, Identifiable {
    var id: String {
        return version.id
    }
    let name: String
    let version: Version
    let requires: String
    let compilers: Compilers
    let date: ReleaseDateComponents
    let links: Links
    var nsDate: Date? {
        var components = DateComponents()
        components.day = self.date.day
        components.month = self.date.month
        components.year = self.date.year
        let nsDate = Calendar.current.date(from: components)
        return nsDate
    }
}

struct Links: Codable {
    let notes: URLParent
    let download: URLParent
}

struct URLParent: Codable {
    let url: String
}

struct Version: Codable, Identifiable {
    var id: String {
        return "v\(self.number)b\(self.build)"
    }
    let number: String
    let build: String
    let release: Release
}

struct Release: Codable, CustomStringConvertible {
    var description: String {
        if let beta = self.beta {
            return "Beta \(beta)"
        } else if let gm = self.gm, gm == true {
            return "GM"
        } else if let gmSeed = self.gmSeed {
            return "GM Seed \(gmSeed)"
        } else {
            return "(Unknown)"
        }
    }
    
    let beta: Int?
    let gm: Bool?
    let gmSeed: Int?
}

struct ReleaseDateComponents: Codable {
    let day: Int
    let month: Int
    let year: Int
}

struct SDK: Codable {
    let macOS: [SDKVersion]
    let tvOS: [SDKVersion]
    let iOS: [SDKVersion]
    let watchOS: [SDKVersion]
}

struct SDKVersion: Codable {
    let number: String
    let build: String
    let release: Release
}
