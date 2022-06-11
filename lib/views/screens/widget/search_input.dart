import 'package:flutter/material.dart';
import 'package:flutter_eticaret/views/screens/search_screen.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(children: [
        Flexible(
          flex: 1,
          child: TextField(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return SearchScreen();
              }));
            },
            readOnly: true,
            decoration: InputDecoration(
              fillColor: Colors.orange,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              hintText: "Ürün Ara",
              hintStyle: TextStyle(
                color: Colors.black,
              ),
              prefixIcon: Container(
                padding: EdgeInsets.all(15),
                child: Image.asset(
                  'assets/icons/loupe.png',
                  width: 15,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(
                15,
              )),
          child: Image.asset(
            'assets/icons/setting-lines.png',
            width: 25,
          ),
        )
      ]),
    );
  }
}
