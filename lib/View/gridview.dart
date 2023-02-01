import 'package:e_commerce_app/Controller/provider.dart';
import 'package:e_commerce_app/View/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class GridviewPage extends StatelessWidget {
  GridviewPage({super.key});
  int buttonindex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, getdata, child) {
      return Scaffold(
        body: Stack(
          children: [
            GridView.builder(

                // physics: NeverScrollableScrollPhysics(),
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(bottom: 100),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1 / 1.5,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: 30,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                    onTap: (() {
                      buttonindex = index;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage(index: index)));
                    }),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        color: Colors.grey[200],
                        child: Stack(children: [
                          Positioned(
                              // left: 10,
                              // right: 10,
                              child: Container(
                            height: 180,
                            // width: 180,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      getdata.data.products[index].thumbnail),
                                  fit: BoxFit.fill),
                            ),
                          )),
                          Positioned(
                              top: 185,
                              left: 10,
                              child: Text(getdata.data.products[index].brand,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          Positioned(
                            top: 200,
                            left: 5,
                            child: RatingBar.builder(
                              initialRating:
                                  getdata.data.products[index].rating,
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
                          ),
                          Positioned(
                              top: 200,
                              left: 130,
                              child: Text(
                                  '\(${getdata.data.products[index].rating})',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          Positioned(
                              top: 225, left: 10, child: Icon(Icons.discount)),
                          Positioned(
                              top: 225,
                              left: 40,
                              child: Text(
                                '${getdata.data.products[index].discountPercentage.toString()}% Off',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                          Positioned(
                              bottom: 3,
                              left: 10,
                              child: Text('In Stock',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          Positioned(
                              bottom: 1,
                              left: 60,
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                                child: Text(
                                  getdata.data.products[index].stock.toString(),
                                  style: TextStyle(fontSize: 14),
                                ),
                                radius: 10,
                              )),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                height: 50,
                                width: 90,
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(60))),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: 15,
                                      left: 40,
                                      child: Text(
                                          '\$${getdata.data.products[index].price}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17)),
                                    )
                                  ],
                                ),
                              )),
                        ]),
                      ),
                    ),
                  );
                }),
          ],
        ),
      );
    });
  }
}
