import 'package:flutter/material.dart';
import 'package:muziksifadir/admin/views/bloglar/blog_ekle.dart';
import 'package:muziksifadir/viewmodel/admin_model.dart';
import 'package:muziksifadir/viewmodel/sayfalar_model.dart';
import 'package:provider/provider.dart';

class AdminBloglar extends StatefulWidget {
  AdminBloglar({Key key}) : super(key: key);

  @override
  _AdminBloglarState createState() => _AdminBloglarState();
}

class _AdminBloglarState extends State<AdminBloglar> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SayfalarModel>(
      create: (BuildContext context) => SayfalarModel(),
      child: ChangeNotifierProvider<AdminModel>(
        create: (BuildContext context) => AdminModel(),
        child: BlogEkle(),
      ),
    );
    /* Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FlatButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => Dialog(
                          child: ChangeNotifierProvider<SayfalarModel>(
                            create: (BuildContext context) => SayfalarModel(),
                            child: ChangeNotifierProvider<AdminModel>(
                              create: (BuildContext context) => AdminModel(),
                              child: BlogEkle(),
                            ),
                          ),
                        ));
              },
              child: Text("Blog Ekle")),
        )
      ],
    );*/
  }
}
