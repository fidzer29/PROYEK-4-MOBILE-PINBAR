import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme.dart';

class ProductPage extends StatefulWidget {
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List images = [
    'assets/image_tenda.png',
    'assets/image_tenda.png',
    'assets/image_tenda.png',
  ];

  List similar = [
    'assets/image_tenda.png',
    'assets/image_tenda.png',
    'assets/image_tenda.png',
    'assets/image_tenda.png',
    'assets/image_tenda.png',
    'assets/image_tenda.png',
    'assets/image_tenda.png',
    'assets/image_tenda.png',
    'assets/image_tenda.png',
  ];

  int currentIndex = 0;
  bool isWishlist = false;

  @override
  Widget build(BuildContext context) {
    Future<void> showSuccessDialog() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) => Container(
          width: MediaQuery.of(context).size.width - (2 * defaultMargin),
          child: AlertDialog(
            backgroundColor: warnatulisan,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: SingleChildScrollView(
              child: Column(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: primaryTextColor,
                    ),
                  ),
                ),
                Image.asset(
                  'assets/icon_success.png',
                  width: 100,
                  color: primaryColor,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Sukses!',
                  style: primaryTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Barang berhasil ditambahkan',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 154,
                  height: 44,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Lihat Keranjang',
                      style: primaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                )
              ]),
            ),
          ),
        ),
      );
    }

    Widget indicator(int index) {
      return Container(
        width: currentIndex == index ? 16 : 4,
        height: 4,
        margin: EdgeInsets.symmetric(
          horizontal: 2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ? primaryColor : secondaryTextColor,
        ),
      );
    }

    Widget similarCard(String imageUrl) {
      return Container(
        width: 54,
        height: 54,
        margin: EdgeInsets.only(
          right: 16,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageUrl),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      );
    }

    Widget header() {
      int index = -1;

      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.chevron_left,
                      color: warnatulisan,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Image.asset(
                      'assets/cart-icon.png',
                      width: 19,
                      color: warnatulisan,
                    ),
                  ),
                ]),
          ),
          CarouselSlider(
            items: images
                .map((image) => Image.asset(
                      image,
                      width: MediaQuery.of(context).size.width,
                      height: 310,
                      fit: BoxFit.cover,
                    ))
                .toList(),
            options: CarouselOptions(
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.map((e) {
              index++;
              return indicator(index);
            }).toList(),
          ),
        ],
      );
    }

    Widget content() {
      int index = -1;

      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 17),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
          color: warnabgproyek,
        ),
        child: Column(children: [
          //NOTE: HEADER
          Container(
            margin: EdgeInsets.only(
              top: defaultMargin,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('TENDA 4 ORANG',
                            style: tulisanTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: semiBold,
                            )),
                        Text('Camping',
                            style: tulisanTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: light,
                            )),
                      ]),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isWishlist = !isWishlist;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        isWishlist
                            ? 'Berhasil ditambahkan ke Wishlist'
                            : 'Berhasil dihapus dari Wishlist',
                        textAlign: TextAlign.center,
                        style: primaryTextStyle,
                      ),
                      backgroundColor: isWishlist ? primaryColor : alertColor,
                    ));
                  },
                  child: Image.asset(
                    isWishlist
                        ? 'assets/image_wishlist.png'
                        : 'assets/icon_wishlist.png',
                    width: 20,
                  ),
                ),
              ],
            ),
          ),

          //NOTE: PRICE
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
              top: 20,
              left: defaultMargin,
              right: defaultMargin,
            ),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: warnatulisan,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Harga Sewa',
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                    )),
                Text('Rp 100.000/hari',
                    style: primaryTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: semiBold,
                    )),
              ],
            ),
          ),

          //NOTE: DESCRIPTION
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
              top: defaultMargin,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deskripsi',
                  style: tulisanTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Tenda berukuran kecil, bisa digunakan untuk 2 orang.',
                  style: tulisanTextStyle.copyWith(
                    fontWeight: light,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),

          //NOTE: SIMILAR PRODUCT
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
              top: defaultMargin,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                ),
                child: Text(
                  'Produk Serupa',
                  style: tulisanTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: similar.map((image) {
                    index++;
                    return Container(
                      margin:
                          EdgeInsets.only(left: index == 0 ? defaultMargin : 0),
                      child: similarCard(image),
                    );
                  }).toList(),
                ),
              )
            ]),
          ),

          //NOTE: BUTTON
          Container(
            margin: EdgeInsets.all(defaultMargin),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/detail-chat');
                  },
                  child: Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/button-chat.png'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Container(
                      height: 54,
                      child: TextButton(
                        onPressed: () {
                          showSuccessDialog();
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: warnatulisan,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Tambah ke Keranjang',
                          style: primaryTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium,
                          ),
                        ),
                      )),
                ),
              ],
            ),
          )
        ]),
      );
    }

    return Scaffold(
        backgroundColor: warnabgareaproyek,
        body: ListView(
          children: [
            header(),
            content(),
          ],
        ));
  }
}
