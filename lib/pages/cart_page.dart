import 'package:flutter/material.dart';
import 'package:flutter_catelog/utils/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Theme.of(context).brightness == Brightness.light
        ? MyTheme.lightStatusNavBar()
        : MyTheme.darkStatusNavBar();
    return Material(
      // tag: const Key('50'),
      child: Material(
        child: Scaffold(
          backgroundColor: Theme.of(context).canvasColor,
          appBar: AppBar(
            title: const Text("Cart"),
            backgroundColor: Colors.transparent,
          ),
          body: Column(children: [
            const Padding(
              padding: EdgeInsets.all(15),
              child: _CartList(),
            ).expand(),
            const Divider(),
            _CartTotal()
          ]),
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Theme.of(context).brightness == Brightness.light
        ? MyTheme.lightStatusNavBar()
        : MyTheme.darkStatusNavBar();
    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            '\$9999',
            style:
                TextStyle(color: Theme.of(context).accentColor, fontSize: 32),
          ),
          const WidthBox(30),
          ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Buying not supported yet'),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).buttonColor),
              ),
              child: const Text(
                'Buy',
                style: TextStyle(color: Colors.white),
              )).w32(context)
        ]),
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.done),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_circle_outline)),
              title: Text('Item 1'),
            ));
  }
}
