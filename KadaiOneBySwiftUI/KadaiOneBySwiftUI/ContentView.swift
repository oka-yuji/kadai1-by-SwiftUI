//
//  ContentView.swift
//  KadaiOneBySwiftUI
//
//  Created by 岡優志 on 2021/05/18.
//

import SwiftUI

struct ContentView: View {
    @State var inputTextOne = ""
    @State var inputTextTwo = ""
    @State var inputTextThree = ""
    @State var inputTextFour = ""
    @State var inputTextFive = ""
    @State var outputText = ""
    var body: some View {
        HStack {
            VStack{
                //TextFieldのView
                TextField ("input num", text: $inputTextOne)
                    .modifier(MyModifier())
                TextField ("input num", text: $inputTextTwo)
                    .modifier(MyModifier())
                TextField ("input num", text: $inputTextThree)
                    .modifier(MyModifier())
                TextField ("input num", text: $inputTextFour)
                    .modifier(MyModifier())
                TextField ("input num", text: $inputTextFive)
                    .modifier(MyModifier())
                //計算結果を処理するButton
                Button(action: {
                    //入力した数値を配列に入れる
                    let sumAraay = [inputTextOne, inputTextTwo, inputTextThree, inputTextFour, inputTextFive]
                    //mapを使用してInt型へ　reduceでは配列に入っている数値を全て足します
                    let sum = sumAraay
                        .map { Int($0) ?? 0 }
                        .reduce(0, +)
                    //合計を表示するtextへ合計値を返します
                    outputText = String(sum)
                }, label: {
                    Text("Button")
                })
                //数字を表示
                Text(outputText)
                Spacer()
            }
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MyModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal)
            .frame(width: 150, height: 30)
            .background(Color.gray.opacity(0.3))
            .cornerRadius(5)
    }
}
