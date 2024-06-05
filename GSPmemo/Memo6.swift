//
//  Memo6.swift
//  GSPmemo
//
//  Created by Leszek Zieniuk on 31/12/2022.
//

import SwiftUI
let LiczbaWys: CGFloat = 351
let iEnd: Int = 10
let buttonRozm: CGFloat = 40
let buttonColor: Color = Color(red: 255/256, green: 199/256, blue: 44/256, opacity: 1.0)
let buttonTxtColor: Color = Color(red: 35/256, green: 57/256, blue: 91/256, opacity: 1.0)
let BialyColor: Color = Color(red: 255/256, green: 256/256, blue: 256/256, opacity: 1.0)
let TloOpacity: Double = 0.5
// let KartaRozm: CGFloat = 70
let buttonRadius: CGFloat = 5
let paddingImageBottom: CGFloat = 0
let Obraz_0: String = "Sygnet_granat"
let Obraz_End: String = "blank"
let RotDeltaAngle: Double = 360
 
struct TopLine: View {
    @EnvironmentObject var strona: NrStrony
    var body: some View {
        HStack {
            Image(/*@START_MENU_TOKEN@*/"Logo APam granat")
            Spacer()
            Button(action: {strona.nrStrony = 1}) {
                Image("keyBack")
                    .resizable()
                    .scaledToFit()
                    .frame(width: buttonRozm, height: buttonRozm, alignment: .center)
                    .cornerRadius(5)
            }
        }
        .padding(.horizontal, 2.0)
        .padding(.trailing, 15.0)
    }
}

struct PokazKarte6: View {
    var nrObraz: Int
    @Binding var liczKlikPara: Int
    @Binding var kartaStan: [Int]
    @Binding var PamKlik: [Int]
    @Binding var liczKlik: Int
    @Binding var liczKlikOK: Int
    @Binding var IsTimerRunning: Bool
    @Binding var RotAngle: Double
    @Binding var flagMemo6: Bool

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
                            if abs(kolejkalosint.kolejkalosint[self.PamKlik[0]] - kolejkalosint.kolejkalosint[self.PamKlik[1]]) == (flagMemo6 ? LiczbaPar6 : LiczbaPar) {
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
                            if abs(kolejkalosint.kolejkalosint[self.PamKlik[0]] - kolejkalosint.kolejkalosint[self.PamKlik[1]]) == (flagMemo6 ? LiczbaPar6 : LiczbaPar) {
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
                        .frame(width: SzerEkr > 500 ? SzerEkr / (flagMemo6 ? 8 : 6) : (flagMemo6 ? SzerEkr/6 - 2 : SzerEkr / 5), height: SzerEkr > 500 ? SzerEkr / (flagMemo6 ? 8 : 6) : (flagMemo6 ? SzerEkr/6 - 2 : SzerEkr / 5), alignment: .center)
                        .cornerRadius(buttonRadius)
                }.padding(.all, (flagMemo6 && SzerEkr <= 500 ? -3.0 : paddingImageBottom))
            }
}

struct PokazLinia6: View {
    var nrLinii: Int
    var NObrazWLinii: Int = 6
    @Binding var liczKlikPara: Int
    @Binding var kartaStan: [Int]
    @Binding var PamKlik: [Int]
    @Binding var liczKlik: Int
    @Binding var liczKlikOK: Int
    @Binding var IsTimerRunning: Bool
    @Binding var RotAngle: Double
    @Binding var flagMemo6: Bool

