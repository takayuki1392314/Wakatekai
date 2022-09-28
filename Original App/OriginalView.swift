//
//  OriginalView.swift
//  Original App
//
//  Created by 寺尾美帆 on 2022/08/04.
//

import SwiftUI
import UIKit
import Foundation
import Charts

@main
struct originalApp: App {
    var body: some Scene {
        WindowGroup {
            RecordView()
        }
    }
}

struct OriginalView: View {
    var body: some View {
        Text("Topページ")
    }
}
