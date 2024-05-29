//
//  CountryPickerViewWrapper.swift
//  SignupForm_POC
//
//  Created by Salman_Macbook on 23/05/24.
//

import SwiftUI
import CountryPickerView

struct CountryPickerViewWrapper: UIViewRepresentable {
    @Binding var selectedCountry: Country?

    func makeUIView(context: Context) -> CountryPickerView {
        let countryPickerView = CountryPickerView()
        countryPickerView.delegate = context.coordinator
        return countryPickerView
    }

    func updateUIView(_ uiView: CountryPickerView, context: Context) {
        if let selectedCountry = selectedCountry {
            uiView.setCountryByCode(selectedCountry.code)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, CountryPickerViewDelegate {
        var parent: CountryPickerViewWrapper

        init(_ parent: CountryPickerViewWrapper) {
            self.parent = parent
        }

        func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country) {
            parent.selectedCountry = country
        }
    }
}
