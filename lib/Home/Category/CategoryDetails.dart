import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../API/api_manager.dart';
import '../../Model/Category.dart';
import '../Tabs/tab_widget.dart';
import 'CategoryDetails_ViewModel.dart';

class CategoryDetails extends StatefulWidget {
  CategoryDetails({super.key, required this.category});

  Category category;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryViewModel viewModel = CategoryViewModel();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getsources(widget.category.Id);
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<CategoryViewModel>(
          builder: (context, viewModel , child) {
            if  (viewModel.errorMessage!=null){
              return Column(
                children: [
                  Center(child: Text(viewModel.errorMessage!)),
                  ElevatedButton(onPressed: () {
                    viewModel.getsources(widget.category.Id);
                  }, child: Text("try again")) ],
              );

            };
            if (viewModel.sourceList==null){
              return CircularProgressIndicator(
                color: Colors.cyan,
              );}
            else{
              return tab_widget(sourceslist: viewModel.sourceList!);
            }

          }
          ,)
    );
  }
}
