import 'package:sqflite/sqflite.dart' as sql;

class SqliteConnection {
  Future<sql.Database> db() async {
        
    return sql.openDatabase(
      'a52.db',
      version: 2,
      onCreate: (sql.Database database, int version) async {
        await createTables(database, version);
      },
    );
  }
  
  Future<void> createTables(sql.Database database, int version) async {

    await database.execute("""
CREATE TABLE clientes(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        nome TEXT,
        telefone TEXT,
        email TEXT
      )"""
);
    await database.execute("""
CREATE TABLE produtos(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        descricao TEXT,
        preco TEXT,
        estoque TEXT
      )
      """
);

await database.execute("""
CREATE TABLE cabecalho_ordem(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        cliente TEXT

      )
      """
);
await database.execute("""
CREATE TABLE itens_ordem(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        produtos INTEGER,
        quantidade TEXT,
        total TEXT,
        unitario TEXT

      )
      """
);

  }
}
