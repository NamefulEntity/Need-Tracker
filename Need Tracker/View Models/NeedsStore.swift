//
//  NeedsStore.swift
//  NeedTracker
//
//  Created by Timothy Lewis on 9/21/25.
//

import SwiftUI

@Observable
final class NeedsStore {
	@AppStorage("needsData") private var needsData: Data = Data()

	private let encoder = JSONEncoder()
	private let decoder = JSONDecoder()

	var needs: [Need] {
		get {
			guard !needsData.isEmpty,
				  let decoded = try? decoder.decode([Need].self, from: needsData)
			else { return [] }
			return decoded
		}
		set {
			needsData = (try? encoder.encode(newValue)) ?? Data()
		}
	}
}
