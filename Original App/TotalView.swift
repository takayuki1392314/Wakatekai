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
    
    @State var nowDate = Date()
    @State var dateText = ""
    private let dateFormatter = DateFormatter()
    
    init() {
        dateFormatter.dateFormat = "YYYY/MM/dd(E) \nHH:mm:ss"
        dateFormatter.locale = Locale(identifier: "ja_jp")
        }
    

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
                Text("合計時間").padding().border(Color.blue).background(Color.blue).foregroundColor(.white)
                
                NavigationView{
                List {
                    Text("カテゴリ別合計：\((biztime+ittime+instime+otherstime) / 3660 )時間\((biztime+ittime+instime+otherstime) / 60)分")
                    Text("ビジネススキル：\(biztime / 3600)時間\(biztime / 60)分")
                    Text("IT・デジタル：\(ittime / 3660 )時間\(ittime / 60 )分")
                    Text("保険商品・サービス：\(instime / 3660 )時間\(instime / 60 )分")
                    Text("その他：\(otherstime / 3660 )時間\(otherstime / 60 )分")
                }
                .navigationTitle("勉強時間")
                }.navigationViewStyle(StackNavigationViewStyle())

                NavigationView{
                List {
                    Text("ビジネススキル：\(biztime / (biztime+ittime+instime+otherstime)*100) ％")
                    Text("IT・デジタル　：\(ittime / (biztime+ittime+instime+otherstime)*100 )％")
                    Text("保険商品・サービス：\(instime / (biztime+ittime+instime+otherstime)*100 )％")
                    Text("その他：\(otherstime / (biztime+ittime+instime+otherstime)*100 )％")
                }
                .navigationTitle("勉強比率")
                }.navigationViewStyle(StackNavigationViewStyle())

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

struct ContentView: View {
    @State var date = Date()
    @State var textDate = ""
    var body: some View {
        VStack{
            Text(textDate)
            DatePicker("Select Date", selection: $date)
                .onChange(of: date, perform: { value in
                    let dateFormatter = DateFormatter()
                    
                    dateFormatter.dateFormat = "YY/MM/dd"
                    
                    self.textDate = dateFormatter.string(from: self.date)
                })
        }
    }
}
