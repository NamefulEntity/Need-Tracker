//
//  Need.swift
//  Need Tracker
//
//  Created by Timothy Lewis on 4/18/25.
//

import Foundation

	// Data Model for a Need
struct Need: Identifiable {

	let id = UUID()
	var title: String
	var isCompleted = false

}

extension Need {
	static let samples = [
		Need(title: "Go to Gym", isCompleted: true),
		Need(title: "Prioritize sleep"),
		Need(title: "Shop grocery list"),
		Need(title: "Empty dishwasher"),
	]
}

