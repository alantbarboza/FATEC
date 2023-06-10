import { StyleSheet, ToastAndroid } from 'react-native'
import React, { useState } from 'react'
import {
  Button,
  Card,
  Input
} from '@rneui/themed'
import * as pessoaService from '../service/PessoaService'



const PessoaAddComponent = ({navigation}) => {

  const addPessoa = async () => {
    try{
      const res = await pessoaService.cadastrarPessoa({nome, idade, hobby})
      console.log(res)
      ToastAndroid.show('Pessoa cadastrada com sucesso', ToastAndroid.LONG)
    }
    catch(e){
      console.log(e)
      ToastAndroid.show('Falha. Tente novamente mais tarde.', ToastAndroid.LONG)
    }
    // navigation.goBack()
  }
  const [nome, setNome] = useState('')
  const [idade, setIdade] = useState('')
  const [hobby, setHobby] = useState('')
  return (
    <>
      <Card
        containerStyle={styles.card}>
          <Card.Title>Cadastro de pessoas</Card.Title>
          <Card.Divider></Card.Divider>
          <Input 
            leftIcon={{type: 'font-awesome', name: 'user'}}
            placeholder='Nome'
            inputStyle={styles.textInput}
            onChangeText={(nomeDigitado) => setNome(nomeDigitado)}
          />
          <Input 
            leftIcon={{type: 'font-awesome', name: 'info'}}
            placeholder='Idade'
            inputStyle={styles.textInput}
            onChangeText={(idadeDigitada) => setIdade(idadeDigitada)}
          />
          <Input 
            leftIcon={{type: 'font-awesome', name: 'heart'}}
            placeholder='Hobby'
            inputStyle={styles.textInput}
            onChangeText={(hobbyDigitado) => setHobby(hobbyDigitado)}
          />
          <Button 
            title='OK'
            buttonStyle={styles.button}
            onPress={() => addPessoa()}
          />

      </Card>
    </>
  )
}

export default PessoaAddComponent

const styles = StyleSheet.create({
  card: {
    padding: 8,
    borderRadius: 8
  },
  textInput: {
    textAlign: 'center',
    margin: 0,
    padding: 0,
  },
  button: {
    width: '100%',
    borderRadius: 8
  }  
})