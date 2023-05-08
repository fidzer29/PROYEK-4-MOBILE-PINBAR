import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme.dart';
import 'package:flutter_application_1/widgets/wishlist_card.dart';

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: warnatulisan,
        centerTitle: true,
        title: Text('Wishlist',
            style: primaryTextStyle.copyWith(
              fontSize: 18,
              fontWeight: semiBold,
            )),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyWishlist() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: warnabgproyek,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon_wishlist.png',
                width: 74,
                color: warnatulisan,
              ),
              SizedBox(
                height: 23,
              ),
              Text(
                'Wishlistmu masih kosong',
                style: tulisanTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Ayo cari barang yang kamu inginkan',
                style: tulisankecilTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 44,
                width: 163,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: priceColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Jelajahi Toko',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
            color: warnabgproyek,
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              children: [
                WishlistCard(),
                WishlistCard(),
                WishlistCard(),
              ],
            )),
      );
    }

    return Column(
      children: [
        header(),
        //emptyWishlist(),
        content(),
      ],
    );
  }
}
