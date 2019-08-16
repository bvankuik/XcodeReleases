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
    let clang: [CompilerVersion]
    let swift: [CompilerVersion]
}

struct CompilerVersion: Codable {
    let number: String
    let build: String
    let release: Release
}

struct XcodeRelease: Codable, Identifiable {
    var id: UUID {
        return UUID()  // TODO replace this by parsing version in the JSON, and return that
    }
    let name: String
    let requires: String
    let compilers: Compilers
    let date: ReleaseDateComponents
    let links: Links
}

struct Links: Codable {
    let notes: URLParent
    let download: URLParent
}

struct URLParent: Codable {
    let url: String
}

struct Version: Codable {
    let number: String
    let build: String
    let release: Release
}

struct Release: Codable {
    let beta: Int?
    let gm: Bool?
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
