//
//  TotalView.swift
//  Original App
//
//  Created by 寺尾美帆 on 2022/08/31.
//

import SwiftUI
import UIKit

struct TotalView: View {
    
    @State var nowDate = Date()
    @State var dateText = ""
    private let dateFormatter = DateFormatter()
    init() {
        dateFormatter.dateFormat = "YYYY/MM/dd(E) \nHH:mm:ss"
        dateFormatter.locale = Locale(identifier: "ja_jp")
        }
    
    
    @AppStorage("biz_time") var biztime = 0
    @AppStorage("it_time") var ittime = 0
    @AppStorage("ins_time") var instime = 0
    @AppStorage("others_time") var otherstime = 0
    
    var body: some View {
        NavigationView{
            VStack{

                Text(dateText)
                
                Text("学びの時間月合計")
                Text("２０２２年９月")
                Text("合計時間").padding()
                Text("カテゴリ別合計")
                Text("ビジネススキル：")
                Text("IT・デジタル：")
                Text("保険商品・サービス：")
                Text("その他：")
                
            }//VSstockここまで
            //ナビゲーションにボタンを追加
            .toolbar{
                //ナビゲーションの左にボタンを追加
                ToolbarItem(placement: .navigationBarLeading){
                    //ナビゲーション遷移
                    NavigationLink(destination: OriginalView()){
                        //テキストを表示
                        Text("TOP画面")
                    }//NVavigationLinkここまで
            }//ToolbarItemここまで
        }//toolbarここまで
    }//NavigationViewここまで
    }//bodyここまで
}

struct TotalView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TotalView()
            TotalView()
            TotalView()
        }
    }
}
