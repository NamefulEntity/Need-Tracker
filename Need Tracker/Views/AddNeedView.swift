import SwiftUI

struct AddNeedView: View {
	@Environment(\.dismiss) var dismiss
	@ObservedObject var viewModel: NeedViewModel

	@State private var title = ""
	@State private var isDone = false

	private func saveNeedItem() {
		_ = Need(title: title, isCompleted: false)

	}

	var body: some View {
		VStack(spacing: 20) {
				// Close Button
			HStack {
				Button("Close") {
					dismiss()
				}
				.padding(.leading)
				Spacer()
			}

				// TextField and Add Button
			HStack {
				TextField("Enter item title", text: $title)
					.textFieldStyle(RoundedBorderTextFieldStyle())
					.onSubmit {
						saveNeedItem()
					}
				Button("Add Need") {
					guard !title.isEmpty else { return }
					viewModel.addNeedItem(title: title, isDone: isDone)
					dismiss()
				}
				.padding(.horizontal)
			}

				// Toggle
			Toggle("Is Done", isOn: $isDone)
				.padding(.horizontal)

			Spacer()
		}
	}
}

#Preview {
	AddNeedView(viewModel: NeedViewModel())
}
