import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Model/Category.dart';
import '../Tabs/tab_widget.dart';
import '../cubit/category_detailes_view_model.dart';
import '../cubit/sources_stats.dart';

class CategoryDetails extends StatefulWidget {
  CategoryDetails({super.key, required this.category});

  Category category;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  categorydetailsviewmodel viewModel = categorydetailsviewmodel();
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getsources(widget.category.Id);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<categorydetailsviewmodel, sourcestates>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is sourseloadingstate) {
          return CircularProgressIndicator(
            color: Colors.cyan,
          );
        } else if (state is sourceerrorstate) {
          return Column(
            children: [
              Center(child: Text(state.errormessage)),
              ElevatedButton(
                  onPressed: () {
                    viewModel.getsources(widget.category.Id);
                  },
                  child: Text("try again"))
            ],
          );
        } else if (state is sourcesucssesstate) {
          return tab_widget(sourceslist: state.sourcesList);
        }
        return Container();
      },
    );
  }
}
