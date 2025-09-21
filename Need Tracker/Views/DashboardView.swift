import SwiftUI

struct DashboardView: View {
	@State private var showAddNeed = false
	@State private var need: [Need] = []

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
						AddNeedView(needs: $need)
					}
					.presentationDetents([.medium])
				}
		}
	}
}

#Preview {
	DashboardView()
}
