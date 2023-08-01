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
    let coordinator: FeatureCCoordinator
    
    init(coordinator: FeatureCCoordinator = FeatureCCoordinator()) {
        self.coordinator = coordinator
    }
    
    var body: some View {
        VStack {
            Text("Feature C")
            
            NavigationLink {
                NavigationLazyView {
                    featureDView
                }
            } label: {
                Text("Feature D")
            }
            .buttonStyle(.borderedProminent)
        }
    }
    
    private var featureDView: some View {
        let dCoordinator = FeatureDCoordinator(cCoordinator: coordinator)
        coordinator.dCoordinator = dCoordinator
        return FeatureDView(coordinator: dCoordinator)
    }
}

struct UnownedExample: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    NavigationLazyView {
                        FeatureCView()
                    }
                } label: {
                    Text("Feature C")
                }
            }
        }
    }
}

struct UnownedExample_Previews: PreviewProvider {
    static var previews: some View {
        UnownedExample()
    }
}
