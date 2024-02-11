//
//  TimerBootcamp.swift
//  ContinuedLearning
//
//  Created by Malith Madhushanka on 2024-02-11.
//

import SwiftUI

struct TimerBootcamp: View {
    
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    // Current time
    /*
    @State var currentDate: Date = Date()
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }
     */
    
    // Countdown
    @State var count: Int = 10
    @State var finishedText: String? = nil
    
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1))]),
                center: .center,
                startRadius: 5,
                endRadius: 500
            )
            .ignoresSafeArea()
            
            Text(finishedText ?? "\(count)")
                .font(.system(size: 100, weight: .semibold, design: .rounded))
                .foregroundStyle(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
        }
        .onReceive(timer, perform: { _ in
            if count <= 1 {
                finishedText = "Wow!"
            } else {
                count -= 1
            }
        })
    }
}

#Preview {
    TimerBootcamp()
}
