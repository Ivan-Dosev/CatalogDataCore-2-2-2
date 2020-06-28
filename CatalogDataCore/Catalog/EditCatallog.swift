//
//  EditCatallog.swift
//  CatalogDataCore
//
//  Created by Ivan Dosev Dimitrov on 7.04.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//

import SwiftUI

struct EditCatallog: View {
    
  //  var onEditingChanged: (Bool) -> Void = {_ in}
  //  var onCommit:() -> Void = {}
    
    @State private var floatFormatter : NumberFormatter = {
        let float = NumberFormatter()
        float.numberStyle = .decimal
        return float
    }()
    @Environment(\.presentationMode) var pMode
    
    @Environment(\.managedObjectContext) var moc
    @ObservedObject var bilka : Lekarstvo
    
    
    @State  var grupa      : String = ""
    @State  var lekarstvo  : String = ""
    @State  var fromMin    : CGFloat  = 0.0
    @State  var toMin      : CGFloat  = 0.0
    @State  var isMin      : Bool   = false
    @State  var fromMax    : CGFloat  = 0.0
    @State  var toMax      : CGFloat  = 0.0
    @State  var isMax      : Bool   = false
    @State  var kgPazient  : Int32  = 0
    @State  var goPazient  : Int32  = 0
    @State  var maxDoza    : CGFloat  = 0.0
    @State  var firstDoza  : CGFloat  = 0.0
    @State  var priemI     : Int32  = 0
    @State  var priemII    : Int32  = 0
    @State  var mjarka     : String = ""
    @State  var opis       : String = ""
    
