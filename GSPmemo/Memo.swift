//
//  EkranOdgadnij.swift
//  GSPmemo
//
//  Created by Leszek Zieniuk on 20 dec 2021
//

import SwiftUI

// let obrazSzer: CGFloat = 370


struct PokazKarte: View {
    var nrObraz: Int
    @Binding var liczKlikPara: Int
    @Binding var kartaStan: [Int]
    @Binding var PamKlik: [Int]
    @Binding var liczKlik: Int
    @Binding var liczKlikOK: Int
    @Binding var IsTimerRunning: Bool
    @Binding var RotAngle: Double
    @EnvironmentObject var kolejkalos: KolejkaLos
    @EnvironmentObject var kolejkalosint: KolejkaLosInt
    
    var body: some View {
                Button(action: {
                    let i_karta: Int = nrObraz
                    if self.kartaStan[i_karta] == 0 { // jeżeli karta zakryta
                        if self.liczKlikPara < 2 {
                            self.PamKlik[self.liczKlikPara] = i_karta
                            self.liczKlikPara += 1
                            self.kartaStan[i_karta] = 1
                            if self.liczKlikPara == 2 && self.liczKlikOK == 1 {
                                IsTimerRunning = false
                                self.liczKlikOK = 0
                                withAnimation(Animation.easeOut(duration: 1.5)) {
                                    RotAngle += RotDeltaAngle
                                }
                            }
                        }
                        else{
                            if abs(kolejkalosint.kolejkalosint[self.PamKlik[0]] - kolejkalosint.kolejkalosint[self.PamKlik[1]]) == 10 {
                                self.liczKlikPara = 0
                                self.liczKlik += 1
                                self.liczKlikOK -= 1
                                if self.liczKlikOK == 0 {
                                    IsTimerRunning = false
                                }
                                self.kartaStan[self.PamKlik[0]] = 2
                                self.kartaStan[self.PamKlik[1]] = 2
                            }
                            else {
                                self.liczKlikPara = 0
                                self.liczKlik += 1
                                self.kartaStan[self.PamKlik[0]] = 0
                                self.kartaStan[self.PamKlik[1]] = 0
                            }
                        }
                    }
                    else { // jeżeli karta odkryta lub sparowana
                        if self.liczKlikPara == 2 {
                            if abs(kolejkalosint.kolejkalosint[self.PamKlik[0]] - kolejkalosint.kolejkalosint[self.PamKlik[1]]) == 10 {
                                self.liczKlikPara = 0
                                self.liczKlik += 1
                                self.liczKlikOK -= 1
                                if self.liczKlikOK == 0 {
                                    IsTimerRunning = false
                                }
                                self.kartaStan[self.PamKlik[0]] = 2
                                self.kartaStan[self.PamKlik[1]] = 2
                            }
                            else {
                                self.liczKlikPara = 0
                                self.liczKlik += 1
                                self.kartaStan[self.PamKlik[0]] = 0
                                self.kartaStan[self.PamKlik[1]] = 0
                            }
                        }
                    }
                }) {
                    Image(self.kartaStan[nrObraz] == 0 ? Obraz_0 : self.kartaStan[nrObraz] == 1 ? kolejkalos.kolejkalos[nrObraz] : Obraz_End)
                        .resizable()
                        .scaledToFit()
                        .frame(width: SzerEkr > 500 ? SzerEkr / 6 : SzerEkr / 5, height: SzerEkr > 500 ? SzerEkr / 6 : SzerEkr / 5, alignment: .center)
                        .cornerRadius(buttonRadius)
                    }.padding(.bottom, paddingImageBottom)
            }
}

struct PokazLinia: View {
    var nrLinii: Int
    @Binding var liczKlikPara: Int
    @Binding var kartaStan: [Int]
    @Binding var PamKlik: [Int]
    @Binding var liczKlik: Int
    @Binding var liczKlikOK: Int
    @Binding var IsTimerRunning: Bool
    @Binding var RotAngle: Double
    
    var body: some View {
            HStack {
                PokazKarte(nrObraz: 4 * nrLinii + 0, liczKlikPara: $liczKlikPara, kartaStan: $kartaStan, PamKlik: $PamKlik, liczKlik: $liczKlik, liczKlikOK: $liczKlikOK, IsTimerRunning: $IsTimerRunning, RotAngle: $RotAngle)
                PokazKarte(nrObraz: 4 * nrLinii + 1, liczKlikPara: $liczKlikPara, kartaStan: $kartaStan, PamKlik: $PamKlik, liczKlik: $liczKlik, liczKlikOK: $liczKlikOK, IsTimerRunning: $IsTimerRunning, RotAngle: $RotAngle)
                PokazKarte(nrObraz: 4 * nrLinii + 2, liczKlikPara: $liczKlikPara, kartaStan: $kartaStan, PamKlik: $PamKlik, liczKlik: $liczKlik, liczKlikOK: $liczKlikOK, IsTimerRunning: $IsTimerRunning, RotAngle: $RotAngle)
                PokazKarte(nrObraz: 4 * nrLinii + 3, liczKlikPara: $liczKlikPara, kartaStan: $kartaStan, PamKlik: $PamKlik, liczKlik: $liczKlik, liczKlikOK: $liczKlikOK, IsTimerRunning: $IsTimerRunning, RotAngle: $RotAngle)
            }
    }
}

