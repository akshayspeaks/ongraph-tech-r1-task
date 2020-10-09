import 'package:flutter/material.dart';

class MyDropdownField extends StatefulWidget {
  final String hintText;
  final List<String> dropMenuItems;
  MyDropdownField({Key key, this.hintText, this.dropMenuItems})
      : super(key: key);

  @override
  _MyDropdownFieldState createState() => _MyDropdownFieldState(
      (dropMenuItems.map((item) => ListItem(item))).toList());
}

class _MyDropdownFieldState extends State<MyDropdownField> {
  final List<ListItem> _itemList;
  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;
  _MyDropdownFieldState(this._itemList);

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.value),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_itemList);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: _selectedItem,
        items: _dropdownMenuItems,
        onChanged: (value) {
          setState(() {
            _selectedItem = value;
          });
        },
      ),
    );
  }
}

class ListItem {
  String value;

  ListItem(this.value);
}
