// FirstLaunch.playground

import SwiftUI
import PlaygroundSupport

let appColor: Color = .green

struct ContentView: View {
    @State private var showFirstLaunch = false
    @State private var syncAccounts = false
    @State private var syncReminders = false
    @State private var syncIcloud = true

    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 40, height: 4)
                .cornerRadius(8)
                .foregroundColor(.gray)
                .padding(.top, 20)
            VStack {
                Text("Accounts to sync with")
                    .font(.system(size: 24))
                Text("Sync your accounts and bring your schedule to one place")
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .frame(
                        minWidth: 200,
                        maxWidth: 360,
                        minHeight: nil,
                        maxHeight: nil)
                    .padding(.horizontal, 16)
            }
            .padding(.vertical, 20)
            VStack {
                AccountToSyncWith(
                    name: "Apple Calendar",
                    description: "Sync with your Apple Calendar app",
                    toggleState: $syncAccounts)
                AccountToSyncWith(
                    name: "Apple Reminders",
                    description: "Sync with your Apple Reminders app",
                    toggleState: $syncReminders)
                AccountToSyncWith(
                    name: "iCloud",
                    description: "Keep all your devices in sync with iCloud",
                    toggleState: $syncIcloud)
            }
            .padding(.horizontal, 16)
            Spacer()
            Button(action: { self.showFirstLaunch = false}) {
                Text("Continue")
            }
                .frame(
                    minWidth: 200,
                    maxWidth: .infinity,
                    minHeight: 40,
                    maxHeight: 40)
                .background(Color.gray)
                .padding(.top, 8)
        }
    }
}

struct AccountToSyncWith: View {
    let name: String
    let description: String

    @Binding var toggleState: Bool

    var body: some View {
        ZStack {
            Color.blue
                .cornerRadius(8)
            HStack {
                Rectangle()
                    .frame(width: 60, height: 60)
                    .cornerRadius(16)
                    .foregroundColor(.red)
                VStack {
                    HStack {
                        Text(name)
                        Spacer()
                    }
                    HStack {
                        Text(description)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .frame(
                        minWidth: nil,
                        maxWidth: nil,
                        minHeight: 12,
                        maxHeight: 60)
                }
                Toggle(isOn: $toggleState) {
                    Text("")
                }
                .labelsHidden()
            }
            .padding(.all, 8)
        }
        .frame(width: nil, height: 80)
        .padding(.vertical, 8)
    }
}

PlaygroundPage.current.setLiveView(ContentView().accentColor(appColor))
