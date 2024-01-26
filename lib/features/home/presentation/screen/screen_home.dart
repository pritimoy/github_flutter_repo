import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_flutter_repo/core/utils/state_status.dart';
import 'package:github_flutter_repo/res/measurement.dart';

import '../../../../core/core_export.dart';
import '../bloc/home_bloc.dart';
import '../widget/repo_card_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController? _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  _loadData() {
    context.read<HomeBloc>().add(RequestGithubRepository());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.stateStatus == StateStatus.loaded) {
            print("list count ------count ${state.gitRepoItemList.length}");
          }
        },
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(
              top: measurement.margin(16),
            ),
            child: state.stateStatus == StateStatus.loaded
                ? state.gitRepoItemList.isNotEmpty
                    ? ListView.separated(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return RepoCardItem(
                            gitRepoItem: state.gitRepoItemList[index],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                          height: 12,
                        ),
                      )
                    : Container(
                        child: Center(
                          child: customText(text: "empty list"),
                        ),
                      )
                : state.stateStatus == StateStatus.error
                    ? Container(
                        child: customText(text: "error"),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
          );
        },
      ),
    );
  }
}
