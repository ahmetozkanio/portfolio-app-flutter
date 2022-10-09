import 'package:flutter/material.dart';

class ProjectsView extends StatelessWidget {
  ProjectsView({Key? key}) : super(key: key);
  final List<Map> myProducts =
      List.generate(10, (index) => {"id": index, "name": "Product $index"})
          .toList();
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        shrinkWrap: true,
        itemCount: myProducts.length,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(15)),
            child: Text(myProducts[index]["name"]),
          );
        });
  }
}
