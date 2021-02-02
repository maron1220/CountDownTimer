//
//  ProgressBar.swift
//  countDownTimer
//
//  Created by 細川聖矢 on 2021/02/02.
//

import Foundation
import SwiftUI

struct ProgressBarView:View{
    @EnvironmentObject var timeManager:TimeManager
    
    @State var costomHueA = 0.5
    @State var costomHueB = 0.3
    
    var body: some View{
        ZStack{
        //Circleは元々SwiftUIに入っている。
            //外の円
        Circle()
            
            .stroke(Color(.darkGray),style: StrokeStyle(lineWidth:20))
            .scaledToFit()
            .padding(15)
            
            //中の円
        Circle()
            
            //残り時間に合わせて長さを変える
            //fromからtoは0-1の間
            //CGFloat型にしなきゃいけない
            .trim(from: 0, to: CGFloat(self.timeManager.duration/self.timeManager.maxValue))
            .stroke(Color(.orange),style: StrokeStyle(lineWidth:20))
            .scaledToFit()
            .rotationEffect(Angle(degrees: -90))
            .padding(15)
        }//ZStack
        .onReceive(timeManager.timer){_ in
            self.costomHueA += 0.005
            if self.costomHueA >= 1{
                self.costomHueA = 0.0
            }
            
            self.costomHueB += 0.005
            if self.costomHueB >= 1{
                self.costomHueB = 0.0
            }
            
        }
    }//body
    
    //グラデーションを作る関数
    //AngularGradientはグラデーションの種類
//    func makeGradientColor(hueA:Double,hueB:Double) -> AngularGradient {
//        let colorA = Color(hue:hueA,saturation: 0.75,brightness: 0.9)
//        let colorB = Color(hue:hueB,saturation: 0.75,brightness: 0.9)
//        let gradient = AngularGradient(gradient: .init(colors: [colorA,colorB,colorA]), center:.center,startAngle: .zero,endAngle: .init(degrees: 360) )
//        return gradient
//    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView()
            
            .previewLayout(.sizeThatFits)
    }
}
