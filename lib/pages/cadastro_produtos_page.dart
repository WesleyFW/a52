import 'package:a52/components/es_container.dart';
import 'package:a52/infra/repository/cadastro_produto_repository.dart';
import 'package:flutter/material.dart';

class CadastroProdutosPage extends StatefulWidget {
  const CadastroProdutosPage({super.key, required this.title});

  final String title;

  @override
  State<CadastroProdutosPage> createState() => _CadastroProdutosPageState();
}



class _CadastroProdutosPageState extends State<CadastroProdutosPage> {

  TextEditingController descricaoController = TextEditingController();
  TextEditingController precoController = TextEditingController();
  TextEditingController estoqueController = TextEditingController();

  void salvar(BuildContext context) async {
    final produtosrepository =  ProdutoRepository();
    await produtosrepository.salvar(
      descricaoController.text,
      precoController.text,
      estoqueController.text
    );

    Navigator.of(context).pushNamed('/cadprod');
  }
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
      body: ESContainer(
        widgets: [
          TextFormField(
            controller:  descricaoController,
            decoration: const InputDecoration(hintText: 'descricao')),

          TextFormField(
             controller: precoController, 
             decoration: const InputDecoration(hintText: 'preco')),


          TextFormField(
            controller: estoqueController,
            decoration: const InputDecoration(hintText: 'estoque')),
            const SizedBox(height: 20,),

          ElevatedButton(onPressed: () { salvar(context);}, child: const Text('Salvar'))
        ],
        
      ),
      
    );
  }
  }