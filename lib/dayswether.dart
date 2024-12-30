import 'package:flutter/material.dart';

class DaysWeather extends StatelessWidget {
  const DaysWeather({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> daysWeather = [
      {'day': 'Tuesday', 'temp': '26°C-24°C', 'icon': 'assets/2.png'},
      {'day': 'Wednesday', 'temp': '25°C-23°C', 'icon': 'assets/1.png'},
      {'day': 'Thursday', 'temp': '24°C-22°C', 'icon': 'assets/4.png'},
      {'day': 'Friday', 'temp': '23°C-21°C', 'icon': 'assets/5.png'},
      {'day': 'Saturday', 'temp': '24°C-22°C', 'icon': 'assets/4.png'},
      {'day': 'Sunday', 'temp': '23°C-21°C', 'icon': 'assets/5.png'},
      {'day': 'Monday', 'temp': '24°C-22°C', 'icon': 'assets/4.png'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Next 7 Days',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff5842A9),
      ),
      backgroundColor: const Color(0xff5842A9),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 1, left: 8),
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(166, 10, 11, 117),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 150,
                            width: 150,
                            child: Image.asset('assets/1.png'),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Tomorrow',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Sunny - Cloudy',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '27°C - 24°C',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildWeatherInfo(
                              'assets/9.png', '30%', 'Precipitation'),
                          _buildWeatherInfo('assets/11.png', '20%', 'Humidity'),
                          _buildWeatherInfo(
                              'assets/10.png', '9km/h', 'Wind Speed'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: daysWeather.length,
                itemBuilder: (context, index) {
                  final dayWeather = daysWeather[index];
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      height: 75,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border:
                              Border(bottom: BorderSide(color: Colors.black))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 17),
                            child: Text(
                              dayWeather['day']!,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Image.asset(dayWeather['icon']!),
                          Padding(
                            padding: const EdgeInsets.only(right: 17),
                            child: Text(
                              dayWeather['temp']!,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
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
          height: 45,
          width: 45,
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
}
