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

//struct ChartsSampleView_Previews: PreviewProvider
//static var previews: some View {
//        ChartsSampleView()
//    }
//}
//struct ToyShape: Identifiable {
//    var type: String
//    var count: Double
//    var id = UUID()
//}
struct TotalView: View {
    //let calendar = Calendar(identifier: .gregorian)
    let theDate = Date()//実行時の日付
    //let year = calendar.component(.year, from: theDate)
    //let month = calendar.component(.month, from: theDate)
    
    //割合として算出するため、初期値を１秒に設定（０割を防ぐため）
    @AppStorage("biz_time") var biztime = 1
    @AppStorage("it_time") var ittime = 1
    @AppStorage("ins_time") var instime = 1
    @AppStorage("others_time") var otherstime = 1
    
    var biztime_total = 0
    //@State var biztime_total = 0
//    var data: [ToyShape] = [
//        .init(type: "Cube", count: 5),
//        .init(type: "Sphere", count: 4),
//        .init(type: "Pyramid", count: 4)
//    ]
    var body: some View {
//        NavigationView{
            VStack{
            //    Text(theDate.description(with: Locale(identifier: "ja_JP"))).padding()
                Text("学びの時間月合計")
                Text("２０２２年９月")
//                Text("\(year)年\(month)月")
                Text("合計時間").padding().border(Color.blue).background(Color.blue).foregroundColor(.white)
                List {
                    Text("カテゴリ別合計：\((biztime+ittime+instime+otherstime) / 3660 )時間\((biztime+ittime+instime+otherstime) / 60)秒")
                    Text("ビジネススキル：\(biztime / 3600)時間\(biztime / 60)分")
                    Text("IT・デジタル：\(ittime / 3660 )時間\(ittime / 60 )分")
                    Text("保険商品・サービス：\(instime / 3660 )時間\(instime / 60 )分")
                    Text("その他：\(otherstime / 3660 )時間\(otherstime / 60 )分")
                    Text("その他：\(biztime_total / 3660 )時間\(biztime_total / 60 )分")
                }

                List {
                    Text("ビジネススキル：\(biztime / (biztime+ittime+instime+otherstime)*100) ％")
                    Text("IT・デジタル：\(ittime / (biztime+ittime+instime+otherstime)*100 )％")
                    Text("保険商品・サービス：\(instime / (biztime+ittime+instime+otherstime)*100 )％")
                    Text("その他：\(otherstime / (biztime+ittime+instime+otherstime)*100 )％")
                    Text("その他：\(biztime_total / (biztime+ittime+instime+otherstime)*100 )％")
                }
            }//VSstockここまで
            

            
            //ナビゲーションにボタンを追加
            //.toolbar{
                //ナビゲーションの左にボタンを追加
                //ToolbarItem(placement: .navigationBarLeading){
                    //ナビゲーション遷移
                    //NavigationLink(destination: OriginalView()){
                        //テキストを表示
                        //Text("<TOP画面")
                        
                    //}//NVavigationLinkここまで
            //}//ToolbarItemここまで
        //}//toolbarここまで
            
//    }//NavigationViewここまで
        
    }//bodyここまで
}


struct TotalView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TotalView()
                .previewInterfaceOrientation(.portrait)
        }
    }
}

