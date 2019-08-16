//
//  ContentView.swift
//  XcodeReleases
//
//  Created by bartvk on 15/08/2019.
//  Copyright © 2019 DutchVirtual. All rights reserved.
//

// https://xcodereleases.com/data.json

import SwiftUI

struct ContentView: View {
    var body: some View {
        XcodeReleaseList()
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
