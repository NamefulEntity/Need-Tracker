//
//  NeedViewModel.swift
//  NeedTracker
//
//  Created by Timothy Lewis on 8/10/25.
//

import SwiftUI

// Assumes there is a model type `Need` conforming to Codable & Identifiable/Equatable with init(title:isCompleted:)
final class NeedViewModel: ObservableObject {
    @Published private(set) var needItems: [Need] = []
    private let storageKey = "needItems.v1"

    init() {
        load()
    }

    func addNeed(title: String) {
        let trimmed = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        // Provide required isCompleted parameter (default to false for new items)
        needItems.append(Need(title: trimmed, isCompleted: false))
        save()
    }

    func toggleCompletion(for need: Need) {
        if let index = needItems.firstIndex(where: { $0.id == need.id }) {
            needItems[index].isCompleted.toggle()
            save()
        }
    }

    func delete(at offsets: IndexSet) {
        needItems.remove(atOffsets: offsets)
        save()
    }
}

// MARK: - Persistence
private extension NeedViewModel {
    func save() {
        do {
            let data = try JSONEncoder().encode(needItems)
            UserDefaults.standard.set(data, forKey: storageKey)
        } catch {
            // Consider logging error
        }
    }

    func load() {
        guard let data = UserDefaults.standard.data(forKey: storageKey) else { return }
        do {
            needItems = try JSONDecoder().decode([Need].self, from: data)
        } catch {
            // If decoding fails, reset to empty or handle migration
            needItems = []
        }
    }
}
