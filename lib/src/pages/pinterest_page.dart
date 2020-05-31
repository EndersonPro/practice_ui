import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_ui/src/widget/pinterest_menu.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: Scaffold(
        // body: PinterestMenu(),
        body: Stack(
          children: <Widget>[
            PinterestGrid(),
            _MenuPinterestLocation(),
          ],
        ),
      ),
    );
  }
}

class _MenuPinterestLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    bool show = Provider.of<_MenuModel>(context).showMenu;

    return Positioned(
      bottom: 30.0,
      child: Container(
        width: width,
        child: Align(
          child: PinterestMenu(
            show: show,
            activeColor: Colors.redAccent,
            inactiveColor: Colors.grey,
            items: [
              PinterestButtom(
                icon: Icons.pie_chart,
                onPressed: () {
                  print('Icon pie_chart');
                },
              ),
              PinterestButtom(
                icon: Icons.search,
                onPressed: () {
                  print('Icon search');
                },
              ),
              PinterestButtom(
                icon: Icons.notifications,
                onPressed: () {
                  print('Icon notifications');
                },
              ),
              PinterestButtom(
                icon: Icons.supervised_user_circle,
                onPressed: () {
                  print('Icon supervised_user_circle');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);
  ScrollController controller = new ScrollController();
  double scrollPrev = 0.0;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > scrollPrev && controller.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).showMenu = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).showMenu = true;
      }
      scrollPrev = controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      controller: controller,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => Container(
          color: Colors.redAccent,
          child: Center(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text('$index'),
            ),
          )),
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 2 : 1),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _showMenu = true;
  bool get showMenu => this._showMenu;
  set showMenu(bool s) {
    this._showMenu = s;
    notifyListeners();
  }
}
