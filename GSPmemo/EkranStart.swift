//
//  EkranStart.swift
//  PoznajGSP
//
//  Created by Leszek Zieniuk on 25/04/2021.
//

import SwiftUI

let WysEkr: Double = UIScreen.main.bounds.size.height
let SzerEkr: Double = UIScreen.main.bounds.size.width
let obrazStartWys: CGFloat = 330
let LiczbaPar = 10
let LiczbaPar6 = 21
let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()

func Losuj (zakres: Int, TylkoObrazy: Bool) -> ([String],[Int]) {
    var ListaOrg: [String] = []
    var ListaLiczb: [String] = []
    let ListaDoLos: [String] = ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100","00","01","02","03","04","05","06","07","08","09"]
    let ListaLicznik6: [Int] = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]
    var ListaDoLosInt: [Int] = []
    var ListaWylos18: [Int] = []

    var outputStr: [String] = []
    var outputInt: [Int] = []
    var OrgInt: [Int] = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]
    var OrgInt6: [Int] = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41]
    var n: Int
    var i, k: Int // j - wylosowana pozycja w ciągu z liczbami

    switch zakres {
        case 1: ListaOrg = ["1","2","3","4","5","6","7","8","9","10"]
        case 2: ListaOrg = ["11","12","13","14","15","16","17","18","19","20"]
        case 3: ListaOrg = ["21","22","23","24","25","26","27","28","29","30"]
        case 4: ListaOrg = ["31","32","33","34","35","36","37","38","39","40"]
        case 5: ListaOrg = ["41","42","43","44","45","46","47","48","49","50"]
        case 6: ListaOrg = ["51","52","53","54","55","56","57","58","59","60"]
        case 7: ListaOrg = ["61","62","63","64","65","66","67","68","69","70"]
        case 8: ListaOrg = ["71","72","73","74","75","76","77","78","79","80"]
        case 9: ListaOrg = ["81","82","83","84","85","86","87","88","89","90"]
        case 10: ListaOrg = ["91","92","93","94","95","96","97","98","99","100"]
        case 11: ListaOrg = ["00","01","02","03","04","05","06","07","08","09"]
        case 12: ListaOrg = []
        default: ListaOrg = ["1","2","3","4","5","6","7","8","9","10"]
    }
    if zakres == 12 {
        i = 0
        for (_) in ListaDoLos { // Buduje listę 111 liczb
            ListaDoLosInt.append(i)
            i += 1
           }
        
        n = ListaDoLosInt.count - 1
        for (_) in ListaLicznik6 { // Losuje 21 liczb ze 111 zakładek
            i = Int.random(in: 0...n)
            k = ListaDoLosInt[i]
            n -= 1
            ListaWylos18.append(k)
            ListaDoLosInt.remove(at: i)
        }
        
        n = OrgInt6.count - 1
        ListaLiczb = ListaOrg
        if TylkoObrazy {
            for (_) in OrgInt6 {
                i = Int.random(in: 0...n)
                k = OrgInt6[i]
                n -= 1
               
                outputStr.append(k < LiczbaPar6 ? "pic" + ListaDoLos[ListaWylos18[k]] : "pic" + ListaDoLos[ListaWylos18[k - LiczbaPar6]])
                outputInt.append(k)
                OrgInt6.remove(at: i)
            }
        } else {
            for (_) in OrgInt6 {
                i = Int.random(in: 0...n)
                k = OrgInt6[i]
                n -= 1
               
                outputStr.append(k < LiczbaPar6 ? "pic" + ListaDoLos[ListaWylos18[k]] : "licz" + ListaDoLos[ListaWylos18[k - LiczbaPar6]])
                outputInt.append(k)
                OrgInt6.remove(at: i)
            }
        }
        
    }else {
        n = OrgInt.count - 1
        ListaLiczb = ListaOrg
        if TylkoObrazy {
            for (_) in OrgInt {
                i = Int.random(in: 0...n)
                k = OrgInt[i]
                n -= 1
               
                outputStr.append(k < LiczbaPar ? "pic" + ListaOrg[k] : "pic" + ListaLiczb[k - LiczbaPar])
                outputInt.append(k)
                OrgInt.remove(at: i)
            }
        } else {
            for (_) in OrgInt {
                i = Int.random(in: 0...n)
                k = OrgInt[i]
                n -= 1
               
                outputStr.append(k < LiczbaPar ? "pic" + ListaOrg[k] : "licz" + ListaLiczb[k - LiczbaPar])
                outputInt.append(k)
                OrgInt.remove(at: i)
            }
        }
        
    }
    return (outputStr, outputInt)
}

