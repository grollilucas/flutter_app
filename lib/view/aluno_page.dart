import 'package:appads/controller/aluno_controller.dart';
import 'package:appads/model/aluno_model.dart';
import 'package:appads/view/drawer_widget.dart';
import 'package:appads/view/novo_aluno_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AlunoPage extends StatefulWidget {
  const AlunoPage({super.key});

  @override
  State<AlunoPage> createState() => _AlunoPageState();
}

class _AlunoPageState extends State<AlunoPage> {
  AlunoController alunoController = AlunoController();

  late Future<List<AlunoEntity>> future;

  @override
  void initState() {
    super.initState();
    future = getAlunos();
  }

  Future<List<AlunoEntity>> getAlunos() async {
    return alunoController.getAlunosList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerApp(),
      appBar: AppBar(
        title: const Center(
          child: Text("Alunos"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NovoAlunoPage(),
            ),
          ).then((value) {
            future = getAlunos();
            setState(() => {});
            // setState(() => {});
          });
        },
      ),
      body: FutureBuilder<List<AlunoEntity>>(
        future: future,
        builder:
            (BuildContext context, AsyncSnapshot<List<AlunoEntity>> snapshot) {
          if (snapshot.hasData) {
            //tem dados, monta o list view
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Slidable(
                    endActionPane: ActionPane(
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
                          onPressed: (context) async {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Confirmação'),
                                content: const Text(
                                    'Confirma exclusão deste aluno?'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      await alunoController.deleteAluno(int.parse(snapshot.data![index].id!));
                                      Navigator.pop(context);
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            ).then((value) async {
                              //aqui atualiza a lista após fechar dialog
                              future = getAlunos();
                              setState(() => {});
                            });
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Excluir',
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.brown.shade800,
                        child: const Text("A"),
                      ),
                      title: Text("${snapshot.data![index].nome}"),
                      subtitle: Text("${snapshot.data![index].email}"),
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
