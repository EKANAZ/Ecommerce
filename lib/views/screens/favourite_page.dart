import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Controller/provider_page.dart';
import '../../utils/colors.dart';
import '../widgets/big_text.dart';
import '../widgets/small_text.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritepageState();
}

class _FavouritepageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderPage>(builder: (context, fecthdata, child) {
      fecthdata.favloadData();
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 24, 24, 26),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(" Favourite"),
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 24, 24, 26),
          iconTheme: const IconThemeData(
              color: Color.fromARGB(255, 216, 213, 213), size: 25),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                      height: 688,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: .8,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 30),
                        itemCount: fecthdata.favlist.length,
                        itemBuilder: (context, index) => Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 254, 254),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Stack(
                              // alignment: Alignment.bottomCenter,
                              children: <Widget>[
                                //  product image
                                Positioned(
                                  top: 15,
                                  left: 12,
                                  child: Container(
                                    height: 125,
                                    width: 140,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 175, 174, 170),
                                      image: DecorationImage(
                                          image: NetworkImage(fecthdata
                                              .data
                                              .products[fecthdata
                                                  .favlist[index]]
                                              .thumbnail),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(18),
                                      boxShadow: const [kDefaultShadow],
                                    ),
                                    // child: Image.asset(
                                    //   "assets/image/0a6bed52d98ca969015324c179c38063.jpg",
                                    //   fit: BoxFit.cover,
                                    // ),
                                  ),
                                ),
                                Positioned(
                                    left: 10,
                                    top: 155,
                                    child: SizedBox(
                                      width: 150,
                                      child: BigText(
                                          text:
                                              fecthdata.data.products[fecthdata.favlist[index]].title,
                                          size: 12,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0)),
                                    )),
                                Positioned(
                                    left: 62,
                                    top: 185,
                                    child: SmallText(
                                      text:
                                          '\$${fecthdata.data.products[fecthdata.favlist[index]].price}',
                                      color: Colors.black,
                                      size: 16,
                                    )),
                              ]),
                        ),
                      )))
            ],
          ),
        ),
      );
    });
  }
}
