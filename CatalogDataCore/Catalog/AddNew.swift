//
//  AddNew.swift
//  CatalogDataCore
//
//  Created by Ivan Dosev Dimitrov on 28.03.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//

import SwiftUI

struct AddNew: View {
    
    var onEditingChanged: (Bool) -> Void = {_ in}
    var onCommit:() -> Void = {}
    
    private var floatFormatter : NumberFormatter = {
        let float = NumberFormatter()
        float.numberStyle = .decimal
        return float
    }()
  
    @Environment(\.presentationMode) var pMode
    @Environment(\.managedObjectContext) var moc
    
    @State private var grupa      : String = ""
    @State private var lekarstvo  : String = ""
    @State public  var fromMin    : Float  = 0
    @State public  var toMin      : Float  = 0
    @State private var isMin      : Bool   = false
    @State public  var fromMax    : Float  = 0
    @State public  var toMax      : Float  = 0
    @State public  var isMax      : Bool   = false
    @State public  var kgPazient  : Int32  = 0
    @State public  var goPazient  : Int32  = 0
    @State public  var maxDoza    : Float  = 0
    @State public  var firstDoza  : Float  = 0
    @State public  var priemI     : Int32  = 0
    @State public  var priemII    : Int32  = 0
    @State public  var mjarka     : String = ""
    @State public  var opis       : String = ""
    
