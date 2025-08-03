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

	@State var needList = [String]()
	@State var name: String
	var isChecked: Bool

		// *Rebuild list view with both functioning UI elements and state management*
	var body: some View {
			// List contains each item followed by a toggled checkmark box
		NavigationStack {
			List {
				ForEach(needList, id: \.self) { need in
					Text(need)

				}
			}
		}

			// Position a "Plus" button in upper right corner of the view which links navigation to AddNeedView


	}
}

#Preview {
	NeedListView(name: "Makeover", isChecked: false)
}
