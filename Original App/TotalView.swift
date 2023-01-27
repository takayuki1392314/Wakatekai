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

    //割合算出するため、初期値を１秒に設定（０割を防ぐため）
    @AppStorage("biz_time") var biztime = 1
    @AppStorage("it_time") var ittime = 1
    @AppStorage("ins_time") var instime = 1
    @AppStorage("others_time") var otherstime = 1
    @AppStorage("total_time") var  totaltime = 1
    
    //時間表示に関する変数宣言
    @State var nowDate = Date()
    @State var dateText = ""
    private let dateFormatter = DateFormatter()
    
    //初期化処理
    init() {
        //時間表示に関する初期化処理
        dateFormatter.dateFormat = "YYYY/MM/dd(E) \nHH:mm:ss"
        dateFormatter.locale = Locale(identifier: "ja_jp")
        //List全体の背景色の設定
        UITableView.appearance().backgroundColor = UIColor.white
        totaltime = biztime + ittime
        }
    //円グラフ
    //class CircleChartViewController: UIViewController{
    //let colors = Colors()
        //var percentage = UILabel()
        //var array:[TotalView.Category] = []
        //var chartView:CircleChartView!
        //          }

    var body: some View {
//        NavigationView{
            VStack{
                Text("学びの時間今月合計")
                Text(dateText.isEmpty ? "\(dateFormatter.string(from: nowDate))" : dateText)
                .onAppear {
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                        self.nowDate = Date()
                        dateText = "\(dateFormatter.string(from: nowDate))"
                    }
                }
//                Text("\(year)年\(month)月")
                //Text("合計時間").padding().background(Color("stopColor")).foregroundColor(.white)
                Text("総合計：\((biztime+ittime+instime+otherstime) / 3600 )時間\((biztime+ittime+instime+otherstime) / 60)分")
                
                NavigationView{
                List {
                    //Text("カテゴリ別合計：\((biztime+ittime+instime+otherstime) / 3600 )時間\((biztime+ittime+instime+otherstime) / 60)分")
                    Text("ビジネススキル：\(biztime / 3600)時間\(biztime / 60)分")
                    Text("IT・デジタル：\(ittime / 3660 )時間\(ittime / 60 )分")
                    Text("保険商品・サービス：\(instime / 3660 )時間\(instime / 60 )分")
                    Text("その他：\(otherstime / 3660 )時間\(otherstime / 60 )分")
                }
                .navigationTitle("勉強時間")
                }
                //.navigationViewStyle(StackNavigationViewStyle())

                NavigationView{
                List {
                    Text("ビジネススキル：\((biztime / totaltime)*100) %")
                    Text("ビジネススキル：\((biztime / (biztime))*100) ％")
                    Text("ビジネススキル：\(biztime + ittime)")
                    Text("ビジネススキル： \(biztime)")
                    Text("IT・デジタル　：\((ittime / (biztime + ittime + instime + otherstime))*100 )％")
                    Text("ビジネススキル： \(ittime)")
                    Text("保険商品・サービス：\((instime / (biztime + ittime + instime + otherstime))*100 )％")
                    Text("その他：\((otherstime / (biztime + ittime + instime + otherstime))*100 )％")
                }
                .navigationTitle("勉強比率")
                }.navigationViewStyle(StackNavigationViewStyle())
                
                Button(action: {
                    //ボタンをタップしたときのアクション
                    //タイマーをリセット
                    totaltime = biztime + ittime + instime + instime + otherstime
                    biztime = 1
                    ittime = 1
                    instime = 1
                    otherstime = 1
                }) {
                    //テキストを表示
                    Text("リセット")
                    //文字サイズを指定
                        .font(.title)
                    //文字色を指定
                        .foregroundColor(Color.white)
                    //幅高さを140に指定
                        .frame(width: 140, height: 40)
                    //背景を指定
                        .background(Color("stopColor"))
                } //ボタンここまで
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