    var body: some View {
        
     //   NavigationView {
            Form {
                Section{
                    VStack{
                        TextField("име на група ...", text: self.$grupa)
                            .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .shadow(color: .gray, radius: 5)
                         TextField("име на лекарство  ...", text: self.$lekarstvo)
                             .padding()
                             .textFieldStyle(RoundedBorderTextFieldStyle())
                             .shadow(color: .gray, radius: 5)
                    }
                }
                // min
                Section{
                    VStack{
                         HStack {
                             ZStack {
                        
                                TextField("ОТ в долната граница",  value: self.$fromMin,formatter: floatFormatter)
                                             .textFieldStyle(RoundedBorderTextFieldStyle())
                                             .shadow(color: .gray, radius: 5)
                                             .border(Color(.white), width: 2)
                                             .keyboardType(.numbersAndPunctuation)
                                
                                 Text("от")
                                     .offset(x: 40)
                                     .foregroundColor(.red)
                                    }

                             ZStack {
                                TextField("ДО в долната граница",  value: self.$toMin, formatter: floatFormatter)
                                       .textFieldStyle(RoundedBorderTextFieldStyle())
                                       .shadow(color: .gray, radius: 5)
                                       .border(Color(.white), width: 2)
                                       .keyboardType(.numbersAndPunctuation)
                                 Text("до")
                                     .offset(x: 40)
                                     .foregroundColor(.red)
                                    }

                            Toggle(isOn: $isMin){
                                 Text("is kg min")
                                    }
                        }
                    }
                }
                //  max
                Section{
                    VStack{
                         HStack {
                             ZStack {
                        
                                TextField("ОТ в долната граница",  value: self.$fromMax,formatter: floatFormatter)
                                             .textFieldStyle(RoundedBorderTextFieldStyle())
                                             .shadow(color: .gray, radius: 5)
                                             .border(Color(.white), width: 2)
                                             .keyboardType(.numbersAndPunctuation)
                                
                                 Text("от")
                                     .offset(x: 40)
                                     .foregroundColor(.red)
                                    }

                             ZStack {
                                TextField("ДО в долната граница",  value: self.$toMax, formatter: floatFormatter)
                                         .textFieldStyle(RoundedBorderTextFieldStyle())
                                         .shadow(color: .gray, radius: 5)
                                         .border(Color(.white), width: 2)
                                         .keyboardType(.numbersAndPunctuation)
                                 Text("до")
                                     .offset(x: 40)
                                     .foregroundColor(.red)
                                    }

                            Toggle(isOn: $isMax){
                                 Text("is kg max")
                                    }
                        }
                    }
                }
             // kg pazient
                Section {
                    HStack {
                        ZStack {
                            TextField("килограми на пациента",  value: self.$kgPazient, formatter: floatFormatter)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .shadow(color: .gray, radius: 5)
                                    .keyboardType(.numbersAndPunctuation)
                            Text("kg")
                             .offset(x:80)
                             .foregroundColor(.red)
                            
                        }
                        ZStack {
                            
                            TextField("години на пациента",  value: self.$goPazient, formatter: floatFormatter)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .shadow(color: .gray, radius: 5)
                                    .keyboardType(.numbersAndPunctuation)
                            Text("god")
                                .offset(x:70)
                             .foregroundColor(.red)
                        }
                    }
                }
                .padding(.leading, 5)
                .padding(.trailing, 5)
               // doza
                Section {
                    HStack {
                        ZStack {
                            TextField("максимална диза",  value: self.$maxDoza, formatter: floatFormatter)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .shadow(color: .gray, radius: 5)
                                .keyboardType(.numbersAndPunctuation)
                            Text("max doza")
                             .offset(x:55)
                             .foregroundColor(.red)
                            
                        }
                        ZStack {
                            
                            TextField("първа доза",  value: self.$firstDoza, formatter: floatFormatter)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .shadow(color: .gray, radius: 5)
                                .keyboardType(.numbersAndPunctuation)
                            Text("първа")
                                .offset(x:60)
                                .foregroundColor(.red)
                        }
                    }
                }
                
                .padding(.leading, 5)
                .padding(.trailing, 5)
                
                // priemI priemII mjarka
                Section {
                    HStack {
                        ZStack {
                            TextField("начин на прием I",  value: self.$priemI, formatter: floatFormatter)
                                 .textFieldStyle(RoundedBorderTextFieldStyle())
                                 .shadow(color: .gray, radius: 5)
                                 .keyboardType(.numbersAndPunctuation)
                            Text("прием I")
                             .offset(x:25)
                             .foregroundColor(.red)
                            
                        }
                        ZStack {
                            
                            TextField("начин на прием II",  value: self.$priemII, formatter: floatFormatter)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .shadow(color: .gray, radius: 5)
                                .keyboardType(.numbersAndPunctuation)
                            Text("прием II")
                                .offset(x:25)
                                .foregroundColor(.red)
                        }
                        TextField(" мерна единица на лекарството", text: self.$mjarka, onEditingChanged: self.onEditingChanged, onCommit: self.onCommit)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .shadow(color: .gray, radius: 5)
                          
                    }
                }
                .padding(.leading, 5)
                .padding(.trailing, 5)
                
                // opisanie
                
                Section {
                    TextField(" описание на приема в текст", text: self.$opis,onEditingChanged: self.onEditingChanged,onCommit: self.onCommit)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .shadow(color: .gray, radius: 5)
                  
                }
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                
                // button
                Section {
                    HStack{
                       Spacer()
                       Button(action: {

                        self.addItem()
                        self.pMode.wrappedValue.dismiss()
                        
                       }) {
                           Text("Save to Buffer")
                               .font(.system(size: 20))
                               .foregroundColor(.white)
                               .padding()
                               .background(Color(.blue))
                       }
                         Spacer()
                    }
                    }
                
                
            }
          
      //  } //NavigationView
     
    }
    func saveItem() {
        do{
            try? moc.save()
        }catch{print(error)}
    }
    
    func addItem() {
        let add = Lekarstvo(context: self.moc)
     
        
          add.kgPazient = self.kgPazient
          add.goPazient = self.goPazient
          add.fromMin   = self.fromMin
          add.toMin     = self.toMin
          add.fromMax   = self.fromMax
          add.toMax     = self.toMax
          add.isMin     = self.isMin
          add.isMax     = self.isMax
          add.mjarka    = self.mjarka
          add.maxDoza   = self.maxDoza
          add.firstDoza = self.firstDoza
          add.priemI    = self.priemI
          add.priemII   = self.priemII
          add.opis      = self.opis
          add.lekarstvo = self.lekarstvo
          add.grupa     = self.grupa
   
          saveItem()
    }
    
}

struct AddNew_Previews: PreviewProvider {
    static var previews: some View {
        AddNew()
    }
}


