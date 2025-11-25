import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/ListMapProvider.dart';

class ListMapfetch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider State Management List Fetch'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
      body: Consumer<ListMapProvider>(
        builder: (ctx, provider, __) {
          var allData = provider.getData();
          // ctx.watch<ListMapProvider>().getData();
          return allData.isNotEmpty
              ? ListView.builder(
                itemCount: allData.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      title: Text('${allData[index]['name']}'),
                      subtitle: Text('${allData[index]['email']}'),
                      trailing: Row(
                        mainAxisSize: .min,
                        children: [
                          TextButton(
                            onPressed: () {
                              provider.DeleteData(index);
                            },
                            child: Text('Delete'),
                          ),
                          TextButton(
                            onPressed: () {
                              provider.Update({
                                'name': 'Furqan Khan',
                                'email': 'shfqt25@gmail.com',
                              }, index);
                            },
                            child: Text('Update'),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : Center(child: Text('No Data entered Yet'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ListMapProvider>().addData({
            'name': 'Shafqat Ullah',
            'email': 'shfqt25@gmail.com',
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
    );
  }
}
