import 'package:a52/components/es_container.dart';
import 'package:flutter/material.dart';
import 'package:a52/entity/clientes.dart';
import 'package:a52/infra/repository/cadastro_cliente_repository.dart';

class ListaClientesPage extends StatefulWidget {
  const ListaClientesPage({super.key, required this.title});

  final String title;

  @override
  State<ListaClientesPage> createState() => _ListaClientesPageState();
}

class _ListaClientesPageState extends State<ListaClientesPage> {
  List<Cliente> clientes = [];

  @override
  void initState() {
    super.initState();
    buscarClientes();
  }

  void buscarClientes() async {
    final clienteRepository = ClienteRepository();
    final resultado = await clienteRepository.buscar();
    setState(() {
      clientes = List<Cliente>.from(resultado);
    });
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
          DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Nome',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Email',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Telefone',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ],
            rows: clientes.map((cliente) {
              return DataRow(
                cells: [
                  DataCell(Text(cliente.nome)),
                  DataCell(Text(cliente.email)),
                  DataCell(Text(cliente.telefone)),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
