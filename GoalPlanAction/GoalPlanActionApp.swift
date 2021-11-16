//
//  GoalPlanActionApp.swift
//  GoalPlanAction
//
//  Created by Tim Randall on 16/11/21.
//

import SwiftUI
import CoreData

@main
struct GoalPlanActionApp: App {
    @StateObject var viewChanger = ViewChanger()
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            BossView(viewChanger: viewChanger).environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

class ViewChanger: ObservableObject {
    @Published var num: Int = 0
}
