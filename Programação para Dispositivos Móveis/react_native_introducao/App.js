import {
  Button, 
  StyleSheet, 
  Text, 
  View 
} from 'react-native';
import { useState } from 'react'

export default function App() {
  // const estado = useState('Hello, React Native!')
  // const texto = estado[0]
  // const setTexto = estado[1]
  const [texto, setTexto] = useState('Hello, React Native!')
  return (
    <View style={styles.container}>
      <Text>{texto}</Text>
      <Button 
        title='++'
        onPress={() => {setTexto("Hello, React Native 2.0!!!")}}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
