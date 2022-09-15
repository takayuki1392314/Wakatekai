//
//  TotalView.swift
//  Original App
//
//  Created by 寺尾美帆 on 2022/08/31.
//

import SwiftUI
import UIKit
import Foundation
import Charts


struct TotalView: View {
    //let calendar = Calendar(identifier: .gregorian)
    let theDate = Date()//実行時の日付
    //let year = calendar.component(.year, from: theDate)
    //let month = calendar.component(.month, from: theDate)
    
    @AppStorage("biz_time") var biztime = 0
    @AppStorage("it_time") var ittime = 0
    @AppStorage("ins_time") var instime = 0
    @AppStorage("others_time") var otherstime = 0
    @AppStorage("total_time") var totaltime = 0

    
    var body: some View {
        
        NavigationView{
            
            VStack{
            //    Text(theDate.description(with: Locale(identifier: "ja_JP"))).padding()
                Text("学びの時間月合計")
                Text("２０２２年９月")
                //Text("\(year)年\(month)月")
                Text("合計時間").padding().border(Color.blue).background(Color.blue).foregroundColor(.white)
                Text("カテゴリ別合計：\((biztime+ittime+instime+otherstime) / 60 )分")
                Text("ビジネススキル：\(biztime / 60)分")
                Text("IT・デジタル：\(ittime / 60 )分")
                Text("保険商品・サービス：\(instime / 60 )分")
                Text("その他：\(otherstime / 60 )分")
                
            }//VSstockここまで
            //ナビゲーションにボタンを追加
            .toolbar{
                //ナビゲーションの左にボタンを追加
                ToolbarItem(placement: .navigationBarLeading){
                    //ナビゲーション遷移
                    NavigationLink(destination: OriginalView()){
                        //テキストを表示
                        Text("<TOP画面")
                        
                    }//NVavigationLinkここまで
            }//ToolbarItemここまで
        }//toolbarここまで
    }//NavigationViewここまで
    }//bodyここまで
}

//円グラフ参考


//円グラフ参考ここまで

struct TotalView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TotalView()
        }
    }
}
