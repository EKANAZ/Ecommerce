import 'package:carousel_slider/carousel_slider.dart';

import 'package:ecommerce/Controller/provider_page.dart';
import 'package:ecommerce/views/screens/favourite_page.dart';

import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import 'cart_page.dart';
import 'homepage.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderPage>(builder: (context, fecthdata, child) {
      fecthdata.fetchAlbum();

      return SafeArea(
          child: Scaffold(
              backgroundColor: const Color.fromARGB(255, 0, 0, 0),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                )),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Cart(),
                                      ));
                                },
                                icon: const Icon(
                                  Icons.shopping_cart,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      )),
                  Expanded(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 240,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 2.0,
                        scrollDirection: Axis.horizontal,
                      ),
                      items: <Widget>[
                        for (var i = 0;
                            i <
                                fecthdata
                                    .data.products[buttonindex].images.length;
                            i++)
                          Container(
                              decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(fecthdata
                                    .data.products[buttonindex].images[i]),
                                fit: BoxFit.contain),
                          )
                              // child: Image.asset(
                              //   "assets/image/0a6bed52d98ca969015324c179c38063.jpg",
                              //   fit: BoxFit.cover,
                              // ),
                              ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          height: MediaQuery.of(context).size.height * 0.51,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 25, left: 20, right: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 240,
                                          child: Text(
                                            overflow: TextOverflow.ellipsis,
                                            fecthdata.data.products[buttonindex]
                                                .title,
                                            style: const TextStyle(
                                                fontSize: 28,
                                                fontFamily: 'Raleway',
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              buttonindex = index;

                                              var existingIndex = fecthdata
                                                  .favlist
                                                  .indexWhere((id) =>
                                                      id ==
                                                      fecthdata
                                                              .data
                                                              .products[index]
                                                              .id -
                                                          1);

                                              fecthdata.favsaveData();
                                              if (existingIndex != -1) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const FavouritePage(),
                                                    ));
                                                return;
                                              } else {
                                                fecthdata.favlist.add(fecthdata
                                                        .data
                                                        .products[index]
                                                        .id -
                                                    1);
                                                fecthdata.favsaveData();
                                              }

                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const FavouritePage(),
                                                  ));
                                              
                                            },
                                            icon: const Icon(
                                              Icons.favorite_border,
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                                Column(children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RatingBar.builder(
                                        initialRating: fecthdata
                                            .data.products[buttonindex].rating,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 25,
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {},
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              '(${fecthdata.data.products[buttonindex].rating})',
                                              style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            '\$${fecthdata.data.products[buttonindex].price}',
                                            style: const TextStyle(
                                                fontSize: 28,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          const Icon(Icons.discount),
                                          Text(
                                              '${fecthdata.data.products[buttonindex].discountPercentage}%')
                                        ],
                                      ),
                                    ],
                                  )
                                ]),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      fecthdata
                                          .data.products[buttonindex].brand,
                                      style: const TextStyle(
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 17),
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  child: Text(
                                    fecthdata
                                        .data.products[buttonindex].description,
                                    style: const TextStyle(
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17,
                                        color: Colors.black38),
                                  ),
                                ),
                                const SizedBox(
                                  height: 75,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: 60,
                                          width: 200,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0)),
                                                  backgroundColor:
                                                      Colors.blueGrey.shade900),
                                              // onPressed: () {
                                              //   Navigator.push(
                                              //       context,
                                              //       MaterialPageRoute(
                                              //         builder: (context) =>
                                              //             Cart(),
                                              //       ));

                                              // },
                                              onPressed: () {
                                                buttonindex = index;
                                                fecthdata.saveData();
                                                var existingIndex = fecthdata
                                                    .shoppingsample
                                                    .indexWhere((id) =>
                                                        id ==
                                                        fecthdata
                                                                .data
                                                                .products[index]
                                                                .id -
                                                            1);

                                                fecthdata.saveData();
                                                if (existingIndex != -1) {
                                                  return;
                                                } else {
                                                  fecthdata.shoppingsample.add(
                                                      fecthdata
                                                              .data
                                                              .products[index]
                                                              .id -
                                                          1);
                                                  fecthdata.saveData();
                                                }
                                                const snackBar = SnackBar(
                                                    content: Text(
                                                        "Added successfully"));
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                              },
                                              child: const Text('Add to Cart')),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 60,
                                              width: 100,
                                              child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0)),
                                                      backgroundColor: Colors
                                                          .blueGrey.shade900),
                                                  onPressed: () {},
                                                  child: const Text("BUY")),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                ],
              )));
    });
  }
}
