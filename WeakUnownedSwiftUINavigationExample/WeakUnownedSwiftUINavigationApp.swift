//
//  WeakUnownedSwiftUINavigationApp.swift
//  WeakUnownedSwiftUINavigation
//
//  Created by Jason Rich Darmawan Onggo Putra on 02/08/23.
//

import SwiftUI

@main
struct WeakUnownedSwiftUINavigationApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                List {
                    NavigationLink {
                        NavigationLazyView {
                            FeatureAView()
                        }
                    } label: {
                        Text("Weak Example")
                    }

                    NavigationLink {
                        NavigationLazyView {
                            FeatureCView()
                        }
                    } label: {
                        Text("Unowned Example")
                    }
                }
            }
        }
    }
}
