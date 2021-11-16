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
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var body: some View {
        if viewChanger.num == 0 {
            TitleView(viewChanger: viewChanger)
        }
        else if viewChanger.num == 1 {
            NameView(viewChanger: viewChanger)
        }
        else if viewChanger.num == 2 {
            PlanView1(viewChanger: viewChanger)
        }
        else if viewChanger.num == 3 {
            TodayView(viewChanger: viewChanger)
        }
        else if viewChanger.num == 4 {
            GoalView(viewChanger: viewChanger)
        }
        else if viewChanger.num == 5 {
            CompletedDateView(viewChanger: viewChanger)
        }
        else if viewChanger.num == 6 {
            CompletedView(viewChanger: viewChanger)
        }
        else if viewChanger.num == 7 {
            PlanView2(viewChanger: viewChanger)
        }
    }
}

struct TitleView: View {
    @StateObject var viewChanger: ViewChanger
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.managedObjectContext) var managedObjectContext
    var body: some View {
        ZStack{
            if colorScheme == .dark {
                Background(topColour: Color("myPurple"), bottomColour: .black)}
            else{
                Background(topColour: Color("myPurple"), bottomColour: .white)}
            ScrollView{
                VStack{
                    Title(words: "Goal, Plan, Action!")
                }
            }
        }
    }
}

struct NameView: View {
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

struct PlanView1: View {
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

struct TodayView: View {
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

struct CompletedDateView: View {
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
        BossView(viewChanger: ViewChanger()).preferredColorScheme(.light)
    }
}
