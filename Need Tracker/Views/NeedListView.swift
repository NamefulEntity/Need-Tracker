import SwiftUI

struct NeedListView: View {
	@State private var needs: [Need] = []
	@State private var showAddNeed = false

	var body: some View {
		NavigationStack {
			VStack {
					// Title
				Text("My Needs")
					.font(.largeTitle.bold())
					.padding(.top, 20)

					// List of needs
				List {
					ForEach(needs) { need in
						HStack {
							Text(need.title)
							Spacer()
							Image(systemName: need.isCompleted ? "largecircle.fill.circle" : "circle")
								.imageScale(.large)
								.foregroundColor(.accentColor)
								.onTapGesture {
									if let index = needs.firstIndex(where: { $0.id == need.id }) {
										needs[index].isCompleted.toggle()
									}
								}
						}
					}
					.onDelete { offsets in
						needs.remove(atOffsets: offsets)
					}
				}
			}
			.onAppear {
				if needs.isEmpty { needs = Need.samples }
			}
			.toolbar {
					// "+" button
				ToolbarItem(placement: .topBarTrailing) {
					Button {
						showAddNeed = true
					} label: {
						Image(systemName: "plus.circle.fill")
							.font(.title2)
					}
				}
			}
				// Present AddNeedView
			.sheet(isPresented: $showAddNeed) {
				AddNeedView(need: $needs)
			}
		}
	}
}

#Preview {
	NeedListView()
}
