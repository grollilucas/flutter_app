import 'package:appads/model/feriado_model.dart';
import 'package:appads/model/feriado_repository.dart';


class FeriadoController {
  FeriadoRepository feriadoRepository = FeriadoRepository();

  Future<List<FeriadoEntity>> getFeriadosList() async {
    List<FeriadoEntity> lista = [];
    lista = await feriadoRepository.getAll();
    return lista;
  }
}
