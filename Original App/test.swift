//
//  test.swift
//  Original App
//
//  Created by 寺尾美帆 on 2022/09/07.
//

import SwiftUI

@State var dateText = ""
@State var nowDate = Date()
private let dateFormatter = DateFormatter()
init() {
    dateFormatter.dateFormat = "YYYY/MM/dd(E) \nHH:mm:ss"
    dateFormatter.locale = Locale(identifier: "ja_jp")
}
var body: some View {
    Text(dateText.isEmpty ? "\(dateFormatter.string(from: nowDate))" : dateText)
    .onAppear {
    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.nowDate = Date()
            dateText = "\(dateFormatter.string(from: nowDate))"
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
