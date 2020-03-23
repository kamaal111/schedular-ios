/*:
 
 # Home Screen
 
 ## Things to imaging
 
 - This screen is part of a tab bar. It should be the first tab with name `Schedule` and with the system image (from sf symbols `archivebox`.
 - Reminders and Calendar Events cards should be some kind of grey when in dark mode and white with a shadow in light mode
 
*/

import SwiftUI
import PlaygroundSupport

let appColor: Color = .green

struct Reminder: Identifiable {
    let id: UUID
    var task: String
    var dueDate: Date?
}

struct CalendarEvent: Identifiable {
    let id: UUID
    var event: String
    var startTime: Date
    var endTime: Date
}

let reminders = [
    Reminder(id: UUID(), task: "Walk the dog"),
    Reminder(id: UUID(), task: "Do groceries"),
    Reminder(id: UUID(), task: "Go to the gym")
]

let calendarEvents = [
    CalendarEvent(
        id: UUID(),
        event: "Go to meeting 1",
        startTime: Calendar.current.date(bySettingHour: 9, minute: 0, second: 0, of: Date()) ?? Date(),
        endTime: Calendar.current.date(bySettingHour: 10, minute: 0, second: 0, of: Date()) ?? Date()),
    CalendarEvent(
        id: UUID(),
        event: "Go to meeting 2",
        startTime: Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: Date()) ?? Date(),
        endTime: Calendar.current.date(bySettingHour: 13, minute: 0, second: 0, of: Date()) ?? Date()),
    CalendarEvent(
        id: UUID(),
        event: "Go to meeting 3",
        startTime: Calendar.current.date(bySettingHour: 15, minute: 0, second: 0, of: Date()) ?? Date(),
        endTime: Calendar.current.date(bySettingHour: 16, minute: 0, second: 0, of: Date()) ?? Date()),
]

struct ContentView: View {
    @State private var checkedReminders = [String]()

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Today")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .padding(.horizontal, 16)
                    Spacer()
                }
                .padding(.top, 16)
                VStack {
                    HStack {
                        Text("Reminders")
                            .font(.system(size: 20))
                        Spacer()
                    }
                    ForEach(reminders, id: \.id) { reminder in
                        HStack {
                            Button(action: {
                                let reminderId = reminder.id.uuidString
                                if self.checkedReminders.contains(reminderId) {
                                    guard let indexOfReminder = self.checkedReminders.firstIndex(of: reminderId) else { return }
                                    self.checkedReminders.remove(at: indexOfReminder)
                                } else {
                                    self.checkedReminders.append(reminderId)
                                }
                            }) {
                                RadioCheckBox(
                                    checked: self.checkedReminders.contains(reminder.id.uuidString),
                                    color: .accentColor,
                                    size: 20,
                                    borderWidth: 4,
                                    spacing: 4)
                            }
                            Text(reminder.task)
                                .padding(.horizontal, 16)
                            Spacer()
                        }
                    }
                    NavigationLink(destination: Text("Visit AllRemindersScreen.playground")) {
                        HStack {
                            Text("All Reminders")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .padding(.top, 16)
                    }
                }
                .padding(.all, 16)
                .background(Color.red)
                .cornerRadius(16)
                .padding(.all, 16)
                VStack {
                    HStack {
                        Text("Calendar Events")
                            .font(.system(size: 20))
                        Spacer()
                    }
                    VStack {
                        ForEach(calendarEvents, id: \.id) { events in
                            HStack {
                                VStack {
                                    Text(self.dateFormatter.string(from: events.startTime))
                                        .multilineTextAlignment(.leading)
                                    Text(self.dateFormatter.string(from: events.endTime))
                                        .multilineTextAlignment(.leading)
                                }
                                .foregroundColor(.gray)
                                .frame(width: 88, height: nil)
                                Text(events.event)
                                Spacer()
                            }
                        }
                    }
                    .padding(.vertical, 16)
                    NavigationLink(destination: Text("Visit AllEventsScreen.playground")) {
                        HStack {
                            Text("All Events")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                    }
                }
                .padding(.all, 16)
                .background(Color.purple)
                .cornerRadius(16)
                .padding(.all, 16)
                Spacer()
            }
            .navigationBarTitle(Text("Schedulair"), displayMode: .large)
        }
    }

    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        return dateFormatter
    }()
}

struct RadioCheckBox: View {
    let checked: Bool
    let color: Color
    let size: CGFloat
    let borderWidth: CGFloat
    let spacing: CGFloat

    var body: some View {
        Circle()
            .foregroundColor(foregroundColor)
            .frame(width: size, height: size)
            .padding(.all, spacing)
            .overlay(
                RoundedRectangle(cornerRadius: size)
                    .stroke(Color.accentColor, lineWidth: borderWidth))
    }

    private var foregroundColor: Color {
        color.opacity(checked ? 1 : 0)
    }
}

PlaygroundPage.current.setLiveView(ContentView().accentColor(appColor))
