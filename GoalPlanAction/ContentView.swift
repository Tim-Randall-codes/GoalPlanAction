//
//  ContentView.swift
//  GoalPlanAction
//
//  Created by Tim Randall on 16/11/21.
//

import SwiftUI
import CoreData

struct BossView: View {
    @StateObject var viewChanger: ViewChanger
    @StateObject var idNumber: IntOO
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var body: some View {
        if viewChanger.num == 0 {
            TitleView(viewChanger: viewChanger)
        }
        else if viewChanger.num == 1 {
            NameView(viewChanger: viewChanger, idNumber: idNumber)
        }
        else if viewChanger.num == 2 {
            PlanView1(viewChanger: viewChanger, idNumber: idNumber)
        }
        else if viewChanger.num == 3 {
            TodayView(idNumber: idNumber, viewChanger: viewChanger)
        }
        else if viewChanger.num == 4 {
            GoalView(viewChanger: viewChanger)
        }
        else if viewChanger.num == 5 {
            CompletedView(viewChanger: viewChanger)
        }
        else if viewChanger.num == 6 {
            PlanView2(viewChanger: viewChanger)
        }
    }
}



struct TitleView: View {
    @StateObject var viewChanger: ViewChanger
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
        entity: Goal.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Goal.goal, ascending: true)]
    )var items: FetchedResults<Goal>
    let lst = ["one", "two", "three"]
    var body: some View {
        ZStack{
            if colorScheme == .dark {
                Background(topColour: Color("myPurple"), bottomColour: .black)}
            else{
                Background(topColour: .white, bottomColour: Color("myPurple"))}
            VStack{
                Title(words: "Goal, Plan, Action!").padding(10)
                HStack{
                    Spacer()
                    Button(action:{
                        viewChanger.num = 1
                    }, label:{
                        Text("Add new goal").foregroundColor(Color.black)
                            .font(.system(size: 10, weight: .bold))
                    })
                }
                    NavigationView{
                    List { ForEach(items, id: \.self) { item in
                        Text(item.goal ?? "unknown")
                            }
                        }.navigationBarTitle("")
                    .navigationBarHidden(true)
                    }
            }
        }
    }
}

    
struct NameView: View {
    @StateObject var viewChanger: ViewChanger
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
        entity: Goal.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Goal.goal, ascending: true)]
    )var items: FetchedResults<Goal>
    @State var goalEntered: String = ""
    @State var displayMessage: String = ""
    @StateObject var idNumber: IntOO
    var body: some View {
        ZStack{
            if colorScheme == .dark {
                Background(topColour: Color("myPurple"), bottomColour: .black)}
            else{
                Background(topColour: Color("myPurple"), bottomColour: .white)}
            VStack{
                Title(words: "What is your goal?")
                TextField("Enter your goal here", text:$goalEntered)
                Text(displayMessage).padding()
                Button(action:{
                    if goalEntered == "" {
                        displayMessage = "Please enter a goal"
                    }
                    else {
                        displayMessage = ""
                        createObject()
                        viewChanger.num = 2
                    }
                }, label:{
                    ButtonWidget(words: "Continue")
                })
            }
        }
    }
    func createObject () {
        let newGoal = Goal(context: managedObjectContext)
        let idNum: Int = items.count + 1
        newGoal.goal = goalEntered
        newGoal.id = Int64(idNum)
        idNumber.num = idNum
    }
}

struct PlanView1: View {
    @StateObject var viewChanger: ViewChanger
    @StateObject var idNumber: IntOO
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var thePlans = StorePlans()
    @State var userEntry: String = ""
    @State var displayMessage: String = ""
    @State var addedPlanCounter: Int = 0
    @FetchRequest(
        entity: Goal.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Goal.goal, ascending: true)]
    )var items: FetchedResults<Goal>
    var body: some View {
        ZStack{
            if colorScheme == .dark {
                Background(topColour: Color("myPurple"), bottomColour: .black)}
            else{
                Background(topColour: Color("myPurple"), bottomColour: .white)}
            ScrollView{
                VStack{
                    Title(words: "What is your plan?")
                    Text("Enter a step by step plan to achieve your goal:").padding()
                    Text(displayMessage).padding()
                    HStack{
                        TextField("Enter here", text:$userEntry).padding()
                        Button(action:{
                            if userEntry == "" {
                                displayMessage = "Please enter a plan"
                            }
                            else {
                                addedPlanCounter += 1
                                addPlans()
                                userEntry = ""
                            }
                        }, label:{
                            ButtonWidget(words: "Add")
                        })
                    }
                    EnteredPlans(plans: thePlans)
                    Button(action:{
                        items[idNumber.num].plan = thePlans.p1
                        items[idNumber.num].plan = thePlans.p2
                        items[idNumber.num].plan = thePlans.p3
                        items[idNumber.num].plan = thePlans.p4
                        items[idNumber.num].plan = thePlans.p5
                        items[idNumber.num].plan = thePlans.p6
                        items[idNumber.num].plan = thePlans.p7
                        items[idNumber.num].plan = thePlans.p8
                        items[idNumber.num].plan = thePlans.p9
                        items[idNumber.num].plan = thePlans.p10
                        globalInt = idNumber.num
                    }, label:{
                        ButtonWidget(words: "Continue")
                    })
                }
            }
        }
    }
    func addPlans () {
        if addedPlanCounter == 0 {
            displayMessage = ""
            thePlans.p1 = userEntry
        }
        else if addedPlanCounter == 1 {
            displayMessage = ""
            thePlans.p2 = userEntry
        }
        else if addedPlanCounter == 2 {
            displayMessage = ""
            thePlans.p3 = userEntry
        }
        else if addedPlanCounter == 3 {
            displayMessage = ""
            thePlans.p4 = userEntry
        }
        else if addedPlanCounter == 4 {
            displayMessage = ""
            thePlans.p5 = userEntry
        }
        else if addedPlanCounter == 5 {
            displayMessage = ""
            thePlans.p6 = userEntry
        }
        else if addedPlanCounter == 6 {
            displayMessage = ""
            thePlans.p7 = userEntry
        }
        else if addedPlanCounter == 7 {
            displayMessage = ""
            thePlans.p8 = userEntry
        }
        else if addedPlanCounter == 8 {
            displayMessage = ""
            thePlans.p9 = userEntry
        }
        else if addedPlanCounter == 9 {
            displayMessage = ""
            thePlans.p10 = userEntry
        }
        else {
            displayMessage = "Sorry you can only add ten actions"
        }
    }
}

