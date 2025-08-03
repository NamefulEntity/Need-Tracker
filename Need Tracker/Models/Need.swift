//
//  Need.swift
//  Need Tracker
//
//  Created by Timothy Lewis on 4/18/25.
//

import Foundation

	// Data Model for a Need
struct Need: Identifiable, Codable {

	var id = UUID()
	var title: String
	var isCompleted: Bool

}



