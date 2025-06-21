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
	var description: String = ""
	var category: NeedCategory
	var tasks: [Task] = []
}

	// Categories that a need can belong to
enum NeedCategory: String, CaseIterable, Identifiable {
	case physical = "Physical"
	case emotional = "Emotional"
	case social = "Social"
	case career = "Career"

	var id: String { self.rawValue }
}

	// Data Model for a Task associated with a need
struct Task: Identifiable {
	let id = UUID()
	var title: String
	var isCompleted: Bool = false
}
