import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:frontend/UI/pages/product_details.dart';
import '../../model/Model.dart';
import '../../model/objects/Prodotto.dart';

class Categoria extends StatefulWidget {
  String? categoria;


  Categoria(String categoria) {
    this.categoria = categoria;
  }

  @override
  _CategoriaState createState() => _CategoriaState();

}


class _CategoriaState extends State<Categoria> {

  static List<Prodotto> list = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    List<Prodotto>? value = await Model.sharedInstance.getProdottoByCategoria(widget.categoria!);
    if (value != null) {
      setState(() {
        list.addAll(value);
      });
    }

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.yellowAccent,
        title: Text(
          widget.categoria!.toUpperCase(),
          style: const TextStyle(
              color: Colors.black87, fontSize: 24, fontFamily: 'Avenir'),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black87),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black87,
          onPressed: () {
            list = List<Prodotto>.empty(growable: true);
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 30, top: 35, right: 30),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, crossAxisSpacing: 30, mainAxisSpacing: 30),
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            final item = list[index];
            return CustomCard(
                color: Colors.white,
                borderColor: Colors.grey.withOpacity(0.3),
                elevation: 12,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => ProductDetails(prodotto: item))));
                },
                borderRadius: 18,
                shadowColor: Colors.grey.withOpacity(0.12),
                child: Stack(children: [
                  Align(
                    alignment: const Alignment(0, -0.8),
                    child: Container(
                        height: 200,
                        width: 200,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                          child: Image.network(
                            'images/${item.nome!}.jpg',
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        )
                    ),
                  ),
                  Align(
                    alignment: const Alignment(0, 0.5),
                    child: Text(
                      '${item.marca!.toUpperCase()} ${item.nome!}', //categoria del prodotto
                      style: const TextStyle(
                          color: Colors.black87,
                          fontFamily: 'Avenir',
                          letterSpacing: 1.0),
                    ),
                  ),
                  Align(
                    alignment: const Alignment(0, 0.8),
                    child: Text(
                      '€ ${item.prezzo}.00', //categoria del prodotto
                      style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 26,
                          fontFamily: 'Avenir',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ]));
          }

        ),
      )
    );
  }
}


