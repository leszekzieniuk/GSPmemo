//
//  ContentView.swift
//  PoznajGSP
//
//  Created by Leszek Zieniuk on 07/12/2020.
//

import SwiftUI

class NrStrony: ObservableObject {
    @Published var nrStrony = 1
}

struct ContentView: View {
    @StateObject var zakresgry = ZakresGry ()
    @StateObject var strona = NrStrony ()
    @StateObject var kolejkalos = KolejkaLos ()
    @StateObject var kolejkalosint = KolejkaLosInt ()

    @State private var sliderValue: Double = 5.0
    @State private var flagMemo6: Bool = false
    @State private var TylkoObrazy: Bool = false

    var body: some View {
        
        VStack {
            if strona.nrStrony == 1 {
                EkranStart (sliderValue: $sliderValue, flagMemo6: $flagMemo6, TylkoObrazy: $TylkoObrazy)
            } else if strona.nrStrony == 2
            {
                Memo6 (flagMemo6: $flagMemo6, TylkoObrazy: $TylkoObrazy) // Zamiast Memo
            } else {
                NaukaScroll ()
            }
        }
        .environmentObject(strona)
        .environmentObject(kolejkalos)
        .environmentObject(zakresgry)
        .environmentObject(kolejkalosint)
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
}
