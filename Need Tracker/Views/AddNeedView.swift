import SwiftUI

struct AddNeedView: View {
	@Environment(\.dismiss) var dismiss
	@Binding var need: [Need]
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
						addNeedIfPossible()
					}
					.disabled(title.isEmpty)
				}
			}
		}
	}

	func addNeedIfPossible() {
		guard !title.isEmpty else { return }
		need.append(Need(title: title, isCompleted: isDone))
		dismiss()
	}
}

struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State private var value: Value
    private let content: (Binding<Value>) -> Content
    init(_ initialValue: Value, @ViewBuilder content: @escaping (Binding<Value>) -> Content) {
        _value = State(initialValue: initialValue)
        self.content = content
    }
    var body: some View { content($value) }
}

#Preview {
	NavigationStack {
		StatefulPreviewWrapper(Need.samples) { binding in
			AddNeedView(need: binding)
		}
	}
}
