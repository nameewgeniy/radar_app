import 'package:flutter/material.dart';
import 'package:radar/models/Assets.dart';

class AssetsList extends StatelessWidget {

  final List<Assets> items;

  AssetsList(this.items);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return AssetsListItem(items[index]);
      },
    );
  }

}

class AssetsListItem extends StatelessWidget {

  final Assets item;

  AssetsListItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Material(
        type: MaterialType.card,
        child: ListTile(
          onTap: () => {},
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.name,
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                      fontSize: 14)
              ),
              Container(height: 10),
              Row(
                children: [
                  Text("Доля: ",
                      style:
                      TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500)
                  ),
                  Text(item.amount.toString() + " руб",
                      style:
                      TextStyle(fontSize: 12,
                          color: item.amount == 0 ? Colors.grey : item.amount > 0 ? Colors.lightGreen : Colors.red,
                          fontWeight: FontWeight.w500
                      )
                  ),
                ],
              )
            ],
          ),
          trailing: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(item.percent.toString() + "%",
                    style: TextStyle(fontSize: 13, color: Colors.grey, fontWeight: FontWeight.w500)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
