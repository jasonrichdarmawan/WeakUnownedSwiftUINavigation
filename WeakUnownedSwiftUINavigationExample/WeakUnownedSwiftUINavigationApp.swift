//
//  WeakUnownedSwiftUINavigationApp.swift
//  WeakUnownedSwiftUINavigation
//
//  Created by Jason Rich Darmawan Onggo Putra on 02/08/23.
//

import SwiftUI

@main
struct WeakUnownedSwiftUINavigationApp: App {
    @State private var isFeatureAPresented = false
    
    @State private var isFeatureCPresented = false
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                List {
                    Button {
                        isFeatureAPresented = true
                    } label: {
                        Text("Weak Example")
                    }
                    
                    Button {
                        isFeatureCPresented = true
                    } label: {
                        Text("Unowned Example")
                    }
                }
                .navigationDestination(isPresented: $isFeatureAPresented) {
                    NavigationLazyView {
                        FeatureAView()
                    }
                }
                .navigationDestination(isPresented: $isFeatureCPresented) {
                    NavigationLazyView {
                        FeatureCView()
                    }
                }
            }
        }
    }
}
