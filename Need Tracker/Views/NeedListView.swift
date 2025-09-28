//
//  NeedListView.swift
//  Need Tracker
//
//  Created by Timothy Lewis on 4/19/25.
//

import SwiftUI

struct NeedListView: View {
    // Setup the state variables for updating the list
    @State private var needs = Need.samples
    @State var name: String
	@State private var showAddNeed = false


    // Rebuilt list view with both functioning UI elements and state management
    var body: some View {
        NavigationStack {
            VStack {
                // Title
                Text("My Needs")
                    .font(.largeTitle.bold())
                    .padding(.top, 20)

                // List of needs
                List {
                    ForEach(needs.indices, id: \.self) { index in
                        HStack {
                            Text(needs[index].title)
                            Spacer()
                            Button {
                                needs[index].isCompleted.toggle()
                            } label: {
                                Image(systemName: needs[index].isCompleted ? "largecircle.fill.circle" : "circle")
                                    .imageScale(.large)
                                    .foregroundColor(.accentColor)
                            }
                        }
                    }
                }
            }
        }
		.toolbar {
				// "+" button
			ToolbarItem(placement: .topBarTrailing) {
				Button {
					showAddNeed = true
				} label: {
					Image(systemName: "plus.circle.fill")
						.font(.title2)
				}
			}
		}
			// Present AddNeedView
		.sheet(isPresented: $showAddNeed) {
			AddNeedView(needs: $needs)
		}
	}
}

#Preview {
    NeedListView(name: "Makeover")
}

