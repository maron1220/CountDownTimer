//
//  ButtonsView.swift
//  countDownTimer
//
//  Created by 細川聖矢 on 2021/02/02.
//

import Foundation
import SwiftUI

struct ButtonsView:View {
    @EnvironmentObject var timeManager:TimeManager
    
    var body: some View{
        
        HStack{
            Image(systemName: "stop.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 75, height: 75)
                .padding(.leading)
                .opacity(
                    self.timeManager.timerStatus == .stopped ? 0.1 : 1
                )//opacity
                .onTapGesture {
                    if self.timeManager.timerStatus != .stopped{
                        self.timeManager.reset()
                    }//if
                }
            
            Spacer()
        
            Image(systemName: self.timeManager.timerStatus == .running ? "pause.circle.fill" : "play.circle.fill")
            .resizable()
            .aspectRatio(contentMode:.fit)
            .frame(width:75,height: 75)
            .padding(.trailing)
            .opacity(
                self.timeManager.hourSelection == 0 && self.timeManager.minSelection == 0 && self.timeManager.secSelection == 0 ? 0.1 : 1
            )//opacity
            .onTapGesture {
                if timeManager.timerStatus == .stopped {
                    self.timeManager.setTimer()
                    if self.timeManager.duration != 0{
                    self.timeManager.start()
                    print("stopped")
                    }//if
                }//if
                else if timeManager.timerStatus != .running && timeManager.duration != 0{
                    print("else")
                    self.timeManager.start()
                }//else if
                else if timeManager.timerStatus == .running{
                    print("runnning")
                    self.timeManager.pause()
                }//else if
            }//onTapGesture
        }//HStack
    }//body
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView()
            .previewLayout(.sizeThatFits)
    }
}
