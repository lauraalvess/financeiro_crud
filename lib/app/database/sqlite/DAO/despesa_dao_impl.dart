import 'package:financeiro_crud/app/database/sqlite/connection.dart';
import 'package:financeiro_crud/app/domain/entities/despesa.dart';
import 'package:financeiro_crud/app/domain/interfaces/despesa_dao.dart';
import 'package:sqflite/sqflite.dart';

class DespesaDAOImpl implements DespesaDAO{
  Database _db;
  
  
  @override
  Future<List<Despesa>> find() async{
    _db = await Connection.get(); 
    List<Map<String, dynamic>> resultado = await  _db.query('despesa');
    List<Despesa> lista = List.generate(resultado.length,(i){
      var linha = resultado[i];
      return Despesa(
        id : linha['id'],
        nome: linha['nome'],
        tipo: linha['tipo'],
        valor: linha['valor'],
        urlAvatar:  linha['url_avatar']
      );
    }
    );

    return lista;
  }

  @override
  remove(dynamic id) async{
    _db = await Connection.get();
    var sql = 'DELETE from despesa WHERE id = ?';
    _db.rawDelete(sql, [id]);
    
  }

  @override
  save(Despesa despesa) async{
    _db = await Connection.get();
    var sql;
    if(despesa.id == null){
        sql = 'INSERT INTO despesa (nome, tipo, valor, url_avatar) VALUES (?,?,?,?)';
        _db.rawInsert(sql, [despesa.nome, despesa.tipo, despesa.valor, despesa.urlAvatar]);
    } else{
        sql = 'UPDATE despesa SET nome = ?, tipo = ?, valor = ?, url_avatar =? where id = ?';
        _db.rawUpdate(sql, [despesa.nome, despesa.tipo, despesa.valor, despesa.urlAvatar, despesa.id]);
    }
  
  }


}