import 'package:a52/Entity/clientes.dart';
import 'package:a52/infra/sqlite.dart';

class ClienteRepository {
  Future<List<Cliente>> buscar() async {
    final List<Cliente> retorno = [];
    final sqlite = SqliteConnection();
    final connection = await sqlite.db();
    List<Map<String, Object?>> clientes = await connection
      .query(
        'clientes',
        columns: ['nome','telefone','email']);

    for (final cliente in clientes){
      
      String email = cliente['email'].toString();
      String nome = cliente['nome'].toString();
      String telefone = cliente['telefone'].toString();
      
      retorno.add(Cliente(nome,email,telefone));
    }

    return retorno;
  }

  Future<void> salvar(String nome, String telefone, String email) async {
    final sqlite = SqliteConnection();
    final connection = await sqlite.db();
    
    await connection.insert('clientes', {
      'nome': nome,
      'telefone': telefone,
      'email': email
    });
  }
}