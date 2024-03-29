import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _cityController = TextEditingController();
  String apiKey =
      'f998ad433b1435fdaa317cc1dd7f904b'; //  API key
  WeatherData? _weatherData;

  Future<void> _fetchWeather() async {
    final cityName = _cityController.text;
    final apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          _weatherData = WeatherData.fromJson(jsonData);
        });
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      print(e.toString());
    }
  }
check(String? weatherDescription) {
    if (weatherDescription?.toLowerCase().contains('clouds') == true ||weatherDescription?.toLowerCase().contains('skies') == true) {
       return "1.Applying Pesticides:\nScattered clouds or broken clouds are suitable for applying pesticides. The intermittent cloud cover can provide relief from direct sunlight without posing a risk of rain that could wash away the pesticide.\n\n2.Fertilizing:\nScattered clouds or broken clouds are suitable for fertilizing. The occasional cloud cover can moderate temperatures and reduce the risk of nutrient volatilization, which can occur in extreme heat.\n\n3.Planting:\nScattered clouds or broken clouds are suitable for planting. The intermittent cloud cover can help moderate temperatures and reduce stress on newly planted crops.\n\n4.Watering:\nScattered clouds or broken clouds are suitable for watering. These conditions provide relief from scorching sun and reduce evaporation rates, allowing water to penetrate the soil effectively.";
    }
    if (weatherDescription?.toLowerCase().contains('clear ') == true ||weatherDescription?.toLowerCase().contains('skies') == true) {
      return "1.Applying Pesticides:\n Clear skies are generally favorable for pesticide application. However, it's essential  to ensure that there is no rain or strong winds expected in the near future, as these conditions can wash away or disperse the pesticide, reducing its effectiveness.\n\n2.Fertilizing: \nClear skies can be suitable for fertilizing crops or gardens. It's important to choose the right type of fertilizer for your needs (slow-release, liquid, granular, etc.)\n\n3.Planting:\n Clear skies are typically ideal for planting because they provide good visibility and stable conditions.\n\n4.Watering:\n Clear skies are suitable for watering plants, but the timing and amount of watering should be adjusted based on factors such as the type of plants, soil moisture levels, and local climate conditions.";
    }
    if (weatherDescription?.toLowerCase().contains('Fog') == true||weatherDescription?.toLowerCase().contains('mist') == true){
      return "1.Applying Pesticides:\nFog and mist can pose challenges for pesticide application. These conditions reduce visibility, making it difficult to target and evenly distribute pesticides.\n\n2.Fertilizing:\nFog and mist conditions can make it challenging to apply dry granular fertilizers, as moisture can cause the fertilizer particles to clump or become less effective. \n\nPlanting:\n3.Fog and mist can be less problematic for planting compared to some other activities. However, visibility may be reduced, which could slow down planting operations.The suitability for planting also depends on the specific crop, soil conditions, and the extent of the mist or fog. \n\n 4.Watering:\nMisty or foggy conditions may reduce the need for watering, as they can provide some moisture to plants. However, this natural moisture may not be sufficient for all plants or during dry periods.";
    }
    if (weatherDescription?.toLowerCase().contains('Rain') == true||weatherDescription?.toLowerCase().contains('showers') == true){
      return "1. Applying Pesticides:\nSuitability: Rain is generally not suitable for applying pesticides. Applying pesticides during rain can cause the pesticide to be washed off plant surfaces, reducing its effectiveness and potentially causing environmental issues.\n\n 2.Fertilizing:\nRain can be suitable for applying certain types of fertilizers, especially water-soluble or liquid fertilizers. The rain can help dissolve and distribute the fertilizer evenly in the soil.\n\n3.Planting:\nRain can be beneficial for planting, especially for transplants and newly sown seeds. Adequate moisture in the soil promotes germination and early growth.\n\nWatering:\n Rain provides natural watering for plants and can be highly suitable, especially during moderate and consistent rainfall. It helps replenish soil moisture levels.";
    }
    if (weatherDescription?.toLowerCase().contains('overcast') == true){
    
      return "1.Applying Pesticides:\nOvercast conditions can be suitable for applying certain pesticides, especially if they are rainfast (able to withstand rain shortly after application). Overcast skies may provide stable conditions with reduced wind and direct sunlight, which can be favorable for pesticide application.\n\n2.Fertilizing:\nOvercast conditions are generally suitable for fertilizing. They provide a stable environment without extreme heat or direct sunlight, which can be beneficial for applying various types of fertilizers.\n\n3.Planting:\n Overcast conditions can be suitable for planting, as they often come with cooler temperatures and reduced sun exposure. These conditions can help minimize plant stress during the critical early stages of growth.\n\n4. Watering:\n Overcast conditions are generally suitable for watering, especially if the soil is dry. Reduced evaporation rates due to lower sunlight can help ensure that water reaches plant roots effectively.";
    }
    if (weatherDescription?.toLowerCase().contains('snow') == true||weatherDescription?.toLowerCase().contains('blizzard') == true){
      return "1.Applying Pesticides:\nApplying pesticides during snowy conditions is generally not advisable. Snow can interfere with the effectiveness of pesticide application, as it may cause the pesticide to be diluted or washed away.\n\n2.Fertilizing:\nApplying fertilizers during snowy conditions can be challenging and may not be suitable for most situations. Snow can hinder the even distribution of fertilizers and may lead to nutrient runoff when the snow melts.\n\n3.Planting:\nPlanting during snowy conditions is generally not practical, especially for seeds and young plants. Snow can inhibit germination and early growth.\n\n4.Watering:\n Snow itself can provide moisture to plants when it melts, which can be suitable for watering in some cases. However, it depends on the timing and amount of snow.";
    }
    if (weatherDescription?.toLowerCase().contains('cloudy') == true){
      return "1.Applying Pesticides:\nCloudy weather is generally suitable for applying pesticides. Cloud cover can provide relief from direct sunlight, which can help prevent rapid evaporation of liquid pesticides.\n\n2.Fertilizing:\nCloudy weather is often suitable for fertilizing. The reduced sunlight and lower temperatures can help minimize nutrient volatilization, especially with some types of fertilizers.\n\n3.Planting:\nCloudy weather is generally suitable for planting. Reduced direct sunlight can help reduce plant stress during the early stages of growth.\n\n4.Watering:\nCloudy weather can be suitable for watering, especially if the soil is dry. The lower sunlight levels can help reduce evaporation rates, allowing water to penetrate the soil effectively.";
    }
    if (weatherDescription?.toLowerCase().contains('cyclone') == true ||weatherDescription?.toLowerCase().contains('hurricanew') == true ||weatherDescription?.toLowerCase().contains('tornado') == true||weatherDescription?.toLowerCase().contains('storm') == true){
      return "1.Applying pesticides or fertilizers during these conditions is dangerous and ineffective, as the products would be quickly washed away, posing environmental risks.\n\n2.Planting and watering activities are not advisable during these conditions due to the risk of soil erosion, plant damage, and the potential for crops to be uprooted or submerged.";
    }
    else{
      return "1.Applying pesticides:\nCheck your plants regularly for signs of pests and apply pesticides as needed.\n\n2.PlantingCheck local gardening resources for the best planting advice.\n\n3.FertilisingChoose a suitable fertilizer based on your plant type and local recommendations.\n\n4. Watering:Water your plants according to their specific needs and local guidelines.";
    }
    }


  @override
  Widget build(BuildContext context) {
    double hght = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Forecast'),
      ),
      body:Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/Wforecast.jpeg'),fit: BoxFit.cover)),child: SingleChildScrollView(
        scrollDirection: Axis.vertical,child:Padding(padding:EdgeInsetsDirectional.all(20.0),
        child: Column(
          children: [
            
            SizedBox(height: 30,),
            Container(height:hght*1.5,width: wid*0.9,
            decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(20),color: Colors.white.withOpacity(0.5)),
            child:Column(children: [
                Text('Get Recommendations Based On Weather Conditions!',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),), 
                TextField(controller: _cityController,decoration: InputDecoration(labelText: 'Enter City Name',labelStyle: TextStyle(fontSize: 30),prefixIcon: Icon(Icons.location_city)),),
                ElevatedButton(onPressed: _fetchWeather,child: Text('Get Weather'),),
                SizedBox(height: 16.0),
                if(_weatherData != null)Column(crossAxisAlignment: CrossAxisAlignment.center, children: [         
                  Text('City: ${_weatherData!.cityName}',style: TextStyle(fontSize: 20),),
                  Text('Temperature: ${_weatherData!.temperature}°C',style: TextStyle(fontSize: 18),),
                  Text('Description: ${_weatherData!.description}',style: TextStyle(fontSize: 15),),
                  SizedBox(height: 16.0,width: wid*0.6,),
                  Text('Plantation Recommendations:',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
                  SizedBox(height: 10),
                  SizedBox(width: wid*0.65,child: Text(
                    check(_weatherData!.description),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ) ,),
                 
                 
                  
                ],
              )
            ],) ,),
          ],
        ),
      ),)
    ));
  }
}

class WeatherData {
  final String cityName;
  final double temperature;
  final String description;

  WeatherData({
    required this.cityName,
    required this.temperature,
    required this.description,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      description: json['weather'][0]['description'],
    );
  }
}