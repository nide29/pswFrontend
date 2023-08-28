import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/horizontal_listview.dart';
import 'package:frontend/components/gridview_prodotti.dart';

import '../../widget/custom_appbar.dart';
import '../../widget/custom_navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => HomePage(),
    );
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    List<String> list = [
      'images/image1.jpg',
      'images/image2.jpg',
      'images/image3.jpg',
      'images/image4.jpg',
      'images/image5.jpg',
      'images/image6.jpg'
    ];
    return Scaffold(
      appBar: const CustomAppBar(title: 'OBIETTIVAMENTE'),
      backgroundColor: const Color.fromARGB(255, 255, 255, 249),
      body: ListView(children: [
        CarouselSlider(
          options: CarouselOptions(
              autoPlay: true,
              height: 470,
              viewportFraction: 0.49,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              enlargeCenterPage: true,
              enlargeFactor: 0.18),
          items: list
              .map((item) => Center(
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 0,
                          blurRadius: 20,
                          //offset: Offset(5, 5)
                        )
                      ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        child: Image.network(
                          item,
                          fit: BoxFit.cover,
                          width: 700,
                          height: 400,
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),

        const Padding(
          padding: EdgeInsets.only(left: 30, top: 30, bottom: 20),
          child: Text('Categorie',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.w100,
                  fontStyle: FontStyle.italic)),
        ),

        HorizontalList(), //avvia il widget che ci permetterà di filtrare i prodotti per categoria cliccando sulla categoria

        const Padding(
          padding: EdgeInsets.only(left: 30, top: 50, bottom: 20),
          child: Text(
            'Tutti i prodotti',
            style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.w100,
                fontStyle: FontStyle.italic),
          ),
        ),

        const GridView_prodotti(), //avvia il widget che ci permetterà di visualizzare tutti i prodotti presenti nel negozio

      ]),
    );
  }
}
