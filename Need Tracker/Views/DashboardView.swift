//
//  DashboardView.swift
//  Need Tracker
//
//  Created by Timothy Lewis on 4/19/25.
//

import SwiftUI

struct DashboardView: View {

@State private var showAddNeed = false
@State private var needs: [Need] = []

	var body: some View {
		NavigationStack {
			Text("Welcome Back")
				.font(.largeTitle)
				.toolbar {
					ToolbarItem {
						Button(action: {
							showAddNeed.toggle()
						}, label: {
							Label("Add Item", systemImage: "plus")
						})
					}
				}
				.sheet(isPresented: $showAddNeed,
					   content: {
					NavigationStack {
						AddNeedView(needs: $needs)
					}
					.presentationDetents([.medium])
				})

		}


	}
}

#Preview {
	NeedListView(name: "Get a Makover")
}
