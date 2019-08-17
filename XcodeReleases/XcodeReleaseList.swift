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
        NavigationView {
            List(caller.result) { xcodeRelease in
                NavigationLink(destination: XcodeReleaseDetails(xcodeRelease: xcodeRelease)) {
                    XcodeReleaseRow(xcodeRelease: xcodeRelease)
                }
            }.onAppear {
                // This causes a fatal error somehow
                //self.caller.call()
            }
            .navigationBarTitle(Text("Releases"), displayMode: .large)
        .navigationBarItems(trailing:
            Button(action: {
                self.caller.call()
            }) {
                Text("Load")
            })
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
