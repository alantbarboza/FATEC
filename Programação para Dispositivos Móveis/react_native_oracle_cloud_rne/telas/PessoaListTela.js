import { StyleSheet, Text, View } from 'react-native'
import React from 'react'
import PessoaListComponent from '../componentes/PessoaListComponent'

const PessoaListTela = ({navigation}) => {
  return (
    <View style={{padding: 40}}>
      <PessoaListComponent navigation={navigation}/>
    </View>
  )
}

export default PessoaListTela

const styles = StyleSheet.create({})