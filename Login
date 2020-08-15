import { StatusBar } from 'expo-status-bar';
import React,{useState, useEffect} from 'react';
import { StyleSheet,
   View, 
   Text,TextInput, 
   KeyboardAvoidingView, 
   Image, 
   TouchableOpacity,Animated, 
   Keyboard
   } from 'react-native';

export default function App() {

  const[offset] = useState(new Animated.ValueXY({x : 0, y: 90}))
 
  const [logo] = useState(new Animated.ValueXY({x: 130, y: 155}));
 

  useEffect(()=>{

    Animated.spring(offset.y,{
      toValue: 0,
      speed: 4,
      bounciness: 20,

    }).start();
  },[]);

  return (
    <KeyboardAvoidingView style = {styles.backgroundColor}>

      <View  style = {styles.logo} >

        <Animated.Image
        
        style = {{
          width: logo.x,
          height:logo.y,
        }}


          source={require('./src/assets/icons8-chuva-100.png')} />

        <StatusBar style="auto" />
      </View>

      <Animated.View 
      style = {[
        styles.container,
        {

          transform: [
            {
              translateY:offset.y}
          ]

        }
        ]}
        >
        
        <TextInput  style = {styles.inputs}
         
          placeholder="CPF"
          autoCorrect={false}
          onChangeText={() => {}}
        />

        <TextInput 
         style = {styles.inputs}
          placeholder="Senha"
          autoCorrect={false}
          onChangeText={() => {}}
        />

        <TouchableOpacity  style = {styles.btnSumbmit} >
          <Text style = {styles.textSumbmit} >Acessar  </Text>
        </TouchableOpacity>

        <TouchableOpacity style = {styles.btnRegister}>
          <Text style = {styles.textRegistrar}>Criar Conta</Text>
        </TouchableOpacity>

      </Animated.View>

    </KeyboardAvoidingView>

  );
}


const styles = StyleSheet.create({
  backgroundColor: {
    flex: 1,
    alignItems: 'center',
    justifyContent:'center',
    backgroundColor: '#191919'
  },


  logo:{
    flex: 1,
    justifyContent: 'center'
  },


  container:{
    flex: 1,
    alignContent: 'center',
    justifyContent: 'center',
    width: '90%',
  },


  inputs :{
    backgroundColor: '#ffffff',
    width: '100%',
    justifyContent: 'center',
    marginBottom: 15,
    color: '#222',
    fontSize: 17,
    borderRadius: 7,
    padding: 10,
  },

  btnSumbmit : {
    backgroundColor:'#00bfff',
    width: '100%',
    height: 45,
    justifyContent: 'center',
    alignItems: 'center',
    borderRadius:   7
    
  },

  textSumbmit :{
    color: '#ffffff',
    fontSize:  18 ,
    
  },

  btnRegister: {
    marginTop: 18,
    justifyContent: 'center',
    alignItems: 'center',

  },
  textRegistrar: {
    color: '#ffffff',
   
  },
  

});
