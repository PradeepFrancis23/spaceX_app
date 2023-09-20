import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:spacex_rocketdetails/controllers/rocket_homescreen_controller.dart';
import 'package:spacex_rocketdetails/models/rocket-models.dart';
import 'package:get/get.dart';

class RocketHome extends StatefulWidget {
  const RocketHome({super.key});

  @override
  State<RocketHome> createState() => _RocketHomeState();
}

class _RocketHomeState extends State<RocketHome> {
  final RocketHomeScreenController controller =
      Get.put(RocketHomeScreenController());

  Future<List<RocketModel>> rocket = getRocket();

  static Future<List<RocketModel>> getRocket() async {
    try {
      const url = "https://api.spacexdata.com/v4/rockets";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List body = json.decode(response.body);
        print(response.body);

        return body.map((rocket) => RocketModel.fromJson(rocket)).toList();
      } else {
        throw Exception('Failed to load post');
      }
    } on Exception catch (e) {
      // make it explicit that this function can throw exceptions
      print(e.toString());
      rethrow;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rocket = getRocket();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("SpaceX Rocket"),
          ),
        ),
        body: SafeArea(child:
            GetBuilder<RocketHomeScreenController>(builder: (controller) {
          return Padding(
            padding:
                const EdgeInsets.only(top: 15, bottom: 10, right: 10, left: 10),
            child: Center(
                child: FutureBuilder(
                    future: rocket,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        // final rocket = snapshot.data!;
                        final rockets = snapshot.data!;
                        return buildRocket(rockets);
                      } else {
                        return const Text('No Data');
                      }
                    })),
          );
        })));
  }

  Widget buildRocket(List<RocketModel> rockets) => ListView.builder(
      itemCount: rockets.length,
      itemBuilder: (context, index) {
        final rock = rockets[index];

        var rocketImg = rock.flickrImages![0];
        print("<<<<object>>>>");
        print(rocketImg);
        print(rock.country);
        return Center(
            child: Column(
          children: [
            GestureDetector(
              onTap: () {
                print('Pradeep Tap');
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Cost per launch ${rock.costPerLaunch}"),
                        content: Text("Dialog Content"),
                      );
                    });
              },
              child: Container(
                height: 300,
                width: 300, //optinal i think
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15.0),
                  // image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)
                  // rocket display img
                ),
                clipBehavior: Clip.hardEdge,
                child: FadeInImage.assetNetwork(
                  placeholder: rocketImg.toString(),
                  image: rocketImg.toString(),
                  width: 100,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Container(
            //     height: 200,
            //     width: 150,
            //     decoration: BoxDecoration(border: Border.all()),
            //
            //    child: Image.network(rocketImg.toString())),
            Column(
              children: [
                Text(
                  "Name : ${rock.name!}",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Country : ${rock.country!}",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ));
      });

//   Future<http.Response> fetchAlbum() {
//   return http.get(Uri.parse('https://api.spacexdata.com/v4/rockets'));
// }

  // Future<Rocket> fetchAlbum() async {
  //   final response =
  //       await http.get(Uri.parse('https://api.spacexdata.com/v4/rockets'));

  //   if (response.statusCode == 200) {
  //     // If the server did return a 200 OK response,
  //     // then parse the JSON.
  //     print(response.body);
  //     return Rocket.fromJson(jsonDecode(response.body));
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // then throw an exception.
  //     throw Exception('Failed to load album');
  //   }
  // }
}