func jakiZakres(zakres: Int) -> String {
    
    switch zakres {
        case 1: return "1 - 10"
        case 2: return "11 - 20"
        case 3: return "21 - 30"
        case 4: return "31 - 40"
        case 5: return "41 - 50"
        case 6: return "51 - 60"
        case 7: return "61 - 70"
        case 8: return "71 - 80"
        case 9: return "81 - 90"
        case 10: return "91 - 100"
        case 11: return "00 - 09"
        case 12: return "plus"
        default: return "skucha"
    }
}

func jakiZestaw(zakres: Int) -> String {
    
    switch zakres {
        case 1: return "0"
        case 2: return "1"
        case 3: return "2"
        case 4: return "3"
        case 5: return "4"
        case 6: return "5"
        case 7: return "6"
        case 8: return "7"
        case 9: return "8"
        case 10: return "9"
        case 11: return "10"
        case 12: return "plus"
        default: return "skucha"
    }
}

class KolejkaLos: ObservableObject {
    @Published var kolejkalos = [""]
}

class KolejkaLosInt: ObservableObject {
    @Published var kolejkalosint: [Int] = []
}

struct TopLineEkSt: View {
    @EnvironmentObject var strona: NrStrony
    @EnvironmentObject var zakresgry: ZakresGry
    @EnvironmentObject var kolejkalos: KolejkaLos
    @EnvironmentObject var kolejkalosint: KolejkaLosInt
    @Binding var flagMemo6: Bool
    @Binding var TylkoObrazy: Bool

