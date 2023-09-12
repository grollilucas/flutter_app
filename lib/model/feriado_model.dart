class FeriadoEntity {

  DateTime? date;
  String? name;
  String? type;
  

  FeriadoEntity({this.date, this.name, this.type});

  static FeriadoEntity mapToEntity(Map<String, dynamic> map) {
    return FeriadoEntity(
        date: DateTime.parse(map['date']),
        name: map['name'] ?? '',
        type: map['type'] ?? '',
        );
  }
}