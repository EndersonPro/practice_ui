import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButtom {
  final Function onPressed;
  final IconData icon;

  PinterestButtom({@required this.onPressed, @required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final bool show;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButtom> items;

  PinterestMenu(
      {Key key,
      this.show = true,
      this.backgroundColor = Colors.white,
      this.activeColor = Colors.black,
      this.inactiveColor = Colors.blueGrey,
      @required this.items
    });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: Builder(builder: (context) {
        Provider.of<_MenuModel>(context, listen: false).activeColor =
            this.activeColor;
        Provider.of<_MenuModel>(context, listen: false).inactiveColor =
            this.inactiveColor;
        return AnimatedOpacity(
          duration: Duration(milliseconds: 250),
          opacity: show ? 1 : 0,
          child: _PinterestMenuBackground(
            child: _MenuItems(items),
            backgroundColor: backgroundColor,
          ),
        );
      }),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;

  const _PinterestMenuBackground(
      {Key key, @required this.child, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 60,
      child: child,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButtom> items;

  const _MenuItems(this.items);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            items.length, (index) => _PinterestMenuItem(index, items[index])));
  }
}

class _PinterestMenuItem extends StatelessWidget {
  final int index;
  final PinterestButtom item;

  _PinterestMenuItem(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final itemSelected = Provider.of<_MenuModel>(context).itemSelected;
    final activeColor = Provider.of<_MenuModel>(context).activeColor;
    final inactiveColor = Provider.of<_MenuModel>(context).inactiveColor;
    Color color;
    double size;

    if (itemSelected == index) {
      color = activeColor;
      size = 30.0;
    } else {
      color = inactiveColor;
      size = 25.0;
    }

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSelected = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(item.icon, size: size, color: color),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSelected = 0;
  Color _activeColor;
  Color _inactiveColor;

  int get itemSelected => this._itemSelected;
  Color get activeColor => this._activeColor;
  Color get inactiveColor => this._inactiveColor;

  set activeColor(Color c) {
    this._activeColor = c;
  }

  set inactiveColor(Color c) {
    this._inactiveColor = c;
  }

  set itemSelected(int index) {
    this._itemSelected = index;
    notifyListeners();
  }
}