    var body: some View {
            HStack {
                PokazKarte6(nrObraz: (flagMemo6 ? 6 : 4) * nrLinii + 0, liczKlikPara: $liczKlikPara, kartaStan: $kartaStan, PamKlik: $PamKlik, liczKlik: $liczKlik, liczKlikOK: $liczKlikOK, IsTimerRunning: $IsTimerRunning, RotAngle: $RotAngle,flagMemo6: $flagMemo6)
                PokazKarte6(nrObraz: (flagMemo6 ? 6 : 4) * nrLinii + 1, liczKlikPara: $liczKlikPara, kartaStan: $kartaStan, PamKlik: $PamKlik, liczKlik: $liczKlik, liczKlikOK: $liczKlikOK, IsTimerRunning: $IsTimerRunning, RotAngle: $RotAngle,flagMemo6: $flagMemo6)
                PokazKarte6(nrObraz: (flagMemo6 ? 6 : 4) * nrLinii + 2, liczKlikPara: $liczKlikPara, kartaStan: $kartaStan, PamKlik: $PamKlik, liczKlik: $liczKlik, liczKlikOK: $liczKlikOK, IsTimerRunning: $IsTimerRunning, RotAngle: $RotAngle,flagMemo6: $flagMemo6)
                PokazKarte6(nrObraz: (flagMemo6 ? 6 : 4) * nrLinii + 3, liczKlikPara: $liczKlikPara, kartaStan: $kartaStan, PamKlik: $PamKlik, liczKlik: $liczKlik, liczKlikOK: $liczKlikOK, IsTimerRunning: $IsTimerRunning, RotAngle: $RotAngle,flagMemo6: $flagMemo6)
                if flagMemo6 {
                    PokazKarte6(nrObraz: 6 * nrLinii + 4, liczKlikPara: $liczKlikPara, kartaStan: $kartaStan, PamKlik: $PamKlik, liczKlik: $liczKlik, liczKlikOK: $liczKlikOK, IsTimerRunning: $IsTimerRunning, RotAngle: $RotAngle,flagMemo6: $flagMemo6)
                    PokazKarte6(nrObraz: 6 * nrLinii + 5, liczKlikPara: $liczKlikPara, kartaStan: $kartaStan, PamKlik: $PamKlik, liczKlik: $liczKlik, liczKlikOK: $liczKlikOK, IsTimerRunning: $IsTimerRunning, RotAngle: $RotAngle,flagMemo6: $flagMemo6)
                }
            }
    }
}

struct Memo6: View {
    @EnvironmentObject var kolejkalos: KolejkaLos
    @EnvironmentObject var kolejkalosint: KolejkaLosInt
    @EnvironmentObject var zakresgry: ZakresGry
    @Binding var flagMemo6: Bool
    @Binding var TylkoObrazy: Bool

    @State var i: Int = 0
    @State private var IsTimerRunning = true
    @State private var RotAngle: Double = 0
    @State var startTime = Date()
    @State private var timerString = "0.0"
    @State private var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @State private var liczKlik: Int = 0 // W przyszci licznik ruchów
    @State private var liczKlikOK6: Int = LiczbaPar6 // 21
    @State private var liczKlikOK: Int = LiczbaPar // 10
    @State private var liczKlikPara: Int = 0
    @State private var kartaStan: [Int] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    @State private var PamKlik: [Int] = [0,0,0,0]
    
