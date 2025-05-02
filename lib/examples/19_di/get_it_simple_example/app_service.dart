class AppService {
  void printHello() {
    print('Hello from AppService!');
  }
}

class SigletonService {
  final id = DateTime.now().millisecondsSinceEpoch;
  void log() => print('Siglenton Service ID: $id');
}

class FactoryService {
  final id = DateTime.now().millisecondsSinceEpoch;
  void log() => print('Factory Servicec id : $id');
}
