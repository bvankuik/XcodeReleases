# XcodeReleases app

SwiftUI app that parses the JSON from xcodereleases.com. Please visit them and donate!

This app is a little playground for experimenting with SwiftUI.

To do:
* Remove useLocalData bool, make it so that we parse locally first, but then
  retrieve latest data from network
* Fix weird crash when using onAppear
* Add spinner when loading remote JSON
* Add pull-to-refresh
* For iPad, make list/detail work like UISplitViewController
* Add SDKs to details screen
* Rename XcodeReleasesCaller into something sane
* Remove nsDate from XcodeRelease struct, instead custom parse the components
  straight away
* Add searchbar to main screen
* Remove weird URLParent struct and flatten result of JSON parsing
* Make grid view for iPad
* Don't return nil in the struct SDKs, instead return empty array
* Collapse the Compilers struct into a dictionary?
* Filter for GMs and beta's
* Add link and thanks to XcodeReleases.com
* Make screen to read release notes
* Make it work on macOS
* On macOS, make download link work
