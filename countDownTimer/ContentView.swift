//
//  ContentView.swift
//  countDownTimer
//
//  Created by 細川聖矢 on 2021/02/02.
//

import SwiftUI
import AudioToolbox
import GoogleMobileAds
import UserNotifications


struct ContentView: View {
    @EnvironmentObject var timeManager:TimeManager
    @State private var showingAlert = false
    
    var body: some View {
        ZStack{
        ProgressBarView()
            
            if self.timeManager.timerStatus == .stopped{
        PickerView()
            }//if
            else{
        TimerView()
            }//else
            
            VStack{
                Spacer()
                ButtonsView()
                    .padding(.bottom)
            }//VStack
    }//ZStack
        .onAppear(perform: {
            UNUserNotificationCenter.current().requestAuthorization(options: [.badge,.sound,.alert]){(_,_) in
            }
        }
        
        )//onApper
        //onRecieveでtimerの発動を受け取る。ZStackの一番外側に配置することでview全体に適応させる。
        .onReceive(self.timeManager.timer){ _ in
            
            //statusがrunning以外なら何もしない
            guard self.timeManager.timerStatus == .running else {return}
            
            if self.timeManager.duration > 0{
            //残り時間から0.5引く
                self.timeManager.duration -= 0.5
            }//if
            else {
                self.timeManager.timerStatus = .stopped
                self.showingAlert = true
//                //アラームを鳴らす
//                //AudioToolBoxに入っているメソッド
//                AudioServicesPlayAlertSoundWithCompletion(self.timeManager.soundID, nil)
    
                
            }//else
        }//onReceive
        .alert(isPresented: $showingAlert){
            Alert(title: Text("時間です"))
        }//alert
        .onReceive(self.timeManager.vibratorTimer){ _ in
            
            guard self.timeManager.timerStatus == .stopped && self.showingAlert == true else{return}
            
            //通知を発火
            self.Notify()
            //バイブレーション
            AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)){
            }
            
        }
    }//View
    
    //通知を監視
    func Notify(){
        
        let content = UNMutableNotificationContent()
        content.title = "通知"
        content.body = "時間です。"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
        
        let req = UNNotificationRequest(identifier: "MSG", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(req, withCompletionHandler: nil)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
