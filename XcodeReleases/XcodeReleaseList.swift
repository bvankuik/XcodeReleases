//
//  XcodeReleaseList.swift
//  XcodeReleases
//
//  Created by bartvk on 16/08/2019.
//  Copyright © 2019 DutchVirtual. All rights reserved.
//

import SwiftUI

struct XcodeReleaseList: View {
    @ObservedObject var caller = XcodeReleasesCaller()
    var body: some View {
        List(caller.result) { xcodeRelease in
            Text(xcodeRelease.name)
//        }.onAppear {
            // This causes a fatal error somehow
//            self.caller.call()
        }
    }
}

#if DEBUG
struct XcodeReleaseList_Previews: PreviewProvider {
    static var previews: some View {
        XcodeReleaseList()
    }
}
#endif