    var body: some View {
            VStack {
                TopLine()
                if TylkoObrazy {
                    Text("GSPmemo zestaw \(jakiZestaw(zakres: zakresgry.zakresgry))")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(buttonTxtColor)
                        .padding(.vertical, 30.0)
                } else {
                    Text("GSPmemo \(jakiZakres(zakres: zakresgry.zakresgry))")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(buttonTxtColor)
                        .padding(.vertical, 30.0)
                }
                ZStack{
                    VStack {
                        
                        if flagMemo6 {
                            PokazLinia6(nrLinii: 0, liczKlikPara: $liczKlikPara, kartaStan: $kartaStan, PamKlik: $PamKlik, liczKlik: $liczKlik, liczKlikOK: $liczKlikOK6, IsTimerRunning: $IsTimerRunning, RotAngle: $RotAngle,flagMemo6: $flagMemo6)
                            PokazLinia6(nrLinii: 1, liczKlikPara: $liczKlikPara, kartaStan: $kartaStan, PamKlik: $PamKlik, liczKlik: $liczKlik, liczKlikOK: $liczKlikOK6, IsTimerRunning: $IsTimerRunning, RotAngle: $RotAngle,flagMemo6: $flagMemo6)
                            PokazLinia6(nrLinii: 2, liczKlikPara: $liczKlikPara, kartaStan: $kartaStan, PamKlik: $PamKlik, liczKlik: $liczKlik, liczKlikOK: $liczKlikOK6, IsTimerRunning: $IsTimerRunning, RotAngle: $RotAngle,flagMemo6: $flagMemo6)
                            PokazLinia6(nrLinii: 3, liczKlikPara: $liczKlikPara, kartaStan: $kartaStan, PamKlik: $PamKlik, liczKlik: $liczKlik, liczKlikOK: $liczKlikOK6, IsTimerRunning: $IsTimerRunning, RotAngle: $RotAngle,flagMemo6: $flagMemo6)
                            PokazLinia6(nrLinii: 4, liczKlikPara: $liczKlikPara, kartaStan: $kartaStan, PamKlik: $PamKlik, liczKlik: $liczKlik, liczKlikOK: $liczKlikOK6, IsTimerRunning: $IsTimerRunning, RotAngle: $RotAngle,flagMemo6: $flagMemo6)
                            PokazLinia6(nrLinii: 5, liczKlikPara: $liczKlikPara, kartaStan: $kartaStan, PamKlik: $PamKlik, liczKlik: $liczKlik, liczKlikOK: $liczKlikOK6, IsTimerRunning: $IsTimerRunning, RotAngle: $RotAngle,flagMemo6: $flagMemo6)
                            PokazLinia6(nrLinii: 6, liczKlikPara: $liczKlikPara, kartaStan: $kartaStan, PamKlik: $PamKlik, liczKlik: $liczKlik, liczKlikOK: $liczKlikOK6, IsTimerRunning: $IsTimerRunning, RotAngle: $RotAngle,flagMemo6: $flagMemo6)
                        }
                        else{
                            PokazLinia6(nrLinii: 0, liczKlikPara: $liczKlikPara, kartaStan: $kartaStan, PamKlik: $PamKlik, liczKlik: $liczKlik, liczKlikOK: $liczKlikOK, IsTimerRunning: $IsTimerRunning, RotAngle: $RotAngle,flagMemo6: $flagMemo6)
                            PokazLinia6(nrLinii: 1, liczKlikPara: $liczKlikPara, kartaStan: $kartaStan, PamKlik: $PamKlik, liczKlik: $liczKlik, liczKlikOK: $liczKlikOK, IsTimerRunning: $IsTimerRunning, RotAngle: $RotAngle,flagMemo6: $flagMemo6)
                            PokazLinia6(nrLinii: 2, liczKlikPara: $liczKlikPara, kartaStan: $kartaStan, PamKlik: $PamKlik, liczKlik: $liczKlik, liczKlikOK: $liczKlikOK, IsTimerRunning: $IsTimerRunning, RotAngle: $RotAngle,flagMemo6: $flagMemo6)
                            PokazLinia6(nrLinii: 3, liczKlikPara: $liczKlikPara, kartaStan: $kartaStan, PamKlik: $PamKlik, liczKlik: $liczKlik, liczKlikOK: $liczKlikOK, IsTimerRunning: $IsTimerRunning, RotAngle: $RotAngle,flagMemo6: $flagMemo6)
                            PokazLinia6(nrLinii: 4, liczKlikPara: $liczKlikPara, kartaStan: $kartaStan, PamKlik: $PamKlik, liczKlik: $liczKlik, liczKlikOK: $liczKlikOK, IsTimerRunning: $IsTimerRunning, RotAngle: $RotAngle,flagMemo6: $flagMemo6)
                        }
                        
                    }
                        VStack{
                            Text ("Brawo!")
                                .font(.system(size: SzerEkr > 500 ? 144 : 90))
                                .fontWeight(.bold)
                                .tracking(10)
                                .foregroundColor(.red)
                                .frame(width: WspSzer * SzerEkr, height: WspSzer * SzerEkr)
                                .rotationEffect(.degrees(RotAngle))
                                .opacity((flagMemo6 && liczKlikOK6 == 0) || (!flagMemo6 && liczKlikOK == 0) ? 1 : 0)
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
                     if flagMemo6 {
                         Text("\(self.liczKlikOK6)")
                             .fontWeight(.bold)
                             .foregroundColor(Color.red)
                             .padding(.trailing, 8.0)
                     }else {
                         Text("\(self.liczKlikOK)")
                             .fontWeight(.bold)
                             .foregroundColor(Color.red)
                             .padding(.trailing, 8.0)
                     }
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


struct Memo6_Previews: PreviewProvider {
    @State static var flagMemo6 = false
    @State static var TylkoObrazy = false

    static var previews: some View {
        Memo6(flagMemo6: $flagMemo6, TylkoObrazy: $TylkoObrazy)
    }
}
