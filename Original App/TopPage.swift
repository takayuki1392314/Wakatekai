//
//  TopPage.swift
//  Original App
//
//  Created by 寺尾美帆 on 2022/12/23.
//

import SwiftUI
import UIKit
import Foundation
import Charts

struct TopPage: View {
    @State var isShowTotalView = false
    @State var isShowRecordView = false
    var body: some View {
        Text("ようこそ")
            .padding()
            .position(x: 190, y: 150)
            .font(.system(size: 60))
        

        Button(action: {isShowTotalView = true
            
        }) {
            Text("集計ページ")
                .foregroundColor(Color.white)
                .frame(width:190,height:50)
                .background(Color.green)
                .position(x: 190, y:80)
        }
        .sheet(isPresented: $isShowTotalView) {
            TotalView()
        }

        NavigationView {
            VStack {
                NavigationLink(destination: TotalView().navigationTitle("集計ページ")) {
                }
            }
        }
Button(action: {isShowRecordView = true
    
}) {
    Text("記録ページ")
        .foregroundColor(Color.white)
        .frame(width:190,height:50)
        .background(Color.green)
        .position(x: 190, y:100)
}
.sheet(isPresented: $isShowRecordView) {
    RecordView()
}

NavigationView {
    VStack {
        NavigationLink(destination: RecordView().navigationTitle("記録ページ")){
    }
}
}
}
}
