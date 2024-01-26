import 'package:flutter/cupertino.dart';
import 'package:github_flutter_repo/features/home/data/models/git_repo_item.dart';

import '../../../../core/core_export.dart';
import '../../../../core/costants/decoration_constants.dart';
import '../../../../res/measurement.dart';
import 'circuler_image.dart';
import 'star_and_lang.dart';

class RepoCardItem extends StatelessWidget {
  final GitRepoItem gitRepoItem;
  const RepoCardItem({super.key, required this.gitRepoItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecorations.smallRoundCornerShadow,
      margin: EdgeInsets.only(
          left: measurement.margin(16), right: measurement.margin(16)),
      padding: EdgeInsets.all(measurement.padding(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleImageItem(
                imageUrl: gitRepoItem.owner?.avatarUrl ?? "",
              ),
              customSpace(width: measurement.margin(10)),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    customText(
                        text: gitRepoItem.name ?? "",
                        textStyle: AppTextStyle().w500s14()),
                    starAndLangWidget(
                        starCount: gitRepoItem.stargazersCount ?? 0,
                        language: gitRepoItem.language ?? ""),
                  ],
                ),
              ),
            ],
          ),
          customText(
              maxLines: 2,
              text: gitRepoItem.description ?? "",
              textStyle: AppTextStyle().w400s14()),
        ],
      ),
    );
  }
}
