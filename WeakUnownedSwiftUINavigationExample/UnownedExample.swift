//
//  UnownedExample.swift
//  SwiftUICoordinatorExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 01/08/23.
//

import SwiftUI

class FeatureDCoordinator {
    let id: UUID
    
    unowned let cCoordinator: FeatureCCoordinator
    
    init(id: UUID = UUID(), cCoordinator: FeatureCCoordinator = FeatureCCoordinator()) {
        self.id = id
        self.cCoordinator = cCoordinator
        print("\(type(of: self)) \(#function) \(id.uuidString)")
    }
    deinit { print("\(type(of: self)) \(#function) \(id.uuidString)") }
}

struct FeatureDView: View {
    let coordinator: FeatureDCoordinator
    
    init(coordinator: FeatureDCoordinator = FeatureDCoordinator()) {
        self.coordinator = coordinator
    }
    
    var body: some View {
        Text("Feature D")
    }
}

class FeatureCCoordinator {
    let id: UUID
    
    var dCoordinator: FeatureDCoordinator?
    
    init(id: UUID = UUID()) {
        self.id = id
        print("\(type(of: self)) \(#function) \(id.uuidString)")
    }
    deinit { print("\(type(of: self)) \(#function) \(id.uuidString)") }
}

struct FeatureCView: View {
    @State private var isFeatureDPresented = false
    
    let coordinator: FeatureCCoordinator
    
    init(coordinator: FeatureCCoordinator = FeatureCCoordinator()) {
        self.coordinator = coordinator
    }
    
    var body: some View {
        VStack {
            Text("Feature C")
            
            Button {
                isFeatureDPresented = true
            } label: {
                Text("Feature D")
            }
            .buttonStyle(.borderedProminent)
        }
        .navigationDestination(isPresented: $isFeatureDPresented) {
            NavigationLazyView {
                featureDView
            }
        }
    }
    
    private var featureDView: some View {
        let dCoordinator = FeatureDCoordinator(cCoordinator: coordinator)
        coordinator.dCoordinator = dCoordinator
        return FeatureDView(coordinator: dCoordinator)
    }
}
