import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practice/models/category_model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<CategoryModel> categories = [];

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          searchField(),
          SizedBox(height: 40),
          category_section(categories: categories)
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        "Breakfast",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 28, color: Colors.black),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(color: Color(0xffF7F8F8)),
          child: SvgPicture.asset(
            'assets/icons/Arrow - Left 2.svg',
            height: 20,
            width: 20,
          ),
        ),
      ),
      actions: [
        GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              width: 37,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(color: Color(0xffF7F8F8)),
              child: Text(
                '..',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ))
      ],
    );
  }
}

class category_section extends StatelessWidget {
  const category_section({
    super.key,
    required this.categories,
  });

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('Category',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600))),
        SizedBox(height: 15),
        Container(
          height: 150,
          child: ListView.separated(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(
                    width: 25,
                  ),
              padding: EdgeInsets.only(left: 20, right: 20),
              itemBuilder: (context, index) {
                return Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: categories[index].boxColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: SvgPicture.asset(categories[index].iconPath),
                        ),
                        Text(
                          categories[index].name,
                          style: TextStyle(fontWeight: FontWeight.w400),
                        )
                      ],
                    ));
              }),
        )
      ],
    );
  }
}

class searchField extends StatelessWidget {
  const searchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(15),
            hintText: 'Search Breakfast',
            hintStyle: TextStyle(fontSize: 14, color: Color(0xff1D1617)),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset('assets/icons/Search.svg'),
            ),
            suffixIcon: Container(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    VerticalDivider(
                      color: Color(0xff1D1617),
                      thickness: 0.1,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset('assets/icons/Filter.svg')),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }
}
