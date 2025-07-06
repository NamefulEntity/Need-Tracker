//
//  Need.swift
//  Need Tracker
//
//  Created by Timothy Lewis on 4/18/25.
//

import SwiftUI

	// Data Model for a Need
struct Need: Identifiable {

	var id = UUID()
	var title: String
	var isCompleted: Bool

}



