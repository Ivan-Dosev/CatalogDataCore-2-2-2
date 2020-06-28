//
//  EditItem.swift
//  CatalogDataCore
//
//  Created by Ivan Dosev Dimitrov on 28.03.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//

import SwiftUI

struct EditItem: View {
    
  //  var model =  Model()

    
     var grupa      : String
     var lekarstvo  : String
     var fromMin    : Float
     var toMin      : Float
     var isMin      : Bool
     var fromMax    : Float
     var toMax      : Float
     var isMax      : Bool
     var kgPazient  : Int32
     var goPazient  : Int32
     var maxDoza    : Float
     var firstDoza  : Float
     var priemI     : Int32
     var priemII    : Int32
     var mjarka     : String
     var opis       : String


    var body: some View {
        VStack {
            
            List {
               
                                   VStack {
                               
                                    HStack {
                                        Text("grupa :")
                                        Spacer()
                                        Text("\(grupa)")
                                               .foregroundColor(Color.red)
                                               .font(.system(size: 18))
                                            .padding()
                                    }
                                    HStack {
                                        Text("lekarstvo :")
                                        Spacer()
                                        Text("\(lekarstvo)")
                                               .foregroundColor(Color.red)
                                               .font(.system(size: 18))
                                            .padding()
                                    }
                                    
                                           HStack {
                                               Text("fromMin :" + String(format: "%.0f", fromMin))
                                               Text("toMin :" + String(format: "%.0f", toMin))
                                               Text("isMin :" + String( isMin))
                                           }.background(Color.yellow)
                                            .padding()
                                         
                                
                                       HStack {
                                           Text("fromMax :" + String(format: "%.0f", fromMax))
                                           Text("toMax :" + String(format: "%.0f", toMax))
                                           Text("isMax :" + String( isMax))
                                       }.background(Color.yellow)
                                        .padding()

                                    
                                    HStack {
                                            Text("kgPazient :\(kgPazient)" )
                                            Text("  goPazient :\(goPazient)" )
                                           
                                    }.padding()
                                    HStack {
                                            Text("maxDoza :" + String(format: "%.0f", maxDoza))
                                            Text("  firstDoza :" + String(format: "%.0f", firstDoza) )
                                                                 
                                    }.padding()
                                       


                                       Text("priemI:   \(priemI)  : priemII:   \(priemII)")
                                          .foregroundColor(Color.orange)
                                          .padding()
                                       Text("opis       :\(opis)")
                                          .padding()
                                       Text("mjarka     :\(mjarka)")
                                          .padding()
                                   }
                               }
           


        
            
        }
    }
}


