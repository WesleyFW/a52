import 'package:a52/Entity/produtos.dart';
import 'package:a52/infra/sqlite.dart';

class ProdutoRepository {
  Future<List<Produtos>> buscar() async {
    final List<Produtos> retorno = [];
    final sqlite = SqliteConnection();
    final connection = await sqlite.db();
    List<Map<String, Object?>> produtos = await connection
      .query(
        'produtos',
        columns: ['descricao','preco','estoque']);

    for (final produto in produtos){
      
      String descricao = produto['descricao'].toString();
      String estoque = produto['estoque'].toString();
      String preco = produto['preco'].toString();
      
      
      retorno.add(Produtos(descricao,estoque,preco));
    }

    return retorno;
  }

  Future<void> salvar(String descricao, String estoque, String preco) async {
    final sqlite = SqliteConnection();
    final connection = await sqlite.db();
    
    await connection.insert('produtos', {
      'descricao': descricao,
      'estoque': estoque,
      'preco': preco
    });
  }
}