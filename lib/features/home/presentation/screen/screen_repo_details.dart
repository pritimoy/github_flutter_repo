import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_flutter_repo/core/core_export.dart';
import 'package:github_flutter_repo/core/utils/date_time_utils.dart';
import 'package:github_flutter_repo/features/home/data/models/git_repo_item.dart';
import 'package:github_flutter_repo/features/home/presentation/bloc/home_bloc.dart';
import 'package:github_flutter_repo/features/home/presentation/widget/circuler_image.dart';
import 'package:github_flutter_repo/features/home/presentation/widget/star_and_lang.dart';
import 'package:github_flutter_repo/res/measurement.dart';

class ScreenRepoDetails extends StatelessWidget {
  const ScreenRepoDetails({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedIndex = context.read<HomeBloc>().state.selectedIndex ?? 0;

    GitRepoItem gitRepoItem =
        context.read<HomeBloc>().state.gitRepoItemList[selectedIndex];
    return Scaffold(
      appBar: AppBar(
        title: customText(text: gitRepoItem.name ?? ""),
      ),
      body: SafeArea(
        child: _pageBody(gitRepoItem),
      ),
    );
  }

  Widget _pageBody(GitRepoItem gitRepoItem) {
    return Padding(
      padding: EdgeInsets.all(measurement.padding(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleImageItem(
            imageUrl: gitRepoItem.owner?.avatarUrl ?? "",
            height: 100,
            width: 100,
          ),
          customText(
              text: "Owner: ${gitRepoItem.owner?.login}",
              textStyle: AppTextStyle().w500s16(),
              top: 20),
          Padding(
            padding: EdgeInsets.only(
                left: measurement.margin(30), right: measurement.margin(30)),
            child: const Divider(
              color: Colors.black,
              height: 25,
              thickness: 2,
              indent: 5,
              endIndent: 5,
            ),
          ),
          customText(
              text: "Repository Name: ${gitRepoItem.name}",
              textStyle: AppTextStyle().w500s14(),
              top: 10),
          customText(
              text: "Repository Description: ${gitRepoItem.description}",
              textStyle: AppTextStyle().w400s12(),
              maxLines: 20,
              top: 2),
          customText(
              text: "Updated At: ${getTime(gitRepoItem.updatedAt!)}",
              textStyle: AppTextStyle().w400s14(),
              maxLines: 1,
              top: 10),
          customText(
              text: "Created At: ${getTime(gitRepoItem.createdAt!)}",
              textStyle: AppTextStyle().w400s14(),
              maxLines: 1,
              top: 1),
          starAndLangWidget(
              starCount: gitRepoItem.stargazersCount ?? 0,
              language: gitRepoItem.language ?? ""),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.remove_red_eye_outlined,
                size: measurement.margin(16),
              ),
              customText(
                  text: "${gitRepoItem.watchersCount}",
                  textStyle: AppTextStyle().w400s12()),
            ],
          ),
        ],
      ),
    );
  }
}
