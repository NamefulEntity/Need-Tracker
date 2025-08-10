//
//  Need.swift
//  Need Tracker
//
//  Created by Timothy Lewis on 4/18/25.
//

import Foundation

	// Data Model for a Need
struct Need: Codable, Identifiable {

	var id = UUID()
	var title: String
	var isCompleted: Bool

}

extension Need {
	static let samples = [
		Need(title: "Go to Gym", isCompleted: true),
		Need(title: "Prioritize sleep", isCompleted: false),
		Need(title: "Shop grocery list", isCompleted: false),
		Need(title: "Empty dishwasher", isCompleted: false),
	]
}