    var body: some View {
            HStack {
                Image(/*@START_MENU_TOKEN@*/"Logo APam granat")
                Spacer()
                Button(action: {
                    (kolejkalos.kolejkalos, kolejkalosint.kolejkalosint) = Losuj(zakres: zakresgry.zakresgry, TylkoObrazy: TylkoObrazy)
                    flagMemo6 = zakresgry.zakresgry == 12 ? true : false
                    self.strona.nrStrony = 2
                }) {
                    Image("keyPlay")
                        .resizable()
                        .scaledToFit()
                        .frame(width: buttonRozm, height: buttonRozm, alignment: .center)
                        .cornerRadius(5)
                }
                Button(action: {self.strona.nrStrony = 4 }) {
                    Image("keyPytaj")
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

class ZakresGry: ObservableObject {
    @Published var zakresgry: Int = 5
}

struct EkranStart: View {
    @Binding var sliderValue: Double
    @Binding var flagMemo6: Bool
    @Binding var TylkoObrazy: Bool

    @State private var isEditing = false
    @EnvironmentObject var strona: NrStrony
    @EnvironmentObject var zakresgry: ZakresGry
    @EnvironmentObject var kolejkalos: KolejkaLos
    @EnvironmentObject var kolejkalosint: KolejkaLosInt

    var body: some View {
        VStack {
            TopLineEkSt (flagMemo6: $flagMemo6, TylkoObrazy: $TylkoObrazy)
            Group {
                Text("GSPmemo (10)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(buttonTxtColor)
                    .padding(.top, 30.0)
                Spacer()
                if TylkoObrazy {
                    HStack {
                        Text("Zestaw:")
                            .font(isEditing ? .title3 : .callout)
                            .fontWeight(.light)
                            .foregroundColor(isEditing ? Color("ColorTxtSkala") : Color("ColorTxtZwykly"))
                        Text(jakiZestaw(zakres: Int(self.sliderValue)))
                            .fontWeight(.bold)
                            .font(isEditing ? .title3 : .callout)
                            .foregroundColor(isEditing ? Color("ColorTxtSkala") : Color("ColorTxtZwykly"))
                    }
                    .frame(width: 180.0, height: 35.0)
                    .background(isEditing ? Color("ColorBkgSkala") : BialyColor)
                    .cornerRadius(5)
                } else {
                    HStack {
                        Text("Zakres:")
                            .font(isEditing ? .title3 : .callout)
                            .fontWeight(.light)
                            .foregroundColor(isEditing ? Color("ColorTxtSkala") : Color("ColorTxtZwykly"))
                        Text(jakiZakres(zakres: Int(self.sliderValue)))
                            .fontWeight(.bold)
                            .font(isEditing ? .title3 : .callout)
                            .foregroundColor(isEditing ? Color("ColorTxtSkala") : Color("ColorTxtZwykly"))
                    }
                    .frame(width: 180.0, height: 35.0)
                    .background(isEditing ? Color("ColorBkgSkala") : BialyColor)
                    .cornerRadius(5)
                }
                
                HStack {
                    Slider(value: self.$sliderValue, in: 1...12, onEditingChanged: {editing in
                        isEditing = editing
                        zakresgry.zakresgry = Int(self.sliderValue)
                    })
                    .accentColor(buttonTxtColor)
                    .colorMultiply(buttonColor)
                }
                .padding(.horizontal, 20.0)
            }
            if TylkoObrazy {
                Text("Wybierz zestaw")
                    .font(.callout)
                    .fontWeight(.light)
                    .foregroundColor(Color("ColorTxtZwykly"))
            }else {
                Text("Wybierz zakres")
                    .font(.callout)
                    .fontWeight(.light)
                    .foregroundColor(Color("ColorTxtZwykly"))
                  //  .padding(.bottom, 10.0)
            }
            
            Toggle(isOn: self.$TylkoObrazy) {
                Text("Tylko pary obraz-obraz")
                    .font(.callout)
                    .fontWeight(TylkoObrazy ? /*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/ : .regular)
                    .foregroundColor(TylkoObrazy ? Color.red : Color.black)
            }
            .scaleEffect(0.9)
//            .toggleStyle(SwitchToggleStyle(tint: buttonTxtColor))
            .toggleStyle(SwitchToggleStyle(tint: Color.red))

            .onChange(of: TylkoObrazy) { value in
                //self.flagOdLiczb = !self.flagOdObrazow
                //obraz_liczba.OdObrazow = self.flagOdObrazow
            }
            Spacer()
            Button(action: {
                (kolejkalos.kolejkalos, kolejkalosint.kolejkalosint) = Losuj(zakres: zakresgry.zakresgry, TylkoObrazy: TylkoObrazy)
                flagMemo6 = zakresgry.zakresgry == 12 ? true : false
                self.strona.nrStrony = 2
            }) {
                Text("START")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(buttonTxtColor)
                    .padding(.horizontal, 10.0)
                    .border(buttonColor, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .background(buttonColor)
                    .cornerRadius(7)
            }
            Spacer()
            Image("memo_banner")
                .resizable()
                .scaledToFit()
                .frame(width: SzerEkr > 500 ? SzerEkr * 0.7 : SzerEkr * WspSzer, height: SzerEkr > 500 ? SzerEkr * 0.7 : WysEkr > 700 ? SzerEkr * 1.1 * WspSzer : SzerEkr * 0.9 * WspSzer, alignment: .center)
                .padding(.bottom, 2.0)
            Spacer()
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
            .background(Color.white))
    }
}

struct EkranStart_Previews: PreviewProvider {
    @State static var sliderV = 1.0
    @State static var flagMemo6 = false
    @State static var TylkoObrazy = false

    static var previews: some View {
        EkranStart(sliderValue: $sliderV, flagMemo6: $flagMemo6, TylkoObrazy: $TylkoObrazy)
    }
}
