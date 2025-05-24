import 'package:juego_cartas/features/home/config/home_get_it.dart';
import 'package:juego_cartas/features/login/config/login_get_it.dart';

void configureGetItApp() {
  homeConfigure();
  loginConfigure();
  //Aqui van todas las configuraciones
  // getLocationsConfigure();
  // getEpisodesConfigure();
  // Revisar el main, ya que se debe agregar el siguiente código para que funcione correctamente
  // home: FutureBuilder(future: GetIt.instance.allReady(),(...)
}