    var body: some View {
        
        VStack {
            List {
                
                VStack {
                    HStack {
                        Text("grupa :")
                        Spacer()
                            
                        TextField("", text: $grupa)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color.red)
                            .font(.system(size: 18))
                            .padding()
                            .shadow(color: .gray, radius: 5)
                    }
                    HStack {
                        Text("lekarstvo :")
                        Spacer()
                        TextField("", text: $lekarstvo)
                               .textFieldStyle(RoundedBorderTextFieldStyle())
                               .foregroundColor(Color.red)
                               .font(.system(size: 18))
                               .padding()
                               .shadow(color: .gray, radius: 5)
                    }
                    HStack {
                        Text("ОТ:")
                        TextField("ОТ в долната граница",  value: self.$fromMin,formatter: floatFormatter)
                               .textFieldStyle(RoundedBorderTextFieldStyle())
                               .foregroundColor(Color.yellow)
                               .font(.system(size: 16))
                               .padding()
                               .shadow(color: .gray, radius: 5)
                        Text("ДО:")
                        TextField("ДО в долната граница",  value: self.$toMin,formatter: floatFormatter)
                               .textFieldStyle(RoundedBorderTextFieldStyle())
                               .foregroundColor(Color.yellow)
                               .font(.system(size: 16))
                               .padding()
                               .shadow(color: .gray, radius: 5)
                        Toggle(isOn: $isMin){ Text("is kg min")}
                    }
                    HStack {
                        Text("ОТ:")
                        TextField("ОТ в горна граница",  value: self.$fromMax,formatter: floatFormatter)
                               .textFieldStyle(RoundedBorderTextFieldStyle())
                               .foregroundColor(Color.yellow)
                               .font(.system(size: 16))
                               .padding()
                               .shadow(color: .gray, radius: 5)
                        Text("ДО:")
                        TextField("ДО в горна граница",  value: self.$toMax,formatter: floatFormatter)
                               .textFieldStyle(RoundedBorderTextFieldStyle())
                               .foregroundColor(Color.yellow)
                               .font(.system(size: 16))
                               .padding()
                               .shadow(color: .gray, radius: 5)
                        Toggle(isOn: $isMax){ Text("is kg max")}
                    }
                    HStack {
                        ZStack {
                            TextField("килограми на пациента",  value: self.$kgPazient, formatter: floatFormatter)
                                  .textFieldStyle(RoundedBorderTextFieldStyle())
                                  .keyboardType(.numbersAndPunctuation)
                                  .shadow(color: .gray, radius: 5)
                            Text("kg")
                             .offset(x:80)
                             .foregroundColor(.red)
                            
                        }
                        ZStack {
                            
                            TextField("години на пациента",  value: self.$goPazient, formatter: floatFormatter)
                              .textFieldStyle(RoundedBorderTextFieldStyle())
                              .keyboardType(.numbersAndPunctuation)
                              .shadow(color: .gray, radius: 5)
                            Text("god")
                                .offset(x:70)
                             .foregroundColor(.red)
                        }
                        .padding(.leading, 5)
                        .padding(.trailing, 5)
                    }
                    HStack {
                        ZStack {
                            TextField("максимална диза",  value: self.$maxDoza, formatter: floatFormatter)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numbersAndPunctuation)
                                .shadow(color: .gray, radius: 5)
                            Text("max doza")
                             .offset(x:55)
                             .foregroundColor(.red)
                            
                        }
                        ZStack {
                            
                            TextField("първа доза",  value: self.$firstDoza, formatter: floatFormatter)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numbersAndPunctuation)
                                .shadow(color: .gray, radius: 5)
                            Text("първа")
                                .offset(x:60)
                                .foregroundColor(.red)
                        }
                        .padding(.leading, 5)
                        .padding(.trailing, 5)
                    }
                    HStack {
                        ZStack {
                            TextField("начин на прием I",  value: self.$priemI, formatter: floatFormatter)
                                 .textFieldStyle(RoundedBorderTextFieldStyle())
                                 .keyboardType(.numbersAndPunctuation)
                                 .shadow(color: .gray, radius: 5)
                            Text("прием I")
                             .offset(x:25)
                             .foregroundColor(.red)
                            
                        }
                        ZStack {
                            
                            TextField("начин на прием II",  value: self.$priemII, formatter: floatFormatter)
                              .textFieldStyle(RoundedBorderTextFieldStyle())
                              .keyboardType(.numbersAndPunctuation)
                              .shadow(color: .gray, radius: 5)
                            Text("прием II")
                                .offset(x:25)
                                .foregroundColor(.red)
                        }
                        TextField(" мерна единица на лекарството", text: self.$mjarka)
                             .textFieldStyle(RoundedBorderTextFieldStyle())
                             .padding()
                             .clipShape(RoundedRectangle(cornerRadius: 10))
                             .shadow(color: .gray, radius: 5)
                          
                    }
                        TextField(" описание на приема в текст", text: self.$opis)
                           .padding(.leading, 10)
                           .padding(.trailing, 10)
                           .textFieldStyle(RoundedBorderTextFieldStyle())
                           .keyboardType(.numbersAndPunctuation)
                           .shadow(color: .gray, radius: 5)
 
                    
                    
                }
            }
            Spacer()
            Button(action: { self.addItem()
                             self.pMode.wrappedValue.dismiss()

                
            }) {
                Text("save new")
                    .padding()
                    .foregroundColor(.black)
                    .background(Color.blue)
                    .cornerRadius(5)
                    .padding()
               
            }
            
            
        }.onAppear(perform: {
            self.grupa     = self.bilka.grupa!
            self.lekarstvo = self.bilka.lekarstvo!
            self.fromMin   = CGFloat(self.bilka.fromMin)
            self.toMin     = CGFloat(self.bilka.toMin)
            self.fromMax   = CGFloat(self.bilka.fromMax)
            self.toMax     = CGFloat(self.bilka.toMax)
            self.isMin     = self.bilka.isMin
            self.isMax     = self.bilka.isMax
            self.kgPazient = self.bilka.kgPazient
            self.goPazient = self.bilka.goPazient
            self.maxDoza   = CGFloat(self.bilka.maxDoza)
            self.firstDoza = CGFloat(self.bilka.firstDoza)
            self.priemI    = self.bilka.priemI
            self.priemII   = self.bilka.priemII
            self.mjarka    = self.bilka.mjarka!
            self.opis      = self.bilka.opis!
        })
    }
     func saveItem() {
         do{
             try? moc.save()
         }catch{print(error)}
     }
     
     func addItem() {
        
        self.bilka.grupa       = self.grupa
        self.bilka.lekarstvo   = self.lekarstvo
        self.bilka.fromMin     = Float(self.fromMin)
        self.bilka.toMin       = Float(self.toMin)
        self.bilka.fromMax     = Float(self.fromMax)
        self.bilka.toMax       = Float(self.toMax)
        self.bilka.isMin       = self.isMin
        self.bilka.isMax       = self.isMax
        self.bilka.kgPazient   = self.kgPazient
        self.bilka.goPazient   = self.goPazient
        self.bilka.maxDoza     = Float(self.maxDoza)
        self.bilka.firstDoza   = Float(self.firstDoza)
        self.bilka.priemI      = self.priemI
        self.bilka.priemII     = self.priemII
        self.bilka.mjarka      = self.mjarka
        self.bilka.opis        = self.opis

           saveItem()
     }
}

struct EditCatallog_Previews: PreviewProvider {
    static var previews: some View {
        EditCatallog( bilka: Lekarstvo())
    }
}
