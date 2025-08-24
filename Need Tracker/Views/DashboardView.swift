import SwiftUI

struct DashboardView: View {
	@State private var showAddNeed = false
	@StateObject private var viewModel = NeedViewModel() // Create an instance of NeedViewModel

	var body: some View {
		NavigationStack {
			Text("Welcome Back")
				.font(.largeTitle)
				.toolbar {
					ToolbarItem {
						Button(action: {
							showAddNeed.toggle()
						}, label: {
							Label("Add Need", systemImage: "plus")
						})
					}
				}
				.sheet(isPresented: $showAddNeed) {
					NavigationStack {
						AddNeedView(viewModel: viewModel) // Pass the instance of NeedViewModel
					}
					.presentationDetents([.medium])
				}
		}
	}
}

#Preview {
	DashboardView()
}
