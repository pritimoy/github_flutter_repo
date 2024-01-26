import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_flutter_repo/core/utils/state_status.dart';
import 'package:github_flutter_repo/res/measurement.dart';
import 'package:github_flutter_repo/services/navigation/navigation_service.dart';

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
  bool hasNext = false;
  String sortValue = "";
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController!.position.atEdge &&
            !(_scrollController!.position.pixels == 0) &&
            hasNext) {
          _loadData();
        }
      });
  }

  _loadData() {
    context.read<HomeBloc>().add(RequestGithubRepository(sort: sortValue));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customText(
            text: context.resources.strings?.appName ?? "Github Repository",
            textStyle: AppTextStyle().appBarTextStyle),
        actions: [
          _actionButton(context),
        ],
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.stateStatus == StateStatus.loaded) {
            // print("list count ------count ${state.gitRepoItemList.length}");
          }
        },
        builder: (context, state) {
          hasNext = state.hasNext;
          return Container(
            margin: EdgeInsets.only(
              top: measurement.margin(16),
            ),
            child: state.stateStatus == StateStatus.loaded
                ? state.gitRepoItemList.isNotEmpty
                    ? ListView.separated(
                        itemCount: state.gitRepoItemList.length,
                        controller: _scrollController,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              context
                                  .read<HomeBloc>()
                                  .add(RequestOnSelect(index));
                            },
                            child: RepoCardItem(
                              gitRepoItem: state.gitRepoItemList[index],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            customSpace(height: measurement.sizeByHeight(14)))
                    : Center(
                        child: customText(text: "empty list"),
                      )
                : state.stateStatus == StateStatus.error
                    ? Container(
                        child: customText(text: "error"),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
          );
        },
      ),
    );
  }

  _actionButton(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.sort,
        color: Colors.black,
      ), // your action button icon
      onPressed: () {
        showMenu(
          context: context,
          position: const RelativeRect.fromLTRB(
              10, 0, 10, 10), // adjust positioning based on your needs
          items: [
            PopupMenuItem(
              value: 'star',
              child:
                  customText(text: context.resources.strings?.stars ?? "Stars"),
              onTap: () {
                _sortTap("stars");
              },
            ),
            PopupMenuItem(
              value: 'updated',
              child: customText(
                  text: context.resources.strings?.updated ?? "Update"),
              onTap: () {
                _sortTap("updated");
              },
            ),
            PopupMenuItem(
              value: 'clear',
              child:
                  customText(text: context.resources.strings?.clear ?? "Clear"),
              onTap: () {
                _sortTap("");
              },
            ),
          ],
        );
      },
    );
  }

  _sortTap(String sort) {
    sortValue = sort;
    NavigationService.navigatorKey.currentContext
        ?.read<HomeBloc>()
        .add(RequestSortRepository(sort: sort));
  }
}
