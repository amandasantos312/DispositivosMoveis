import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google Maps Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 147, 2)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Google Maps Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 1. Declaração do conjunto de marcadores no estado
  Set<Marker> _marcadores = {};

  // Função para carregar os marcadores
  void _carregarMarcadores() {
    Set<Marker> marcadoresLocal = {};

    Marker marcadoIfpi = const Marker(
      markerId: MarkerId('IFPI'),
      position: LatLng(-5.088544046019581, -42.81123803149089),
    );

    Marker marcadoIfpiSul = const Marker(
      markerId: MarkerId('IFPI-SUL'),
      position: LatLng(-5.101723, -42.813114),
      infoWindow: InfoWindow(title: 'IFPI-Sul'),
    );

    Marker marcadoShopping = const Marker(
      markerId: MarkerId('Shopping'),
      position: LatLng(-5.085236135991352, -42.79024444792003),
      infoWindow: InfoWindow(title: 'Teresina Shopping'),
    );

    Marker marcadoLoja = const Marker(
      markerId: MarkerId('Loja'),
      position: LatLng(-5.079978221117165, -42.793659723302),
      infoWindow: InfoWindow(title: 'Pintos Shopping'),
    );

    marcadoresLocal.add(marcadoIfpi);
    marcadoresLocal.add(marcadoIfpiSul);
    marcadoresLocal.add(marcadoShopping);
    marcadoresLocal.add(marcadoLoja);
    

    setState(() {
      _marcadores = marcadoresLocal; // Atualiza a variável de estado
    });
  }

  void _localizacaoAtual() async {
    // Verifica e solicita permissões antes de pegar a localização
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }

  Position position = await Geolocator.getCurrentPosition(
    locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
    ),
  );
    print('Localização: ${position.toString()}');
  }

  final LatLng _center = const LatLng(-5.088897765910941, -42.8106716757193);

  @override
  void initState() {
    super.initState();
    _carregarMarcadores(); 
    _localizacaoAtual();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: Text(widget.title),
      ),
      body: GoogleMap( // (Slide 4)
        myLocationEnabled: true,
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 15.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          // Guarde o controller se necessário
        },
        markers: _marcadores, // Passa a variável de estado aqui
        myLocationButtonEnabled: true,
      ),
    );
  }
}