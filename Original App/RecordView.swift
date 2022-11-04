//
//  ContentView.swift
//  Original App
//
//  Created by 寺尾美帆 on 2022/07/22.
//
import SwiftUI
import UIKit
import Foundation
import Charts

struct RecordView: View {
            //タイマー変数を作成
            @State var timerHandler : Timer?
            //カウント（経過時間）の変数を作成
            @State var count = 0
            ////永続化する秒数設定（初期値は10）
            //@AppStorage("timer_value") var timerValue = 0
            //カテゴリ変数を作成
            @State var category = 0
            //カテゴリ別の経過時間保持の変数を定義
            @AppStorage("biz_time") var biztime = 0
            @AppStorage("it_time") var ittime = 0
            @AppStorage("ins_time") var instime = 0
            @AppStorage("others_time") var otherstime = 0
            //@State var m = 0
            //@State var s = 0
            //アラート変数表示有無
            @State var showAlert = false

            var body: some View {
                NavigationView{
                    //奥から手前方向にレイアウト
                    ZStack {
                        // 背景画像
                        Image("background")
                            //リサイズする
                            .resizable()
                            //セーフエリアを超えて画面全体に配置
                            .ignoresSafeArea()
                            //アスペクト比（縦横比）を維持して短辺基準に収まるようにする
                            .aspectRatio(contentMode: .fill)
                        //垂直にレイアウト（縦方向にレイアウト）
                        //View（部品）間の間隔を5にする
                        VStack(spacing: 5.0) {
                            //カテゴリ選択
                                //Pickerを表示
                                Picker(selection: $category) {
                                    Text("カテゴリを選択してください").tag(0)
                                    Text("ビジネススキル").tag(1)
                                    Text("IT・デジタル").tag(2)
                                    Text("保険商品・サービス").tag(3)
                                    Text("その他").tag(4)
                                } label: {
                                    //Text("選択")
                                        //.padding()
                                }
                                //Pickerをホイール表示
                                .pickerStyle(.wheel)
                            Spacer()
                            //水平にレイアウト（横方向にレイアウト）
                            HStack(spacing: 20.0) {
                                //スタートボタン
                                Button(action: {
                                    //ボタンをタップしたときのアクション
                                    //Pickerでカテゴリを選択してくださいのままであればカウントアップを開始しない
                                    if category == 0 {
                                        return
                                    } else {
                                        //タイマーのカウントアップを開始する関数を呼び出す
                                        startTimer()
                                    }
                                }) {
                                    if category == 0 {
                                    //テキストを表示
                                    Text("START")
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
                                    } else {
                                        //テキストを表示
                                        Text("START")
                                        //文字サイズを指定
                                            .font(.title)
                                        //文字色を黒に指定
                                            .foregroundColor(Color.white)
                                        //幅高さを140に指定
                                            .frame(width: 140, height: 140)
                                        //背景を指定
                                            .background(Color("startColor"))
                                        //円形にくり抜く
                                            .clipShape(Circle())
                                    }
                                } //スタートボタンここまで
                                // ストップボタン
                                Button(action: {
                                    //ボタンをタップしたときのアクション
                                    if category == 1 {
                                        biztime += count
                                    }
                                    else if category == 2 {
                                        ittime += count
                                    }
                                    else if category == 3 {
                                        instime += count
                                    }
                                    else if category == 4 {
                                        otherstime += count
                                    }
                                    //timerHandlerをアンラップしてunwrapedTimerHandlerに代入
                                    if let unwrapedTimerHandler = timerHandler{
                                        //もしタイマーが実行中だったら停止
                                        if unwrapedTimerHandler.isValid == true{
                                            //タイマー停止
                                            unwrapedTimerHandler.invalidate()
                                        }
                                    }
                                    //タイマーをリセット
                                    count = 0
                                }) {
                                    //テキストを表示
                                    Text("STOP")
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
                            Spacer()
                            //経過秒数を表示する
                            Text("\(count / 60)分\(count % 60)秒")
                                .font(.largeTitle)
                            Spacer()
                        }
                        //.padding() //VStack ここまで
                    } //ZStackここまで
                    //画面が表示されるときに実行される
                    .onAppear {
                        //カウント（経過時間）の変数を初期化
                        count = 0
                    } // .onApperここまで
                    
                    //状態変数showAlertがtrueになった時に実行される
                    //.alert(isPresented: $showAlert){
                    ////アラート表示するためのレイアウトを記述する
                        ////アラートを表示する
                        //Alert(title: Text("終了"),
                              //message: Text("タイマー終了時間です"),
                              //dismissButton: .default(Text("OK")))
                    //} //.alertここまで
                .toolbar {
                    //ナビゲーションバーの左にボタンを追加
                    ToolbarItem(placement: .navigationBarLeading) {
                        //ナビゲーション遷移
                        NavigationLink(destination: OriginalView()) {
                            //テキストを表示
                            Text("<Top画面")
                        } //NavigationLinkここまで
                    } //ToolbarItemここまで
                    //ナビゲーションバーの左にボタンを追加
                    ToolbarItem(placement: .navigationBarTrailing) {
                        //ナビゲーション遷移
                        NavigationLink(destination: TotalView()) {
                            //テキストを表示
                            Text("集計ページ>")
                        } //NavigationLinkここまで
                    } //ToolbarItemここまで
                }//toolbarここまで
            } // NavigationView ここまで
                // iPadへ対応
                .navigationViewStyle(StackNavigationViewStyle())
        } // bodyここまで
            
        //１秒ごとに実行されてカウントダウンする
        func countUpTimer() {
            // count（経過時間）に＋１指定していく
            count += 1
                
            ////残り時間が０以下の時タイマーを止める
            //if timerValue - count <= 0 {
                ////タイマー停止
                //timerHandler?.invalidate()
                ////アラートを表示する
                //showAlert = true
            //}
        }//　countUpTimer()ここまで
        //タイマーをカウントダウン開始する関数
        func startTimer() {
            //timerHandlerをアンラップしてunwrapedTimerHandlerに再入
            if let unwrapedTimerHandler = timerHandler {
                //もしタイマーが実行中だったらスタートしない
                if unwrapedTimerHandler.isValid == true {
                    //何も処理しない
                    return
                }
            }
            
            ////残り0以下のとき、count(経過時間)を0に初期化する
            //if timerValue - count <= 0 {
            //count = 0
            //}
            //タイマーをスタート
            timerHandler = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                //タイマー実行時に呼び出される
                //１秒毎に実行されてカウントアップする関数を実行する
                countUpTimer()
            }
        }//startTimer()ここまで
    
        //func makeDisnable() {
            //Picker.disabled == true
        //}
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView()
    }
}
