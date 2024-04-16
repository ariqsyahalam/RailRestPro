//
//  TimerView.swift
//  RailRestPro Watch App
//
//  Created by Reyhan Ariq Syahalam on 08/04/24.
//

import SwiftUI
import HealthKitUI

struct SessionView: View {
    @ObservedObject var viewModel = SessionViewModel()
    
    
    var body: some View {
        VStack {
            Text("\(TimerUtil.timeFormat(duration: viewModel.timeRemaining))")
                .font(
                    Font.custom("SF Compact Text", size: 64)
                        .weight(.bold)
                )
                .multilineTextAlignment(.center)
                .onChange(of: viewModel.timeRemaining, {
                    if viewModel.timeRemaining == 0 {
                        viewModel.alarmRinging()
                    }

                })
            
            VStack {
                if viewModel.isStarted{
                    ProgressView(value:
                        viewModel.timeRemaining/viewModel.timeDefault)
                    HStack{
                        if !viewModel.isRinging{
                            Button("Reset") {
                                viewModel.resetTimer()
                            }
                            Button("Stop") {
                                viewModel.stopTimer()
                            }
                        } else if viewModel.isRinging{
                            Button("Stop Ringing"){
                                viewModel.stopAlarm()
                            }
                        }
                        
                    }
                } else if !viewModel.isStarted{
                    Button("Start") {
                        viewModel.startTimer()
                        viewModel.latestHeartRate()
                    }.onDisappear(){
                        
                    }
                }
            }
        }.onAppear(){
            viewModel.healthKitAuth()
        }
    }
}

#Preview {
    SessionView()
}
