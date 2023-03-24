import 'package:ecommerce/views/drawer/header.dart';
import 'package:ecommerce/views/screens/Favourite_page.dart';
import 'package:ecommerce/views/screens/profile_page.dart';
import 'package:ecommerce/views/widgets/showSnackbar.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../screens/cart_page.dart';
import 'bottom_user_info.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();

  
}

class _CustomDrawerState extends State<CustomDrawer> {
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedContainer(
        curve: Curves.easeInOutCubic,
        duration: const Duration(milliseconds: 500),
        width: 300,
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: Color.fromRGBO(20, 20, 20, 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //heder
              const CustomDrawerHeader(),
              const Divider(
                color: Colors.grey,
              ),
              ListTile(
                onTap: () {
                  nextScreen(context, const ProfilePage());
                },
                leading: const Icon(
                  Icons.person,
                  color: kWhiteIcon,
                ),
                title: const Text(
                  "profile",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Cart(),
                      ));
                },
                leading: const Icon(Icons.shopping_cart, color: kWhiteIcon),
                title: const Text(
                  "Cart",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
              ),
              const ListTile(
                leading: Icon(Icons.pin_drop, color: kWhiteIcon),
                title: Text(
                  "Destinations",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
              ),

              const ListTile(
                leading: Icon(Icons.message_rounded, color: kWhiteIcon),
                title: Text(
                  "Message",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FavouritePage(),
                      ));
                },
                leading: const Icon(Icons.favorite, color: kWhiteIcon),
                title: const Text(
                  "Favourite",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
              ),
              const Divider(color: Colors.grey),
              const Spacer(),
              const ListTile(
                leading: Icon(Icons.notifications, color: kWhiteIcon),
                title: Text(
                  "Notifications",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
              ),
              const ListTile(
                leading: Icon(Icons.settings, color: kWhiteIcon),
                title: Text(
                  "My profile",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
              ),

              // BottomUserInfo
              const SizedBox(height: 10),
              const BottomUserInfo()
            ],
          ),
        ),
      ),
    );
  }
}
