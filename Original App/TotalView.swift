//
//  TotalView.swift
//  Original App
//
//  Created by 寺尾美帆 on 2022/08/31.
//

import SwiftUI

struct TotalView: View {
    var body: some View {
        NavigationView{
            VStack{
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
