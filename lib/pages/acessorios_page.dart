import "package:flutter/material.dart";
import "../components/my_drawer.dart";
import "package:provider/provider.dart";
import "../models/shop.dart";
import "../components/my_product_tile.dart";

class AcessoriosPage extends StatelessWidget {
  const AcessoriosPage ({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop.where((element) => element.category == "acessorio").toList();

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(0, 132, 134, 6),
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Acessorios"),
          actions: [
            IconButton(
                onPressed: () => Navigator.pushNamed(context, "/cart_page"),
                icon: const Icon(Icons.shopping_cart_outlined))
          ]),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(children: [
        const SizedBox(height: 25),
        Center(
            child: Text("Somente produtos selecionados",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ))),
        SizedBox(
          height: 550,
          child: ListView.builder(
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(15),
              itemBuilder: (context, index) {
                final product = products[index];
                return MyProductTile(product: product);
              }),
        )
      ]),
    );
  }
}
