// ignore_for_file: library_private_types_in_public_api

import 'package:ac_master/controls.dart';
import 'package:flutter/material.dart';

class Device {
  String name;
  String room;
  IconData symbol;
  bool isConnected;

  Device(
      {required this.name,
      required this.room,
      required this.symbol,
      required this.isConnected});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Device List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DeviceListPage(),
    );
  }
}

class DeviceListPage extends StatefulWidget {
  const DeviceListPage({super.key});

  @override
  _DeviceListPageState createState() => _DeviceListPageState();
}

class _DeviceListPageState extends State<DeviceListPage> {
  List<Device> devices = [
    Device(
        name: 'Device 1',
        room: 'Living Room',
        symbol: Icons.ac_unit,
        isConnected: true),
    Device(
        name: 'Device 2',
        room: 'Bedroom',
        symbol: Icons.ac_unit,
        isConnected: false),
    Device(
        name: 'Device 3',
        room: 'Kitchen',
        symbol: Icons.ac_unit,
        isConnected: true),
    // Add more devices here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device List'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: devices.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildDeviceCard(devices[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddDeviceDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildDeviceCard(Device device) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MainContentsScreen(
                    brandName: device.name,
                  ))),
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              device.symbol,
              size: 50,
              color: device.isConnected ? Colors.green : Colors.grey,
            ),
            const SizedBox(height: 10),
            Text(
              device.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(device.room),
            const SizedBox(height: 5),
            Text(
              device.isConnected ? 'Connected' : 'Disconnected',
              style: TextStyle(
                color: device.isConnected ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddDeviceDialog() {
    TextEditingController deviceNameController = TextEditingController();
    TextEditingController roomNameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add New Device"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: deviceNameController,
                decoration: const InputDecoration(
                  labelText: 'Device Name',
                ),
              ),
              TextField(
                controller: roomNameController,
                decoration: const InputDecoration(
                  labelText: 'Room Name',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add the new device to the list
                setState(() {
                  devices.add(Device(
                    name: deviceNameController.text,
                    room: roomNameController.text,
                    symbol: Icons.ac_unit,
                    isConnected: false,
                  ));
                });
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
