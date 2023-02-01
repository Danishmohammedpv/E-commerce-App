import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/Controller/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  DetailPage({super.key, required this.index});
  final int index;
  int buttonindex = 0;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Map<String, dynamic> mylist = {};
  // List<Map<String, dynamic>> _items = [];
  // final _shoppingBox = Hive.box('shopping box');

  // @override
  // void initState() {
  //   super.initState();
  //   _refreshitems();
  // }

  // void _refreshitems() {
  //   final Data = _shoppingBox.keys.map((Key) {
  //     final value = _shoppingBox.get(Key);
  //     return {"key": Key, "name": value["name"], "quantity": value['quantity']};
  //   }).toList();
  //   setState(() {
  //     _items = Data.reversed.toList();
  //   });
  // }

  // Future<void> _createItem(Map<String, dynamic> newItem) async {
  //   await _shoppingBox.add(newItem);
  //   _refreshitems();
  // }

  // Map<String, dynamic> _readitem(int key) {
  //   final item = _shoppingBox.get(key);
  //   return item;
  // }

  // Future<void> _updateitem(int itemkey, Map<String, dynamic> item) async {
  //   await _shoppingBox.delete(itemkey);
  //   _refreshitems();
  // }

  // Future<void> _deleteItem(int itemKey) async {
  //   await _shoppingBox.delete(itemKey);
  //   _refreshitems();
  //   if (!mounted) return;
  //   ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('An item has been deleted')));
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, getdata, child) {
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 23, 26, 39),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 23, 26, 39),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 250, aspectRatio: 16 / 12, viewportFraction: 0.8,
                  initialPage: 0, enableInfiniteScroll: true, reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 1),
                  autoPlayAnimationDuration: Duration(milliseconds: 1000),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  // onPageChanged: callbackFunction,
                  scrollDirection: Axis.horizontal,
                ),
                items: <Widget>[
                  for (var i = 0;
                      i < getdata.data.products[widget.index].images.length;
                      i++)
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(getdata
                                  .data.products[widget.index].images[i]))),
                    )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 530,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        getdata.data.products[widget.index].title,
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w900),
                      ),
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating:
                                getdata.data.products[widget.index].rating,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 20,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                              '(${getdata.data.products[widget.index].rating})')
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Icon(Icons.discount),
                          Text(
                              '${getdata.data.products[widget.index].discountPercentage}%')
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 20),
                        child: Text(
                          '\$${getdata.data.products[widget.index].price}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 28),
                        ),
                      ),
                      Text(getdata.data.products[widget.index].description),
                      ElevatedButton(
                          onPressed: (() {
                            print(mylist);
                            var index;
                            mylist.addAll({
                              'title': getdata.data.products[index].brand,
                              'price': getdata.data.products[index].price
                            });
                          }),
                          child: Text('Add to Cart'))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
