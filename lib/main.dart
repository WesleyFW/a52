import 'package:flutter/material.dart';
import 'package:a52/pages/home.dart';
import 'package:a52/pages/cadastro_clientes_page.dart';
import 'package:a52/pages/cadastro_produtos_page.dart';
import 'package:a52/pages/lista_clientes_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App a52',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 138, 2, 2)),
        useMaterial3: true,

     ),

     routes: {
     '/':(context) =>const MyHomePage (title:'Página inicial'),
     '/cadcli':(context) => const CadastroClientesPage (title:'Cadastro de clientes'),
      '/cadprod':(context) => const CadastroProdutosPage (title:'Cadastro de produtos'),
      '/listclientes':(context) => const ListaClientesPage (title:'Lista clientes'),
    //  '/pedvenda':(context) =>const pedvenda (title:'Pedido de venda'),
       }
     ); 
    }
  }