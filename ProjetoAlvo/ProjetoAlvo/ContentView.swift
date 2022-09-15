//
//  ContentView.swift
//  ProjetoAlvo
//
//  Created by Fabrizio  Borelli on 08/09/22.
//

import SwiftUI

struct ContentView: View {
    
    //    @State var target : Int = Int.random(in: 1...100)
    //    @State var points : Int = 0
    //    @State var pointsDifference : Int = 0
    
    //@State var sliderNumber : Double = 50.0
    @State var game : Game  = Game()
    
    @State var isAlertVisible :Bool = false
    
    @State var slideValue : Double = 50.0
    
    @State var isShowSecondScreen : Bool = false
    
    var body: some View {
        
        VStack{
            VStack{
                
                if game.points > 0 {
                    Text("Points \(game.points)")
                        .opacity(0.5)
                        .foregroundColor(.blue)
                }
                
                
                //Text("Diff \(game.pointsDifference)")
                //                Text("Acerte um número")
                //                    .opacity(0.5)
                //                    .foregroundColor(.blue)
                
                StructView(text: "Hello")
                
                AcerteNumText(color: .black, text: "Diff \(game.pointsDifference)")
                
                AcerteNumText(color: Color("lightBlue"), text: "Acerte um número")
                
                
                SliderView(sliderNumber: $slideValue)
                
            }
            
            VStack{
                Text("\(game.target)")
            }
            
            //            HStack{
            //                Text("1")
            //                Slider(value: $sliderNumber, in: 1...100)
            //                Text("100")
            //            }
            
            HStack{
                
                AcerteiButton(slideValue : $slideValue, game:$game, isAlertVisible: $isAlertVisible)
                
                Button("Info"){
                    isShowSecondScreen = true
                }
                .sheet( isPresented: $isShowSecondScreen, content: {
                    SecondView(isShowSecondScreen: $isShowSecondScreen)
                } )
            }
            
            .alert( "Titulo do Alerta", isPresented: $isAlertVisible, actions: {
                //                    Button("OK", role: .cancel){
                //
                //                        isAlertVisible = false#imageLiteral(resourceName: "simulator_screenshot_E311E30E-B8BA-4CAC-9481-C43EFE3C3D4D.png")
                //                    }
                
                AlertView(isAlertVisible: $isAlertVisible)
            } , message: {
                Text(game.getMessage())
                //                AcerteNumText(color: .red, text: game.getMessage())
            } )
            
        }
    }
    
    
    //    func calcPoints(){
    //        pointsDifference = abs(target - Int(sliderNumber))
    //        points += pointsDifference
    //        print("Pontuação \(points)")
    //    }
    //
    //    func newRound(){
    //
    //        target = Int.random(in: 1...100)
    //    }
}

//struct AcerteNumText : View {
//
//    var color : Color
//    var text : String
//
//    var body : some View{
//        Text(text)
//                .opacity(0.5)
//                .foregroundColor(color)
//    }
//}

struct SliderView : View{
    
    // @Binding serve pare toda vez que a variável sliderNumber for alterado, a variável slideValue também será alterada
    @Binding var sliderNumber: Double
    
    var body : some View{
        HStack{
            Text("1")
            Slider(value: $sliderNumber, in: 1...100)
            Text("100")
        }
    }
}

struct AlertView : View {
    
    @Binding var isAlertVisible : Bool
    
    var body: some View{
        
        Button("OK", role: .cancel){
            isAlertVisible = false
        }
    }
}

struct AcerteiButton : View{
    
    @Binding var slideValue : Double
    @Binding var game : Game
    @Binding var isAlertVisible : Bool
    
    
    var body: some View{
        
        Button("Acertei") {
            
            print("Cliquei no botão \(Int(slideValue))")
                        
            game.sliderNumberGame = slideValue
            game.calcPoints()
            game.newRound()
            
            isAlertVisible = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}

