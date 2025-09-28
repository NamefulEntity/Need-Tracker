import SwiftUI

struct NeedListView: View {
	private static let needsStorageKey = "needslist"
	@AppStorage(Self.needsStorageKey) private var needsData: Data = Data()
	@State private var needsList: [Need] = []
	@State private var showAddNeed = false

	var body: some View {
		NavigationStack {
			VStack {
				Text("My Needs")
					.font(.largeTitle.bold())
					.padding(.top, 20)

				List {
					ForEach(needsList) { need in
						HStack {
							Text(need.title)
							Spacer()
							Image(systemName: need.isCompleted ? "largecircle.fill.circle" : "circle")
								.imageScale(.large)
								.foregroundColor(.accentColor)
								.onTapGesture {
									if let index = needsList.firstIndex(where: { $0.id == need.id }) {
										needsList[index].isCompleted.toggle()
										saveNeeds()
									}
								}
						}
					}
					.onDelete { offsets in
						needsList.remove(atOffsets: offsets)
						saveNeeds()
					}
				}
			}
			.onAppear {
				loadNeeds()
			}
			.onChange(of: needsList, initial: true) { oldValue, newValue in
				saveNeeds()
			}
			.toolbar {
				ToolbarItem(placement: .topBarTrailing) {
					Button {
						showAddNeed = true
					} label: {
						Image(systemName: "plus.circle.fill")
							.font(.title2)
					}
				}
			}
			.sheet(isPresented: $showAddNeed) {
				AddNeedView(needs: $needsList)
			}
		}
	}

	// MARK: - Persistence
	private func loadNeeds() {
		if let decoded = try? JSONDecoder().decode([Need].self, from: needsData), !decoded.isEmpty {
			needsList = decoded
		} else {
			needsList = Need.samples
			saveNeeds()
		}
	}

	private func saveNeeds() {
		if let data = try? JSONEncoder().encode(needsList) {
			needsData = data
		}
	}
}

#Preview {
	NeedListView()
}
