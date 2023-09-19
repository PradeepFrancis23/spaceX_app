import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:spacex_rocketdetails/models/rocket-models.dart';

class RocketHome extends StatefulWidget {
  const RocketHome({super.key});

  @override
  State<RocketHome> createState() => _RocketHomeState();
}

class _RocketHomeState extends State<RocketHome> {
  Future<List<RocketModel>> rocket = getRocket();

  static Future<List<RocketModel>> getRocket() async {
    const url = "https://api.spacexdata.com/v4/rockets";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List body = json.decode(response.body);
      print(response.body);

      return body.map((rocket) => RocketModel.fromJson(rocket)).toList();

      //  body.map((data) => RocketModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load post');
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
        body: Center(
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
                }))
        // FutureBuilder<Rocket>(
        //   future: futureAlbum,
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       return Text(snapshot.data!.name!);
        //     } else if (snapshot.hasError) {
        //       return Center(child: Text('${snapshot.error}'));
        //     }

        //     // By default, show a loading spinner.
        //     return Center(child: const CircularProgressIndicator());
        //   },
        // ), // body: SafeArea(
        //   child: Column(
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Container(
        //           height: MediaQuery.of(context).size.height / 2,
        //           width: MediaQuery.of(context).size.height / 1,
        //           decoration: const BoxDecoration(color: Colors.green),
        //           child: const Center(child: Text('image')),
        //         ),
        //       ),
        //       const Text('Name :'),
        //       const SizedBox(
        //         height: 20,
        //       ),
        //       const Text('Country:'),
        //       const SizedBox(
        //         height: 20,
        //       ),
        //       const Text('Engines Count :'),
        //     ],
        //   ),
        // ),
        );
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
