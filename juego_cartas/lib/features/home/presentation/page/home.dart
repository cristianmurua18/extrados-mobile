import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:juego_cartas/commons/routes.dart';
import 'package:juego_cartas/features/home/presentation/bloc/Torneos/torneos_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    context.read<TorneosBloc>().add(
      CargarTorneosEvent(),
    ); // Llama el evento aquí
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Novedades Torneos')),
      body: BlocBuilder<TorneosBloc, TorneosState>(
        builder: (context, state) {
          if (state is TorneosCargando) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TorneosCargados) {
            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: state.torneos.length,
              itemBuilder: (context, index) {
                final torneo = state.torneos[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text(
                      torneo.nombreTorneo,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Estado: ${torneo.estado}'),
                        Text('Inicio: ${torneo.fyHInicioT.toLocal()}'),
                        if (torneo.fyHFinT.year > 1)
                          Text('Fin: ${torneo.fyHFinT.toLocal()}'),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Navegar a detalles si aplica
                    },
                  ),
                );
              },
            );
          } else if (state is TorneosError) {
            return Center(child: Text(state.mensaje));
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Ir al login',
        onPressed: () {
          routerApp.go('/login');
        },
        child: const Icon(Icons.login),
      ),
    );
  }
}
