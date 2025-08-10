//
//  UserInput.swift
//  NeedTracker
//
//  Created by Timothy Lewis on 8/10/25.
//

import Foundation
import SwiftUI

struct UserInput: Codable, Identifiable {
	var id = UUID()
	var text: String
}
