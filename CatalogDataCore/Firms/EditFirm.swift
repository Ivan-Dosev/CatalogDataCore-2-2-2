//
//  EditFirm.swift
//  CatalogDataCore
//
//  Created by Ivan Dosev Dimitrov on 17.04.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//

import SwiftUI

struct EditFirm: View {
    
    @State private var floatFormatter : NumberFormatter = {
         let float = NumberFormatter()
         float.numberStyle = .decimal
         return float
     }()
     @Environment(\.presentationMode) var pMode
     @Environment(\.managedObjectContext) var moc
     @ObservedObject var milka : Becarstvo
     
     
     
     @State  var nameLecarstvo : String = ""
     @State  var nameFirma     : String = ""
     @State  var vidove        : String = ""
     @State  var optinal       : String = ""
    
    var body: some View {
                VStack {
                                List {
                       
                                           VStack {
                                       
                                            HStack {
                                                Text("lekarstvo :")
                                                Spacer()
                                                TextField("", text: $nameLecarstvo)
                                                       .foregroundColor(Color.red)
                                                       .font(.system(size: 18))
                                                    .padding()
                                            }
                                            HStack {
                                                Text("nameFirma :")
                                                Spacer()
                                                TextField("", text: $nameFirma)
                                                       .foregroundColor(Color.red)
                                                       .font(.system(size: 18))
                                                    .padding()
                                            }
                                            
                                            HStack {
                                                Text("vidove :")
                                                Spacer()
                                                     TextField("", text: $vidove)
                                                    .foregroundColor(Color.red)
                                                    .font(.system(size: 18))
                                                    .padding()
                                            }
                                            HStack {
                                                Text("optinal :")
                                                Spacer()
                                                 TextField("", text: $optinal)
                                                    .foregroundColor(Color.red)
                                                    .font(.system(size: 18))
                                                    .padding()
                                            }
                                            
                                               }
                                     }
                    
                                Button(action: {self.addItem()
                                                self.pMode.wrappedValue.dismiss()
                                    
                                }) {
                                         Text("save new")
                                            .padding()
                                            .foregroundColor(.black)
                                            .background(Color.blue)
                                            .cornerRadius(5)
                                            .padding()
                                 }
                }.onAppear(){
                    self.nameLecarstvo = self.milka.nameLecarstvo!
                    self.nameFirma     = self.milka.nameFirm!
                    self.vidove        = self.milka.vidove!
                    self.optinal       = self.milka.optinal!
                    }
            }//
   
     func saveItem() {
           do{
               try? moc.save()
           }catch{print(error)}
       }
       
       func addItem() {
          self.milka.nameLecarstvo = self.nameLecarstvo
          self.milka.nameFirm      = self.nameFirma
          self.milka.vidove        = self.vidove
          self.milka.optinal       = self.optinal

             saveItem()
       }
   
}
struct EditFirm_Previews: PreviewProvider {
    static var previews: some View {
        EditFirm(milka: Becarstvo())
    }
}
