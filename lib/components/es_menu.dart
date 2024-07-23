import 'package:flutter/material.dart';

class ESMenu extends StatelessWidget{
  const ESMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/cadcli');
          },
          child: const Text('Cadastro de Clientes')
        ),
        const SizedBox(height: 20,),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/cadprod');
          },
          child: const Text('Cadastro de produtos')
        ),
        const SizedBox(height: 20,),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/pedvenda');
          },
          child: const Text('pedido de venda')
        ),
        const SizedBox(height: 20,),
                ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/listclientes');
          },
          child: const Text('Lista de clientes')
        ),

      ],
    );
  }

}