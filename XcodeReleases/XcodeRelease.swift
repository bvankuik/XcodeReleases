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
    let clang: [Version]?
    let swift: [Version]?
    let llvm: [Version]?
    let llvm_gcc: [Version]?
    let gcc: [Version]?
}

struct XcodeRelease: Codable, Identifiable {
    var id: String {
        return version.id
    }
    let name: String
    let version: Version
    let requires: String
    let compilers: Compilers?
    let date: ReleaseDateComponents
    let links: Links?
    let sdks: SDKs?
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
    let download: URLParent?
    let notes: URLParent?
}

struct URLParent: Codable {
    let url: String
}

struct Version: Codable, Identifiable {
    var id: String {
        if let number = self.number {
            return "v\(number)b\(self.build)"
        } else {
            return "b\(self.build)"
        }
    }
    let number: String?
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

struct SDKs: Codable {
    let macOS: [Version]?
    let tvOS: [Version]?
    let iOS: [Version]?
    let watchOS: [Version]?
}
