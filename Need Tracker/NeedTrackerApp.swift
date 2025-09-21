//
//  NeedTrackerApp.swift
//  Need Tracker
//
//  Created by Timothy Lewis on 4/18/25.
//

import SwiftUI

@main
struct NeedTrackerApp: App {
    @State private var needs: [Need] = []

    var body: some Scene {
		WindowGroup {
			NeedListView(needs: $needs)
		}
    }
}
