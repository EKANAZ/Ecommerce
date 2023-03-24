import 'package:ecommerce/Controller/provider_page.dart';

import 'package:ecommerce/views/widgets/big_text.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 14),
        padding: const EdgeInsets.all(0),
        minimumSize: const Size(22, 22),
        maximumSize: const Size(22, 22),
        elevation: 0,
        backgroundColor: Colors.blueGrey.shade900);
    return Consumer<ProviderPage>(builder: (context, fecthdata, child) {
      fecthdata.loadData();

      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 24, 24, 26),
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back,
                color: Color.fromARGB(255, 250, 248, 248)),
          ),
          title: const Text(
            "Cart",
            style: TextStyle(
              color: Color.fromARGB(255, 246, 243, 243),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          // actions: <Widget>[
          //   IconButton(
          //     icon: const Icon(
          //       Icons.delete_outline,
          //       size: 28,
          //       color: Color.fromARGB(255, 236, 235, 234),
          //     ),
          //     onPressed: () {
          //       // do something
          //     },
          //   ),
          //   const SizedBox(width: 8)
          // ],
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: fecthdata.shoppingsample.length,
                    itemBuilder: ((context, index) => SizedBox(
                          height: 175,
                          child: Card(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            elevation: 0,
                            margin: const EdgeInsets.only(bottom: 15),
                            child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(children: [
                                  Image(
                                    image: NetworkImage(fecthdata
                                        .data
                                        .products[
                                            fecthdata.shoppingsample[index]]
                                        .thumbnail),
                                    width: 105,
                                    height: 105,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(
                                    width: 25,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 150,
                                            child: BigText(
                                              text:
                                                  fecthdata.data.products[fecthdata.shoppingsample[index]].title,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 60,
                                            child: BigText(
                                              text:
                                                  '\$${fecthdata.data.products[fecthdata.shoppingsample[index]].price}',
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 80,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 20,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    fecthdata.removeItem(index);
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                            const SnackBar(
                                                      backgroundColor:
                                                          Color.fromARGB(255,
                                                              247, 247, 247),
                                                      content: Text(
                                                        "Item removed!",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ));
                                                  },
                                                  child: CircleAvatar(
                                                    backgroundColor: Colors
                                                        .redAccent
                                                        .withOpacity(0.07),
                                                    radius: 18,
                                                    child: const Icon(
                                                      Iconsax.trash,
                                                      color: Color.fromARGB(
                                                          255, 233, 233, 233),
                                                      size: 25,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            'Quantity',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          ElevatedButton(
                                            style: style,
                                            onPressed: () {},
                                            child: const Text('-'),
                                          ),
                                          const Text(
                                            '1',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                            ),
                                          ),
                                          ElevatedButton(
                                            style: style,
                                            onPressed: () {},
                                            child: const Text('+'),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ])),
                          ),
                        ))),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BigText(
                    text: "Total",
                    color: Colors.white,
                  ),
                  const Text(
                    '\$ 954',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5956E9),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 250,
                height: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)), backgroundColor: const Color.fromARGB(255, 21, 42, 52)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Cart(),
                          ));
                    },
                    child: BigText(
                      text: "Buy",
                      color: Colors.white,
                      size: 25,
                    )),
              ),
            ],
          ),
        ),
      );
    });
  }
}
