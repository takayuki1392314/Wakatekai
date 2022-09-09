//
//  OriginalView.swift
//  Original App
//
//  Created by 寺尾美帆 on 2022/08/04.
//

import SwiftUI

@main

struct originalApp: App {
    var body: some Scene {
            NavigationView{
        //WindowGroup {
          //  RecordView()
        //}
        HStack(spacing: 20.0) {
            //スタートボタン
            Button(action: {
                //ボタンをタップしたときのアクション
                NavigationLink(destination: TotalView()) {
                }} ){ //NavigationLinkここまで
                //テキストを表示
                Text("集計ページ")
                //文字サイズを指定
                    .font(.title)
                //文字色を黒に指定
                    .foregroundColor(Color.black)
                //幅高さを140に指定
                    .frame(width: 140, height: 140)
                //背景を指定
                    .background(Color("beforeSelected"))
                //円形にくり抜く
                    .clipShape(Circle())
            } //スタートボタンここまで
            // ストップボタン
            Button(action: {
                //ボタンをタップしたときのアクション
                //ボタンをタップしたときのアクション
                NavigationLink(destination: RecordView()) {
                }} ){ //NavigationLinkここまで
                //テキストを表示
                Text("記録ページ")
                //文字サイズを指定
                    .font(.title)
                //文字色を指定
                    .foregroundColor(Color.white)
                //幅高さを140に指定
                    .frame(width: 140, height: 140)
                //背景を指定
                    .background(Color("stopColor"))
                //円形にくり抜く
                    .clipShape(Circle())
            } //ストップボタンここまで
       } //HStackここまで
    }
  }
}

struct OriginalView: View {
    var body: some View {
        Text("Topページ")
    }
}

