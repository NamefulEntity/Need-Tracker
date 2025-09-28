//
//  NeedTrackerApp.swift
//  Need Tracker
//
//  Created by Timothy Lewis on 4/18/25.
//

import SwiftUI

@main
struct NeedTrackerApp: App {
	@AppStorage("showNeeds") private var showNeeds: Bool = true

	var body: some Scene {
		WindowGroup {
			if showNeeds {
				NeedListView()
			}
		}
	}
}
