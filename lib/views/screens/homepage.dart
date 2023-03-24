import 'package:ecommerce/views/drawer/custom_drawer.dart';

import 'package:ecommerce/Controller/provider_page.dart';


import 'package:ecommerce/views/widgets/big_text.dart';
import 'package:ecommerce/views/widgets/small_text.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../widgets/search_card .dart';

import 'detail_ page.dart';

int buttonindex = 0;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderPage>(builder: (context, fecthdata, child) {
      fecthdata.fetchAlbum();
      if (fecthdata.status == ProviderStatus.complted) {
        return SafeArea(
            child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            leading: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Builder(builder: (context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(Icons.menu, size: 28),
                  color: Colors.white,
                );
              }),
            ),

            // actions: <Widget>[
            //   Padding(
            //     padding: const EdgeInsets.only(right: 20),
            //     child: CircleAvatar(
            //       backgroundImage: NetworkImage(
            //           FirebaseAuth.instance.currentUser!.photoURL!),
            //     ),
            //   ),
            // ],
          ),

          drawer: const CustomDrawer(),
          backgroundColor: Colors.black87,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                  
                      const Padding(
                        padding: EdgeInsets.only(top: 10, right: 95),
                        child: Text(
                          "What are you \nlooking for?",
                          style: TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      SearchCard()
                    ],
                  ),
                )),

            
                const SizedBox(
                  height: 20,
                ),

              //product list

                SizedBox(
                    width: double.infinity,
                    height: 750,
                    child: ListView.builder(
                      itemCount: fecthdata.data.products.length,
                      itemBuilder: ((context, index) => InkWell(
                            onTap: () {
                              buttonindex = index;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ItemCard(
                                            index: index,
                                          )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 10, top: 10),
                              child: Container(
                                height: 135,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade900,
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Stack(
                                  // alignment: Alignment.bottomCenter,
                                  children: <Widget>[
                                    //  product image
                                    Positioned(
                                      top: 12,
                                      left: 20,
                                      child: Container(
                                          height: 110,
                                          width: 125,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(fecthdata
                                                    .data
                                                    .products[index]
                                                    .thumbnail),
                                                fit: BoxFit.fill),
                                            // borderRadius:
                                            //     BorderRadius.circular(18),
                                            // boxShadow: [kDefaultShadow],
                                          )
                                          // child: Image.asset(
                                          //   "assets/image/0a6bed52d98ca969015324c179c38063.jpg",
                                          //   fit: BoxFit.cover,
                                          // ),
                                          ),
                                    ),
                                    Positioned(
                                        left: 165,
                                        top: 25,
                                        child: SizedBox(
                                          width: 150,
                                          child: BigText(
                                              text: fecthdata
                                                  .data.products[index].title,
                                              size: 18,
                                              color: const Color.fromARGB(
                                                  255, 255, 255, 255)),
                                        )),
                                    Positioned(
                                        left: 165,
                                        top: 55,
                                        child: SmallText(
                                          text: fecthdata
                                              .data.products[index].brand,
                                          size: 16,
                                        )),
                                    Positioned(
                                        left: 165,
                                        top: 85,
                                        child: BigText(
                                          text:
                                              '\$${fecthdata.data.products[index].price}',
                                          size: 20,
                                          color: Colors.white,
                                        )),
                                    Positioned(
                                        left: 264,
                                        top: 75,
                                        child: SizedBox(
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      const Color.fromARGB(
                                                          255, 0, 0, 0)),
                                              onPressed: () {
                                                buttonindex = index;
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ItemCard(
                                                              index: index),
                                                    ));
                                                // const snackBar = SnackBar(
                                                //     content: Text(
                                                //         "Added successfully"));
                                                // ScaffoldMessenger.of(context)
                                                //     .clearSnackBars();
                                                // ScaffoldMessenger.of(context)
                                                //     .showSnackBar(snackBar);
                                              },
                                              child: const Icon(
                                                Icons.shopping_cart,
                                                color: Color.fromARGB(
                                                    255, 249, 250, 252),
                                                size: 20,
                                              )),
                                        ))
                                    // Product title and price
                                  ],
                                ),
                              ),
                            ),
                          )),
                    ))
              ],
            ),
          ),
        ));
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
