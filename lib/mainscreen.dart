import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5842A9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Text(
                      'Meteo Earth',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                "Homagama",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Stack(
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      '27°C',
                      style: TextStyle(
                        fontSize: 150,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 130,
                    child: SizedBox(
                      height: 150,
                      child: Image.asset('assets/1.png'),
                    ),
                  ),
                ],
              ),
              const Text(
                'Sunday, 14 May | 10:00 AM',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 20),
              Container(
                width: 380,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: const Color.fromARGB(166, 10, 11, 117),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildWeatherInfo('assets/9.png', '30%', 'Precipitation'),
                      _buildWeatherInfo('assets/11.png', '20%', 'Humidity'),
                      _buildWeatherInfo(
                          'assets/10.png', '9 km/h', 'Wind Speed'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Row(
                    children: List.generate(
                      hourlyWeather.length,
                      (index) => _buildHourlyWeatherCard(
                        hourlyWeather[index]['time']!,
                        hourlyWeather[index]['image']!,
                        hourlyWeather[index]['temp']!,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherInfo(String asset, String value, String label) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          width: 50,
          child: Image.asset(asset),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildHourlyWeatherCard(String time, String image, String temp) {
    return Container(
      height: 150,
      width: 100,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(166, 10, 11, 117),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              time,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 70,
                width: 70,
                child: Image.asset(image),
              ),
            ),
            Text(
              temp,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, String>> hourlyWeather = [
  {'time': '11:00 AM', 'image': 'assets/2.png', 'temp': '28°C'},
  {'time': '12:00 PM', 'image': 'assets/3.png', 'temp': '27°C'},
  {'time': '1:00 PM', 'image': 'assets/1.png', 'temp': '26°C'},
  {'time': '2:00 PM', 'image': 'assets/1.png', 'temp': '26°C'},
  {'time': '3:00 PM', 'image': 'assets/4.png', 'temp': '25°C'},
  {'time': '4:00 PM', 'image': 'assets/4.png', 'temp': '24°C'},
  {'time': '5:00 PM', 'image': 'assets/5.png', 'temp': '23°C'},
];