struct Memo: View {
    @EnvironmentObject var kolejkalos: KolejkaLos
    @EnvironmentObject var kolejkalosint: KolejkaLosInt
    @EnvironmentObject var zakresgry: ZakresGry

    @State var i: Int = 0
    @State private var IsTimerRunning = true
    @State private var RotAngle: Double = 0
    @State var startTime = Date()
    @State private var timerString = "0.0"
    @State private var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @State private var liczKlik: Int = 0 // W przyszci licznik ruchów
    @State private var liczKlikOK: Int = 10
    @State private var liczKlikPara: Int = 0
    @State private var kartaStan: [Int] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    @State private var PamKlik: [Int] = [0,0,0,0]
    
    var body: some View {
            VStack {
                TopLine()
                Text("GSPmemo \(jakiZakres(zakres: zakresgry.zakresgry))")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(buttonTxtColor)
                    .padding(.vertical, 30.0)

                ZStack{
                    VStack {
                        PokazLinia(nrLinii: 0, liczKlikPara: $liczKlikPara, kartaStan: $kartaStan, PamKlik: $PamKlik, liczKlik: $liczKlik, liczKlikOK: $liczKlikOK, IsTimerRunning: $IsTimerRunning, RotAngle: $RotAngle)
                        PokazLinia(nrLinii: 1, liczKlikPara: $liczKlikPara, kartaStan: $kartaStan, PamKlik: $PamKlik, liczKlik: $liczKlik, liczKlikOK: $liczKlikOK, IsTimerRunning: $IsTimerRunning, RotAngle: $RotAngle)
                        PokazLinia(nrLinii: 2, liczKlikPara: $liczKlikPara, kartaStan: $kartaStan, PamKlik: $PamKlik, liczKlik: $liczKlik, liczKlikOK: $liczKlikOK, IsTimerRunning: $IsTimerRunning, RotAngle: $RotAngle)
                        PokazLinia(nrLinii: 3, liczKlikPara: $liczKlikPara, kartaStan: $kartaStan, PamKlik: $PamKlik, liczKlik: $liczKlik, liczKlikOK: $liczKlikOK, IsTimerRunning: $IsTimerRunning, RotAngle: $RotAngle)
                        PokazLinia(nrLinii: 4, liczKlikPara: $liczKlikPara, kartaStan: $kartaStan, PamKlik: $PamKlik, liczKlik: $liczKlik, liczKlikOK: $liczKlikOK, IsTimerRunning: $IsTimerRunning, RotAngle: $RotAngle)
                    }
                        VStack{
                            Text ("Brawo!")
                                .font(.system(size: SzerEkr > 500 ? 144 : 90))
                                .fontWeight(.bold)
                                .tracking(10)
                                .foregroundColor(.red)
                                .frame(width: WspSzer * SzerEkr, height: WspSzer * SzerEkr)
                                .rotationEffect(.degrees(RotAngle))
                                .opacity(liczKlikOK == 0 ? 1 : 0)
                        }
                }
                Divider()
                 HStack{
                     Text("Liczba prób:")
                         .font(.caption)
                         .padding(.leading, 8.0)
                         .foregroundColor(Color("ColorTxtZwykly"))
                     Text("\(self.liczKlik)")
                         .fontWeight(.bold)
                         .foregroundColor(Color.red)
                     Spacer()
                     Text("Pozostało odgadnąć: ")
                         .foregroundColor(Color("ColorTxtZwykly"))
                     Text("\(self.liczKlikOK)")
                         .fontWeight(.bold)
                         .foregroundColor(Color.red)
                         .padding(.trailing, 8.0)
                 }

                 HStack {
                     Text ("t = ")
                         .foregroundColor(Color("ColorTxtZwykly"))
                     Text(timerString)
                         .onReceive(timer, perform: { _ in
                             if IsTimerRunning {
                                 timerString = String(format: "%.1f", Date().timeIntervalSince(startTime))
                             } })
                         .foregroundColor(Color("ColorTxtZwykly"))
                     Text ("s")
                        .foregroundColor(Color("ColorTxtZwykly"))
                 }
                
                Spacer()
            }
        .background(
            VStack {
                HStack {
                    Spacer ()
                    Image ("TloGranat")
                        .opacity(TloOpacity)
                }
                Spacer ()
                HStack {
                    Image ("TloZolty")
                        .opacity(TloOpacity)
                    Spacer ()
                }
        }
            .background(Color.white))
    }
}

struct Memo_Previews: PreviewProvider {
    static var previews: some View {
        Memo()
    }
}
