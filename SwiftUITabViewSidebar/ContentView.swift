//
//  ContentView.swift
//  SwiftUITabViewSidebar
//
//  Created by Simon Nickel on 01.07.24.
//

import SwiftUI

struct ContentView: View {
	
	@State private var selection: Int = 1
	
    var body: some View {
		
		tabView
			.labelStyle(LabelStyleSidebar())
		
    }
	
	var tabView: some View {
		
		TabView(selection: $selection) {
			Tab(value: 1) {
				Text("Rectangle Content")
			} label: {
				Label {
					Text("Rectangle")
				} icon: {
					Image(systemName: "rectangle")
				}
				.labelStyle(LabelStyleSidebarElement(selected: selection == 1)) // e.g. .sidebarLabelStyle(...)
			}
			
			Tab(value: 2) {
				Text("Circle Content")
			} label: {
				Label {
					Text("Circle")
				} icon: {
					Image(systemName: "circle")
				}
				.labelStyle(LabelStyleSidebarElement(selected: selection == 2)) // e.g. .sidebarLabelStyle(...)
			}
		}
		.tabViewStyle(.sidebarAdaptable)
		.labelStyle(LabelStyleSidebar()) // e.g. .sidebarLabelStyle(...)
		.fontDesign(.monospaced)
		.tint(.green)
		
	}
	
}

struct LabelStyleSidebar: LabelStyle {

	func makeBody(configuration: Configuration) -> some View {
		Label {
			configuration.title
		} icon: {
			configuration.icon
		}
		.tint(.yellow)
	}
	
}

struct LabelStyleSidebarElement: LabelStyle {
	
	let selected: Bool
	
	func makeBody(configuration: Configuration) -> some View {
		Label {
			configuration.title
		} icon: {
			configuration.icon
		}
		.tint(selected ? .red : .orange)
	}
	
}

#Preview {
    ContentView()
}
