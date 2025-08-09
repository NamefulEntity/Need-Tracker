	//
	//  NeedListView.swift
	//  Need Tracker
	//
	//  Created by Timothy Lewis on 4/19/25.
	//

import SwiftUI




struct NeedListView: View {
		// Decide which structure properties to use for the build

		// Setup the state variables for updating the list
	@State private var needs = Need.samples
	@State var need = [String]()
	@State var name: String
	var isCompleted = false

		// *Rebuild list view with both functioning UI elements and state management*
	var body: some View {
			// List contains each item followed by a toggled checkmark box
		NavigationStack {
			List {
				ForEach($needs) { $need in
					HStack {
						Image(systemName: need.isCompleted ? "largecircle.fill.circle" : "circle")
							.imageScale(.large)
							.foregroundColor(.accentColor)
							.onTapGesture {
								need.isCompleted.toggle()
								
							}
						Text(need.title)
							.padding(.horizontal)
					}


				}
			}
			.listStyle(.plain)
		}
		.navigationBarTitle("My Needs")

			// Position a "Plus" button in upper right corner of the view which links navigation to AddNeedView


	}
}

#Preview {
	NeedListView(name: "Makeover", isCompleted: false)
}
