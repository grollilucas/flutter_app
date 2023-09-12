import 'package:appads/controller/feriado_controller.dart';
import 'package:appads/model/feriado_model.dart';
import 'package:appads/view/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FeriadoPage extends StatefulWidget {
  const FeriadoPage({super.key});

  @override
  State<FeriadoPage> createState() => _FeriadoPageState();
}

class _FeriadoPageState extends State<FeriadoPage> {
  FeriadoController feriadoController = FeriadoController();

  late Future<List<FeriadoEntity>> future;

  @override
  void initState() {
    super.initState();
    future = getFeriados();
  }

  Future<List<FeriadoEntity>> getFeriados() async {
    return feriadoController.getFeriadosList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerApp(),
      appBar: AppBar(
        title: const Text("Feriados em 2023"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<FeriadoEntity>>(
        future: future,
        builder: (BuildContext context,
            AsyncSnapshot<List<FeriadoEntity>> snapshot) {
          if (snapshot.hasData) {
            //tem dados, monta o list view
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Slidable(
                    endActionPane: const ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: null,
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.black,
                          icon: Icons.edit,
                          label: "Alterar",
                        ),
                        SlidableAction(
                          onPressed: null,
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: "Excluir",
                        ),
                      ],
                    ),
                    child: ListTile(
                      
                      title: Align(alignment: Alignment.center,
                      child:Text("${snapshot.data![index].name}",),
                      ),
                      
                      subtitle: Align(alignment: Alignment.center,
                      child: Text("${snapshot.data![index].date}"),)
                      
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
