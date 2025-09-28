//
//  AddNeedView.swift
//  Need Tracker
//
//  Created by Timothy Lewis on 4/19/25.
//

import SwiftUI

struct AddNeedView: View {

	// @State properties that represent adding needs
	@Environment(\.dismiss) var dismiss
	@Binding var needs: [Need]
	@State var title = ""
	@State var isDone = false

	var body: some View {

		NavigationStack {
			Form {
				Section(header: Text("Add a need")) {
					TextField("Type need here", text: $title)
					Toggle("Is Done", isOn: $isDone)
				}
			}
			.navigationTitle("Add Need")
			.navigationBarTitleDisplayMode(.large)
			.toolbar {
				ToolbarItem(placement: .cancellationAction) {
					Button("Close") {
						dismiss()
					}
				}
				ToolbarItem(placement: .topBarTrailing) {
					Button("Add Need") {

					}
					.disabled(title.isEmpty)
				}
			}
			}
		}
	}


#Preview {
    AddNeedView(needs: .constant([]))
}
