//
//  AddNeedView.swift
//  Need Tracker
//
//  Created by Timothy Lewis on 4/19/25.
//

import SwiftUI

struct AddNeedView: View {

	@State private var need = Need(title:"")



	@State private var newNeedTitle: String = ""
	@State private var isDone: Bool = false


	var body: some View {
		NavigationStack {

			Form {
					TextField("Add Need", text: $newNeedTitle)
					Toggle("Is Done", isOn: $isDone)
				}
			.toolbar {
				ToolbarItem(placement: .confirmationAction) {
					Button(action: {}) {
						Text("Add Need")
					}
				}
			}

		}
	}
}






#Preview {
	AddNeedView()
}

