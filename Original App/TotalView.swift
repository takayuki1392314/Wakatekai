//
//  TotalView.swift
//  Original App
//
//  Created by 寺尾美帆 on 2022/08/31.
//

import SwiftUI
import UIKit
import Charts



struct TotalView: View {
    let theDate = Date()//実行時のタイム
    
    @AppStorage("biz_time") var biztime = 10
    @AppStorage("it_time") var ittime = 10
    @AppStorage("ins_time") var instime = 10
    @AppStorage("others_time") var otherstime = 10
    @AppStorage("total_time") var totaltime = 40
    

    
    var body: some View {
        
        NavigationView{
            
            
            VStack{
                    VStack(alignment:.leading){
                        Text(theDate.description(with: Locale(identifier: "ja_JP"))).padding()
                    }
                Text("学びの時間10月合計")
                Text("２０２２年９月")
                Text("合計時間").padding().border(Color.blue).background(Color.blue).foregroundColor(.white)
                Text("カテゴリ別合計：\(totaltime)秒")
                Text("ビジネススキル：\(biztime)秒")
                Text("IT・デジタル：\(ittime)秒")
                Text("保険商品・サービス：\(instime)秒")
                Text("その他：\(otherstime)秒")
                
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
            TotalView()
            TotalView()
        }
    }
}
