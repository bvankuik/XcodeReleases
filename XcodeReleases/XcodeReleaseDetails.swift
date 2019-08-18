//
//  XcodeReleaseDetails.swift
//  XcodeReleases
//
//  Created by bartvk on 17/08/2019.
//  Copyright © 2019 DutchVirtual. All rights reserved.
//

import SwiftUI

struct XcodeReleaseDetails: View {
    var xcodeRelease: XcodeRelease
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        if let date = xcodeRelease.nsDate {
            return formatter.string(from: date)
        } else {
            return "(Unknown)"
        }
    }
    var body: some View {
        List {
            HStack {
                Text("Version").fontWeight(.bold)
                Spacer()
                Text(xcodeRelease.version.number ?? "").frame(alignment: .trailing)
            }
            HStack {
                Text("Release").fontWeight(.bold)
                Spacer()
                Text(xcodeRelease.version.release.description)
            }
            HStack {
                Text("Build").fontWeight(.bold)
                Spacer()
                Text(xcodeRelease.version.build)
            }
            HStack {
                Text("Released").fontWeight(.bold)
                Spacer()
                Text(self.formattedDate)
            }
            HStack {
                Text("Requires").fontWeight(.bold)
                Spacer()
                Text(xcodeRelease.requires)
            }
            HStack {
                Text("macOS SDKs").fontWeight(.bold)
                Spacer()
                VStack {
                    ForEach(xcodeRelease.sdks?.macOS ?? []) { version in
                        Text(version.build)
                    }
                }
            }
            HStack {
                Text("Download").fontWeight(.bold)
                Spacer()
                Text(xcodeRelease.links?.download?.url ?? "").lineLimit(0)
            }
            HStack {
                Text("Release Notes").fontWeight(.bold)
                Spacer()
                Text(xcodeRelease.links?.notes?.url ?? "").lineLimit(0)
            }
        }
        .navigationBarTitle(Text("Release Details"), displayMode: .large)
    }
}
