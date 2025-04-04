//
//  Water_widgetLiveActivity.swift
//  Water widget
//
//  Created by Matin Rahimi on 2025-04-04.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct Water_widgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct Water_widgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: Water_widgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension Water_widgetAttributes {
    fileprivate static var preview: Water_widgetAttributes {
        Water_widgetAttributes(name: "World")
    }
}

extension Water_widgetAttributes.ContentState {
    fileprivate static var smiley: Water_widgetAttributes.ContentState {
        Water_widgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: Water_widgetAttributes.ContentState {
         Water_widgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: Water_widgetAttributes.preview) {
   Water_widgetLiveActivity()
} contentStates: {
    Water_widgetAttributes.ContentState.smiley
    Water_widgetAttributes.ContentState.starEyes
}
