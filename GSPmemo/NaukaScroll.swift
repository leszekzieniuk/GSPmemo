//
//  NaukaScroll.swift
//  PoznajGSP
//
//  Created by Leszek Zieniuk on 25/04/2021.
//

import SwiftUI

let WspSzeriPadHelp: Double = 0.6
let WspSzer: Double = 0.95
let HelpBkgColor: Color = Color(red: 255/256, green: 238/256, blue: 189/256, opacity: 0.94)
let RozwFileName: [String] = ["Rozw1-10","Rozw11-20","Rozw21-30","Rozw31-40","Rozw41-50","Rozw51-60","Rozw61-70","Rozw71-80","Rozw81-90","Rozw91-100","Rozw00-9"]
let HelpTxt = """
GSPmemo jest klasyczną grą MEMO, w której pary stanowią liczby i odpowiadające im obrazy z systemu GSP.
Na początku wybierz suwakiem zakres gry, czyli poszczególne 10-ki par obraz liczba zgodnie z informacją wyświetlaną w polu zakres. Po naciśniciu START lub przycisku PLAY umieszczonego na górze rozpoczyna się gra. Po odkryciu dwóch kart trzecie kliknięcie w dowolną kartę spowoduje ich zakrycie jeżeli nie stanowią one pary. Jeżeli odkryte karty stanowią parę, to w ich miejscu pojawią się puste pola.
Po zakresie "00 - 09" suwak pokaże zakres "plus". To zakres dla zaawansowanych. Plansza do odgadywania będzie miała 6 x 7 (42 karty). 21 par obraz - liczba za każdym razem jest losowana z pełnego zbioru 111 zakładek GSP.
Po wybraniu opcji 'Tylko pary obraz-obraz' gra przełącza się w tryb samych obrazów (bez liczb). Wtedy można ćwiczyć pamięć przestrzenna oraz uczyć mózg zakładek GSP nie znając jeszcze przyporządkowań liczba - obraz. Podobnie jak poprzednio wybieramy jeden z 11 zestawów. Jestteż w tym trybie dostepna opcja PLUS z 21 parami losowanych obrazów.
Na dole ekranu pokazywane są:
- Liczba prób znalezienia par
- Liczba par jeszcze nie odkrytych (do odgadnięcia)
- Czas w sekundach jaki minął od rozpoczęcia gry
Po odkryciu ostatniej pary zegar zatrzyma się i będziesz mógł sprawdzić jak szybko i w ilu krokach ukończyłeś zadanie. Teraz możesz powtórzyć grę dla tej samej 10-ki lub wybrać inną.
Po zamknięciu tego okna, zobaczysz mapowania wszystkich liczb GSP. Do gry wrócisz po naciśnięciu klawisza WRÓĆ u góry ekranu.
(Akademia Pamięci, GSPmemo v:2.12)
"""

struct TopLineNauka: View {
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

struct NaukaScroll: View {
    @State private var isHelpTxt = true
    
    var body: some View {
        VStack {
            TopLineNauka ()
            ZStack{
                ScrollView(.vertical, showsIndicators: false)
                {
                    VStack (alignment: .center, spacing: 0){
                        Group{
                            Image(RozwFileName[0])
                                .resizable()
                                .scaledToFit()
                            Image(RozwFileName[1])
                                .resizable()
                                .scaledToFit()
                            Image(RozwFileName[2])
                                .resizable()
                                .scaledToFit()
                            Image(RozwFileName[3])
                                .resizable()
                                .scaledToFit()
                            Image(RozwFileName[4])
                                .resizable()
                                .scaledToFit()
                            Image(RozwFileName[5])
                                .resizable()
                                .scaledToFit()
                            Image(RozwFileName[6])
                                .resizable()
                                .scaledToFit()
                            Image(RozwFileName[7])
                                .resizable()
                                .scaledToFit()
                            Image(RozwFileName[8])
                                .resizable()
                                .scaledToFit()
                            Image(RozwFileName[9])
                                .resizable()
                                .scaledToFit()
                        }
                            .frame(width: SzerEkr > 500 ? SzerEkr * WspSzeriPadHelp : SzerEkr * WspSzer)
                        Image("Rozw00-9")
                            .resizable()
                            .scaledToFit()
                            .frame(width: SzerEkr > 500 ? SzerEkr * WspSzeriPadHelp : SzerEkr * WspSzer)
                        Group{
                            Image("rozw1")
                                .resizable()
                                .scaledToFit()
                            Image("rozw2")
                                .resizable()
                                .scaledToFit()
                        }
                        .frame(width: SzerEkr > 500 ? SzerEkr * WspSzeriPadHelp : SzerEkr * WspSzer)
                    }
                }
                .scaledToFit()
                if isHelpTxt {
                    VStack {
               //         Spacer()
                        ScrollView(.vertical, showsIndicators: false) {
                            Text(HelpTxt)
                                .font(.body)
                                .foregroundColor(Color("ColorTxtZwykly"))
                        }
                //       Spacer()
                        Button(action: {
                            isHelpTxt = false
                        }) {
                            Text("zamknij")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(buttonTxtColor)
                                .padding(.horizontal, 8.0)
                                .border(Color.black, width: 1)
                                .background(buttonColor)
                                .cornerRadius(3)
                        }
                        Spacer()
                    }
                    .padding(6.0)
                    .frame(width: WspSzer * SzerEkr, height: 0.8 * WysEkr, alignment: .center)
                    .background(HelpBkgColor)
                    .cornerRadius(7)
                }
            }
        }
        .background(
            VStack {
                HStack {
                    Spacer ()
                    Image ("TloGranat")
                     //   .resizable()
                     //   .scaledToFit()
                     //   .frame(alignment: .topTrailing)
                        .opacity(TloOpacity)
                }
                Spacer ()
                HStack {
                    Image ("TloZolty")
                     //   .resizable()
                     //   .scaledToFit()
                     //   .frame(alignment: .topTrailing)
                        .opacity(TloOpacity)
                    Spacer ()
                }
        }
        .background(Color.white)
        )
    }
}

struct NaukaScroll_Previews: PreviewProvider {
    static var previews: some View {
        NaukaScroll()
    }
}
