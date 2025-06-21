//
//  Need.swift
//  Need Tracker
//
//  Created by Timothy Lewis on 4/18/25.
//

import SwiftUI

	// Data Model for a Need
struct Need: Identifiable {

	let id = UUID()
	var title: String
	var isDone: Bool

	init(id: UUID = .init(), title: String, isDone: Bool = false) {
		
		self.title = title
		self.isDone = isDone
	}
}

extension Need {
	static let samples = [
		Need(title: "Shop for Groceries", isDone: true),
		Need(title: "Wind down around 8PM"),
		Need(title: "Disconnect from Erin"),
		Need(title: "Start exercise program")
	]
}

