// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class MainContentsScreen extends StatefulWidget {
  final String brandName;

  const MainContentsScreen({super.key, required this.brandName});

  @override
  _MainContentsScreenState createState() => _MainContentsScreenState();
}

class _MainContentsScreenState extends State<MainContentsScreen> {
  int temperature = 25; // Initial temperature value
  String selectedMode = 'Cool'; // Initial mode value
  bool isAcOn = true;

  @override
  Widget build(BuildContext context) {
    String selectedBrand = widget.brandName;

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedBrand),
        actions: [
          IconButton(
            icon: Icon(isAcOn ? Icons.power_settings_new : Icons.power_off),
            onPressed: () {
              setState(() {
                isAcOn = !isAcOn;
              });
              if (isAcOn == false) {
                Navigator.pushReplacementNamed(context, '/device');
              }
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue.shade900, Colors.blue.shade400],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Temperature: $temperature°C',
                style: const TextStyle(color: Colors.white),
              ),
              SleekCircularSlider(
                min: 16,
                max: 30,
                initialValue: 25,
                appearance: CircularSliderAppearance(
                  startAngle: 180,
                  angleRange: 180,
                  customWidths: CustomSliderWidths(
                    progressBarWidth: 12,
                    shadowWidth: 12,
                  ),
                  customColors: CustomSliderColors(
                    progressBarColors: [
                      Colors.red,
                      Colors.orange,
                      Colors.blue,
                    ],
                    shadowColor: Colors.blue,
                    trackColor: Colors.transparent,
                  ),
                  infoProperties: InfoProperties(
                    mainLabelStyle: const TextStyle(color: Colors.white),
                  ),
                ),
                onChange: (double value) {
                  setState(() {
                    temperature = value.toInt();
                  });
                },
                innerWidget: (double value) {
                  return Center(
                    child: Text(
                      value.toInt().toStringAsFixed(0),
                      style: const TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  );
                },
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ModeButton(
                        mode: 'Cool',
                        icon: Icons.ac_unit,
                        isSelected: selectedMode == 'Cool',
                        onPressed: () {
                          setState(() {
                            selectedMode = 'Cool';
                          });
                        },
                      ),
                      ModeButton(
                        mode: 'Heat',
                        icon: Icons.whatshot,
                        isSelected: selectedMode == 'Heat',
                        onPressed: () {
                          setState(() {
                            selectedMode = 'Heat';
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ModeButton(
                        mode: 'Fan',
                        icon: Icons.wind_power_outlined,
                        isSelected: selectedMode == 'Fan',
                        onPressed: () {
                          setState(() {
                            selectedMode = 'Fan';
                          });
                        },
                      ),
                      ModeButton(
                        mode: 'Auto',
                        icon: Icons.autorenew,
                        isSelected: selectedMode == 'Auto',
                        onPressed: () {
                          setState(() {
                            selectedMode = 'Auto';
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ModeButton extends StatelessWidget {
  final String mode;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onPressed;

  const ModeButton({
    super.key,
    required this.mode,
    required this.icon,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          IconButton(
            icon: Icon(icon),
            color: isSelected ? Colors.white : Colors.grey,
            onPressed: onPressed,
            tooltip: mode,
          ),
          Text(
            mode,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class CustomSliderComponent extends StatelessWidget {
  final String value;

  const CustomSliderComponent({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: const TextStyle(color: Colors.white),
    );
  }
}
