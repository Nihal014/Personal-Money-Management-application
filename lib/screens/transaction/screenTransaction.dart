import 'package:flutter/material.dart';

class screentransaction extends StatelessWidget {
  const screentransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(10),
      itemBuilder: (ctx, index) {
        return const Card(
          elevation: 0,
          child: ListTile(
            leading: CircleAvatar(radius: 45, child: Text('12\nDec',textAlign: TextAlign.center,)),
            title: Text('Rs:5000'),
            subtitle: Text('travel'),
          ),
        );
      },
      separatorBuilder: (ctx, index) {
        return const SizedBox(
          height: 10,
        );
      },
      itemCount: 10,
    );
  }
}
