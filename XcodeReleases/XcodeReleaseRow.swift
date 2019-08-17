//
//  XcodeReleaseRow.swift
//  XcodeReleases
//
//  Created by bartvk on 17/08/2019.
//  Copyright © 2019 DutchVirtual. All rights reserved.
//

import SwiftUI

struct XcodeReleaseRow: View {
    var xcodeRelease: XcodeRelease
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(xcodeRelease.name) \(xcodeRelease.version.number)").fontWeight(.bold)
            Text("Build \(xcodeRelease.version.build)").font(.footnote).lineLimit(1)
        }.padding(.all, 8)
    }
}
