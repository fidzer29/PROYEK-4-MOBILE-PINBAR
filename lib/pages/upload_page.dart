import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme.dart';
import 'package:flutter_application_1/widgets/image_picker.dart';
import 'package:flutter_application_1/widgets/dropdown_button.dart';

class UploadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar();
    }

    Widget inputNama() {
      return Container(
        margin: const EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Produk',
              style: tulisanTextStyle.copyWith(
                fontSize: 13,
                fontWeight: medium,
              ),
            ),
            TextFormField(
              style: blackTextStyle,
              decoration: InputDecoration(
                hintText: 'Masukkan Nama Produk',
                hintStyle: secondaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: subtitleColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget inputDeskripsi() {
      return Container(
        margin: const EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Deskripsi Produk',
              style: tulisanTextStyle.copyWith(
                fontSize: 13,
                fontWeight: medium,
              ),
            ),
            TextFormField(
              style: blackTextStyle,
              decoration: InputDecoration(
                hintText: 'Masukkan Deskripsi',
                hintStyle: secondaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: subtitleColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget inputKategori() {
      return Container(
        margin: const EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kategori',
              style: tulisanTextStyle.copyWith(
                fontSize: 13,
                fontWeight: medium,
              ),
            ),
            DropdownButtonExample(),
          ],
        ),
      );
    }

    Widget inputHarga() {
      return Container(
        margin: const EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Harga (Opsional untuk sewa per hari)',
              style: tulisanTextStyle.copyWith(
                fontSize: 13,
                fontWeight: medium,
              ),
            ),
            TextFormField(
              style: blackTextStyle,
              decoration: InputDecoration(
                hintText: 'Masukkan harga',
                hintStyle: secondaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: subtitleColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget inputStok() {
      return Container(
        margin: const EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Stok',
              style: tulisanTextStyle.copyWith(
                fontSize: 13,
                fontWeight: medium,
              ),
            ),
            TextFormField(
              style: blackTextStyle,
              decoration: InputDecoration(
                hintText: 'Masukkan jumlah stok',
                hintStyle: secondaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: subtitleColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(height: 30),
          ImagePickerButton(),
          inputNama(),
          inputDeskripsi(),
          inputKategori(),
          inputHarga(),
          inputStok(),
        ]),
      );
    }

    return Scaffold(
      backgroundColor: warnabgproyek,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: warnatulisan,
          leading: IconButton(
            icon: Icon(
              Icons.close,
              color: primaryTextColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Upload Barang',
            style: primaryTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.check,
                color: primaryTextColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: content(),
      resizeToAvoidBottomInset: false,
    );
  }
}
