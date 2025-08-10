import SwiftUI

struct NeedListView: View {
	@StateObject private var viewModel = NeedViewModel()

	var body: some View {
		NavigationStack {
			List {
				ForEach(viewModel.needItems) { need in
					HStack {
						Text(need.title)
						Spacer()
						Image(systemName: need.isCompleted ? "largecircle.fill.circle" : "circle")
							.imageScale(.large)
							.foregroundColor(.accentColor)
							.onTapGesture {
								viewModel.toggleCompletion(for: need)
							}
					}
				}
			}
			.listStyle(.plain)
			.navigationTitle("My Needs")
		}
	}
}

#Preview {
	NeedListView()
}
