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
        WindowGroup {
            TotalView()
            RecordView()
        }
    }
}

struct OriginalView: View {
    var body: some View {
        Text("Topページ")
    }
}

