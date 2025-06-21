//
//  AddNeedView.swift
//  Need Tracker
//
//  Created by Timothy Lewis on 4/19/25.
//

import SwiftUI

struct AddNeedView: View {


	@State private var title: String = ""
	@State private var description: String = ""
	@State private var selectedCategory: NeedCategory = .physical

    var body: some View {
		Form {
			Section(header: Text("Need Details")) {
				TextField("Title", text: $title)
				TextField("Description", text: $description)
				Picker("Category", selection: $selectedCategory) {
					ForEach(NeedCategory.allCases) { category in
						Text(category.rawValue).tag(category)
					}
				}
			}
			Button("Save") {
				viewModel.addNeed(title: title, description: description, category: selectedCategory)
				presentationMode.wrappedValue.dismiss()
			}
		}
		.navigationTitle("Add New Need")
    }
}

#Preview {
    AddNeedView()
}
