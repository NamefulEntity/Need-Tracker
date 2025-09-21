import SwiftUI

struct NeedListView: View {
    @Binding var needs: [Need]
    @State private var showAddNeed = false
    private static let needsStorageKey = "needs.storage.v1"

    // Persisted raw data
    @AppStorage(Self.needsStorageKey) private var needsData: Data = Data()

    // Public binding to make this view still usable where it's currently called
    // If you're already passing a binding in previews or parents, you can keep that API,
    // or migrate to making NeedListView the source of truth. Below is an approach
    // that keeps your current API while persisting locally.
    init(needs: Binding<[Need]>) {
        self._needs = needs
    }

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
                                        saveNeedsToStorage(needs)
                                    }
                                }
                        }
                    }
                    .onDelete { offsets in
                        deleteNeeds(at: offsets)
                    }
                }
            }
            .onAppear {
                loadNeedsFromStorageIfNeeded()
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
                AddNeedView(needs: $needs)
            }
        }
    }

    // MARK: - Persistence

    private func loadNeedsFromStorageIfNeeded() {
        // If we have needs already (e.g., passed from parent), prefer those but persist them.
        if !needs.isEmpty {
            saveNeedsToStorage(needs)
            return
        }

        // Try decode from AppStorage
        if let decoded = try? JSONDecoder().decode([Need].self, from: needsData), !decoded.isEmpty {
            needs = decoded
        } else {
            // Seed samples if storage is empty
            if needs.isEmpty {
                needs = Need.samples
                saveNeedsToStorage(needs)
            }
        }
    }

    private func saveNeedsToStorage(_ value: [Need]) {
        if let data = try? JSONEncoder().encode(value) {
            needsData = data
        }
    }

    // MARK: - Mutations

    private func toggleCompletion(for need: Need) {
        if let index = needs.firstIndex(where: { $0.id == need.id }) {
            needs[index].isCompleted.toggle()
            saveNeedsToStorage(needs)
        }
    }

    private func deleteNeeds(at offsets: IndexSet) {
        needs.remove(atOffsets: offsets)
        saveNeedsToStorage(needs)
    }
}

#Preview {
    NeedListView(needs: .constant(Need.samples))
}
