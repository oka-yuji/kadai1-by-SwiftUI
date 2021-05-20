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
                    outputText = Calculator().calculate(
                        textArray: [
                            inputTextOne,
                            inputTextTwo,
                            inputTextThree,
                            inputTextFour,
                            inputTextFive
                        ]
                    )
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

private struct MyModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal)
            .frame(width: 150, height: 30)
            .background(Color.gray.opacity(0.3))
            .cornerRadius(5)
    }
}

struct Calculator {
    func calculate(textArray: [String]) -> String {
        String(
            textArray
                .map { Int($0) ?? 0 }
                .reduce(0, +)
        )
    }
}
