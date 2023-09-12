import 'dart:convert';
import 'package:appads/model/feriado_model.dart';
import 'package:appads/utils/constantes.dart';
import 'package:http/http.dart' as http;

class FeriadoRepository {
  final url = '${urlBrasilApi}/2023';

  Future<List<FeriadoEntity>> getAll() async {
    List<FeriadoEntity> listaFeriados = [];

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final mapFeriados = jsonDecode(response.body) as List;
      for (var feriado in mapFeriados) {
        listaFeriados.add(
           FeriadoEntity.mapToEntity(feriado),
        );
      }
    }
    return listaFeriados;
  }
}
