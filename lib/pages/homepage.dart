import 'package:api_project/Models/datamodel.dart';
import 'package:api_project/provider/dataprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile"),),
        body: Container(
      child: Column(children: [
        
        Expanded(child: Consumer<CatogryProvider>(
          builder: (context, catogryProvider, child) {
            if (catogryProvider.isLoading == true) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (catogryProvider.catogrys.length > 0) {
                return ListView.builder(
                  physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    itemCount: catogryProvider.catogrys.length,
                    itemBuilder: (context, index) {
                      Data currentModel =catogryProvider.catogrys[index];
                      return ListTile(
                        contentPadding: EdgeInsets.all(0),
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(currentModel.avatar!),
                        ),
                        title: Text(currentModel.firstName!),
                        subtitle: Text(currentModel.email!),
                      );
                    });
              } else {
                return Text("data not found");
              }
            }
          },
        ))
      ]),
    ));
  }
}
