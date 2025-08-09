//
//  AddNeedView.swift
//  Need Tracker
//
//  Created by Timothy Lewis on 4/19/25.
//

import SwiftUI

struct AddNeedView: View {

	// @State properties that represent adding needs
	@State private var need: String = ""
	@State private var isDone: Bool = false

	var body: some View {

// Textfield for inputing a need
		NavigationStack {
			Form {
				Section(header: Text("Add a need")) {
					TextField("Type need here", text: $need)
						// Toggle to mark "Is Done"
					Toggle("Is Done", isOn: $isDone)
				}
					// Button labeled "Add Need". How do we place it in the upper right corner? 
				Button {

				} label: {
					Text("Add Need")
				}
			}
		}
// Position close button in upper left



			}
		}



#Preview {
	AddNeedView()
}

