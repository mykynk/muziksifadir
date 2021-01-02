import 'package:flutter/material.dart';
import 'package:muziksifadir/routing/route_names.dart';
import 'package:muziksifadir/viewmodel/admin_model.dart';
import 'package:muziksifadir/admin/widgets/control_panel_item.dart';
import 'package:provider/provider.dart';

class AdminControlPanel extends StatefulWidget {
  AdminControlPanel({Key key}) : super(key: key);

  @override
  _AdminControlPanelState createState() => _AdminControlPanelState();
}

class _AdminControlPanelState extends State<AdminControlPanel> {
  AdminModel _adminModel;

  @override
  Widget build(BuildContext context) {
    _adminModel = Provider.of<AdminModel>(context);

    return _adminModel.state == AdminViewState.Idle
        ? Column(
            children: [
              SizedBox(height: 100),
              _adminModel.adminMi
                  ? Wrap(
                      children: [
                        ControlPanelItem(
                          title: "Ana Sayfa",
                          icon: Icons.home,
                          navigationPath:
                              AdminControlPanelRoute + AnaSayfaRoute,
                        ),
                        ControlPanelItem(
                          title: "Hakkında",
                          icon: Icons.person,
                          navigationPath:
                              AdminControlPanelRoute + HakkindaRoute,
                        ),
                        ControlPanelItem(
                          title: "Bizden Söylemesi",
                          icon: Icons.assignment,
                          navigationPath:
                              AdminControlPanelRoute + BizdenSoylemesiRoute,
                        ),
                        ControlPanelItem(
                            title: "Blog",
                            icon: Icons.book,
                            navigationPath:
                                AdminControlPanelRoute + BloglarRoute),
                        ControlPanelItem(
                          title: "Sizden Gelenler",
                          icon: Icons.comment,
                          navigationPath:
                              AdminControlPanelRoute + SizdenGelenlerRoute,
                        ),
                        ControlPanelItem(
                          title: "Röportajlar",
                          icon: Icons.question_answer,
                          navigationPath:
                              AdminControlPanelRoute + RoportajlarRoute,
                        ),
                      ],
                    )
                  : Text("Lütfen Bekleyin"),
            ],
          )
        : Text("Lütfen Bekleyin");
  }
}
