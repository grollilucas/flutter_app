import 'dart:convert';
import 'package:appads/model/aluno_model.dart';
import 'package:appads/utils/constantes.dart';
import 'package:http/http.dart' as http;

class AlunoRepository {
  final url = '${urlBaseApi}/alunos';

  Future<List<AlunoEntity>> getAll() async {
    List<AlunoEntity> listaAlunos = [];

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final mapAlunos = jsonDecode(response.body) as List;
      for (var aluno in mapAlunos) {
        listaAlunos.add(
          AlunoEntity.mapToEntity(aluno),
        );
      }
    }
    return listaAlunos;
  }

  postNovoAluno(AlunoEntity alunoEntity) async {
    final jsonAluno = jsonEncode(AlunoEntity.entityToMap(alunoEntity));
    var response = await http.post(Uri.parse(url), body: jsonAluno);
    if (response.statusCode != 201) {
      throw 'Problemas ao inserir aluno';
    }
  }

  deleteAluno(int id) async {
    final url = '$urlBaseApi/alunos/$id';
    var response = await http.delete(Uri.parse(url));
    if (response.statusCode != 200) {
      throw 'Problemas ao excluir aluno';
    }
  }
}
