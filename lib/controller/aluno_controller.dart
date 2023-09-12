import 'package:appads/model/aluno_model.dart';
import 'package:appads/model/aluno_repository.dart';

class AlunoController {
  AlunoRepository alunoRepository = AlunoRepository();

  Future<List<AlunoEntity>> getAlunosList() async {
    //aqui podem ter regras, filtros, formatações
    List<AlunoEntity> lista = [];
    lista = await alunoRepository.getAll();
    return lista;
  }

  postNovoAluno(AlunoEntity alunoEntity) async {
    try {
      await alunoRepository.postNovoAluno(alunoEntity);
    } catch (e) {
      rethrow;
    }
  }

  deleteAluno(int id) async {
    try {
      await alunoRepository.deleteAluno(id);
    } catch (e) {
      rethrow;
    }
  }
}
