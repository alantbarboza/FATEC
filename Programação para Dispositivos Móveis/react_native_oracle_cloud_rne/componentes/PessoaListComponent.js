import { FlatList, StyleSheet, Text, View } from 'react-native'
import React, { useEffect, useState } from 'react'
import {
  FAB, LinearProgress, ListItem
} from '@rneui/themed'
import * as pessoaService from '../service/PessoaService'

const PessoaListComponent = ({navigation}) => {
  const [pessoas, setPessoas] = useState([])
  const [refreshing, setRefreshing] = useState(false)
  useEffect(() => {
    const go = async () => {
      await updateList()
    }
    go()
  }, [])
  const updateList = async () => {
    const compareFn = (a, b) => {
      return a.nome > b.nome ? 1 : a.nome < b.nome ? -1 : 0  
    }
    setPessoas((await pessoaService.obterLista()).data.items.sort(compareFn))
  }
  const onRefresh = async () => {
    setRefreshing(true)
    //atualizar a lista
    await updateList()
    setRefreshing(false) 
  }
  return (
    <View>
      {
        pessoas.length > 0 ?
        <>
          <FlatList 
            onRefresh={onRefresh}
            refreshing={refreshing}
            data={pessoas}
            renderItem={pessoa => (
              <ListItem bottomDivider>
                <ListItem.Content>
                  <ListItem.Title>{pessoa.item.nome}</ListItem.Title>
                  <ListItem.Subtitle>{pessoa.item.hobby}</ListItem.Subtitle>
                </ListItem.Content>
                <ListItem.Chevron/>
              </ListItem>
            )}
          />
          <FAB 
            icon={{color: 'white', name: 'add'}}
            placement='right'
            onPress={() => {
              navigation.navigate('PessoaAdd', {onGoBack: updateList})
            }}
          />
        </>
        :
        <LinearProgress />
      }
    </View>
  )
}

export default PessoaListComponent

const styles = StyleSheet.create({})