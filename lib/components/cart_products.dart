import 'package:flutter/material.dart';

import '../model/objects/Prodotto_nel_Carrello.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: ProdottoNelCarrello.carrello!.length,
        itemBuilder: (context, index) {
          return Single_cart_product(
            single_cart_product_name: ProdottoNelCarrello.carrello![index].prodotto!.nome,
            single_cart_product_marca: ProdottoNelCarrello.carrello![index].prodotto!.marca,
            single_cart_product_picture: 'images/${ProdottoNelCarrello.carrello![index].prodotto!.nome}.jpg',
            single_cart_product_price: ProdottoNelCarrello.carrello![index].prodotto!.prezzo,
            single_cart_product_categoria: ProdottoNelCarrello.carrello![index].prodotto!.categoria,
            single_cart_product_quantita: ProdottoNelCarrello.carrello![index].quantita,
          );
        });
  }
}

class Single_cart_product extends StatelessWidget {
  final single_cart_product_name;
  final single_cart_product_marca;
  final single_cart_product_picture;
  final single_cart_product_price;
  final single_cart_product_categoria;
  final single_cart_product_quantita;

  const Single_cart_product(
      {this.single_cart_product_name,
        this.single_cart_product_marca,
        this.single_cart_product_picture,
        this.single_cart_product_price,
        this.single_cart_product_categoria,
        this.single_cart_product_quantita});


  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          //================LEADING SECTION=============
          leading: Image.network(single_cart_product_picture),

          //==========TITLE SECTION=========
          title: Text('${single_cart_product_marca.toString().toUpperCase()} $single_cart_product_name'),

          //==========SUBTITLE SECTION========
          subtitle: Column(
            children: <Widget>[
              //ROW INSIDE THE COLUMN
              Row(
                //===========MISURA========
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Text("Categoria:"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        single_cart_product_categoria,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  ]),
              //===========PREZZO============
              Container(
                alignment: Alignment.topLeft,
                child: Text('€$single_cart_product_price',
                    style: const TextStyle(
                        color: Colors.green,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        )
    );
  }

}