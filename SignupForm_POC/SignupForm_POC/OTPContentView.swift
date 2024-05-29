//
//  OTPContentView.swift
//  SignupForm_POC
//
//  Created by Salman_Macbook on 24/05/24.
//

import SwiftUI

struct OTPContentView: View {
    
    @State private var otp: [String] = Array(repeating: "", count: 4)
    @FocusState private var focusedField: Int?
    
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                ForEach(0..<4, id: \.self) { index in
                    OTPTextField(text: $otp[index], tag: index, action: moveToNextField)
                        .focused($focusedField, equals: index)
                }
            }
            .padding()
            
            Button("Submit") {
                print("OTP Entered: \(otp.joined())")
                // Add your submit action here
            }
            //.padding(.top, 20)
            //.frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .onAppear {
            focusedField = 0
        }
    }
    
    private func moveToNextField(currentTag: Int) {
        if currentTag < 3 {
            focusedField = currentTag + 1
        } else {
            focusedField = nil
        }
    }
}

struct OTPTextField: View {
    @Binding var text: String
    @FocusState private var isFocused: Bool
    let tag: Int
    let action: (Int) -> Void

    var body: some View {
        TextField("", text: $text)
            .frame(width: 60, height: 60)
            .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray))
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
            .focused($isFocused)
            .onChange(of: text) { newValue in
                if newValue.count > 1 {
                    text = String(newValue.prefix(1))
                }
                if newValue.count == 1 {
                    action(tag)
                }
            }
            .onAppear {
                if tag == 0 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        isFocused = true
                    }
                }
            }
    }
}


#Preview {
    OTPContentView()
}
