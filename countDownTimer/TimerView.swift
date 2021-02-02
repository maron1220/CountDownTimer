//
//  TimerView.swift
//  countDownTimer
//
//  Created by 細川聖矢 on 2021/02/02.
//

import Foundation
import SwiftUI
import GoogleMobileAds

struct SecondAdView: UIViewRepresentable {
    func makeUIView(context: Context) -> GADBannerView {
        let banner = GADBannerView(adSize: kGADAdSizeBanner)
        
        banner.adUnitID = "ca-app-pub-4439113960692957/4789539472"
        banner.rootViewController = UIApplication.shared.windows.first?.rootViewController
        banner.load(GADRequest())
        return banner
    }

    func updateUIView(_ uiView: GADBannerView, context: Context) {
    }
}

struct TimerView:View {
    @EnvironmentObject var timeManager:TimeManager
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeght = UIScreen.main.bounds.height
    
    var body: some View{
        ZStack{
            VStack{
        SecondAdView().frame(width: 320, height: 50)
            Spacer()
            }//VStack
        if self.timeManager.displayedFormat == .hr{
            Text(self.timeManager.displayTimer())
                .font(.system(size: self.screenWidth*0.15,weight:.thin,design:.monospaced))
                .lineLimit(1)
                .padding()
        }//.hr
        else if self.timeManager.displayedFormat == .min{
            Text(self.timeManager.displayTimer())
                .font(.system(size: self.screenWidth*0.23,weight:.thin,design:.monospaced))
                .lineLimit(1)
                .padding()
        }//else if
        else{
            Text(self.timeManager.displayTimer())
                .font(.system(size: self.screenWidth*0.5,weight:.thin,design:.monospaced))
                .lineLimit(1)
                .padding()
        }//else
        }//ZStack
    }//body
}

struct TimerView_Previews:PreviewProvider{
    static var previews: some View{
        TimerView()
            .previewLayout(.sizeThatFits)
    }
}