struct EnteredPlans: View {
    var plans: StorePlans
    var body: some View {
        VStack{
            if plans.p1 != "" {
                Text(plans.p1).padding(2)
            }
            if plans.p2 != "" {
                Text(plans.p2).padding(2)
            }
            if plans.p3 != "" {
                Text(plans.p3).padding(2)
            }
            if plans.p4 != "" {
                Text(plans.p4).padding(2)
            }
            if plans.p5 != "" {
                Text(plans.p5).padding(2)
            }
            if plans.p6 != "" {
                Text(plans.p6).padding(2)
            }
            if plans.p7 != "" {
                Text(plans.p7).padding(2)
            }
            if plans.p8 != "" {
                Text(plans.p8).padding(2)
            }
            if plans.p9 != "" {
                Text(plans.p9).padding(2)
            }
            if plans.p10 != "" {
                Text(plans.p10).padding(2)
            }
        }
    }
}

struct StorePlans {
    var p1: String = ""
    var p2: String = ""
    var p3: String = ""
    var p4: String = ""
    var p5: String = ""
    var p6: String = ""
    var p7: String = ""
    var p8: String = ""
    var p9: String = ""
    var p10: String = ""
}

struct TodayView: View {
    @StateObject var idNumber: IntOO
    @StateObject var viewChanger: ViewChanger
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var userEntry: String = ""
    @FetchRequest(
        entity: Action.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Action.date, ascending: true)],
    predicate: NSPredicate(format: "id == \(globalInt)")
    )var items: FetchedResults<Action>
    var body: some View {
        ZStack{
            if colorScheme == .dark {
                Background(topColour: Color("myPurple"), bottomColour: .black)}
            else{
                Background(topColour: Color("myPurple"), bottomColour: .white)}
            VStack{
                Title(words: "What actions will you take today for your goal?")
                HStack{
                    TextField("Enter actions here", text:$userEntry)
                    Button(action:{
                        createAction()
                        userEntry = ""
                    }, label:{
                        ButtonWidget(words: "Add")
                    })
                }
                List { ForEach(items, id: \.self) { item in
                    Text(item.action ?? "unknown")
                    }
                }
            }
        }
    }
    func createAction() {
        let newAction = Action(context: managedObjectContext)
        newAction.id = Int64(idNumber.num)
        newAction.action = userEntry
        newAction.date = Date()
        newAction.completed = false
    }
}

struct GoalView: View {
    @StateObject var viewChanger: ViewChanger
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.managedObjectContext) var managedObjectContext
    var body: some View {
        ZStack{
            if colorScheme == .dark {
                Background(topColour: Color("myPurple"), bottomColour: .black)}
            else{
                Background(topColour: Color("myPurple"), bottomColour: .white)}
            VStack{
                ButtonWidget(words: "hello world")
            }
        }
    }
}

struct CompletedView: View {
    @StateObject var viewChanger: ViewChanger
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.managedObjectContext) var managedObjectContext
    var body: some View {
        ZStack{
            if colorScheme == .dark {
                Background(topColour: Color("myPurple"), bottomColour: .black)}
            else{
                Background(topColour: Color("myPurple"), bottomColour: .white)}
            VStack{
                ButtonWidget(words: "hello world")
            }
        }
    }
}

struct PlanView2: View {
    @StateObject var viewChanger: ViewChanger
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.managedObjectContext) var managedObjectContext
    var body: some View {
        ZStack{
            if colorScheme == .dark {
                Background(topColour: Color("myPurple"), bottomColour: .black)}
            else{
                Background(topColour: Color("myPurple"), bottomColour: .white)}
            VStack{
                ButtonWidget(words: "hello world")
            }
        }
    }
}

struct ButtonWidget: View {
    var words: String
    var body: some View {
        Text(words).padding()
            .font(.system(size: 18, weight: .bold, design: .default))
            .foregroundColor(.white)
            .background(Color.purple)
            .cornerRadius(30)
    }
}

struct Title: View {
    var words: String
    var body: some View {
        Text(words).padding()
            .font(.system(size: 18, weight: .bold, design: .default))
    }
}

struct Background: View {
    var topColour: Color
    var bottomColour: Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColour, bottomColour]),
                                          startPoint: .topLeading,
                                          endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BossView(viewChanger: ViewChanger(), idNumber: IntOO()).preferredColorScheme(.light)
    }
}
