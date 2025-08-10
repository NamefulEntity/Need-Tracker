//
//  NeedViewModel.swift
//  NeedTracker
//
//  Created by Timothy Lewis on 8/10/25.
//

import SwiftUI

class NeedViewModel: ObservableObject {
	@Published var needItems: [Need] = [
		Need(title: "Go shopping", isCompleted: false),
		Need(title: "Check the mail", isCompleted: true)
	]

	func toggleCompletion(for need: Need) {
		if let index = needItems.firstIndex(where: { $0.id == need.id }) {
			needItems[index].isCompleted.toggle()
		}
	}

	//@Published var needItems: [Need] = []
	private let storageKey = "NeedItems"

	init() {
		loadItems()
	}
	func addNeedItem(title: String, isDone: Bool) {
		let newNeedItem = Need(title: title, isCompleted: isDone)
		needItems.append(newNeedItem)
		saveItems()
	}
	private func saveItems() {
		if let encoded = try? JSONEncoder().encode(needItems) {
			UserDefaults.standard.set(encoded, forKey: storageKey)
		}
	}
	private func loadItems() {
		if let data = UserDefaults.standard.data(forKey: storageKey),
		   let decoded = try? JSONDecoder().decode([Need].self, from: data	) {
			needItems = decoded
		}
	}
}
