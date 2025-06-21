//
//  NeedListView.swift
//  Need Tracker
//
//  Created by Timothy Lewis on 4/19/25.
//

import SwiftUI

struct NeedList {
	var name: String
	var isChecked: Bool
}

struct NeedListView: View {
	@Binding var item: NeedList

	@State var needs = [Need(title: "Example Need 1", isDone: false), Need(title: "Example Need 2", isDone: true)]

	@State private var isAddNeedDialogPresented = false

	private func presentAddNeedView() {
		isAddNeedDialogPresented.toggle()
	}

	var body: some View {
		NavigationView {
			List($needs) { $need in
				HStack {
					Text(need.title)
					Spacer()
					Image(systemName: need.isDone ? "checkmark.square.fill" : "square")
						.imageScale(.large)
						.foregroundColor(.brandPrimary)
						.font(.system(size: 22))
						.onTapGesture {
							need.isDone.toggle()
						}
				}
			}
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Button(action: presentAddNeedView) {
						Image(systemName: "plus.square.fill")
					}
				}
			}
			.sheet(isPresented: $isAddNeedDialogPresented) {
				AddNeedView { newNeed in
					needs.append(newNeed)
				}
			}
		}
	}
}

#Preview {
	NeedListView(item: .constant(NeedList(name: "15-minutes Alone Time", isChecked: false)))
}
