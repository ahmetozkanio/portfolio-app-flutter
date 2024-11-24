import 'package:ahmetozkanio/src/models/project.dart';
import 'package:ahmetozkanio/src/utils/widgets/account_icon_button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: NetworkImage(project.thumbnail ?? ''),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              _buildOverlay(context),
              _buildProjectName(context),
              _buildGithubButton(context),
              _buildAppStoreButton(context),
              _buildPlayStoreButton(context),
            ],
          ),
        ));
  }

  Widget _buildOverlay(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        child: Blur(
          blur: 9,
          blurColor: Theme.of(context).colorScheme.secondaryContainer,
          child: Container(
            height: 38.0,
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }

  Widget _buildProjectName(BuildContext context) {
    return Positioned(
      left: 8,
      bottom: 8,
      right: 52,
      child: AutoSizeText(
        project.projectName ?? '',
        minFontSize: 8,
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(fontWeight: FontWeight.w500),
        maxLines: 1,
      ),
    );
  }

  Widget _buildGithubButton(BuildContext context) {
    return Positioned(
        top: 0,
        right: 0,
        child: Visibility(
          visible: project.github != null && project.github!.isNotEmpty,
          child: AccountIconButton(
            account: "github",
            url: project.github ?? "",
            iconData: FontAwesomeIcons.github,
            isFilled: true,
          ),
        ));
  }

  Widget _buildAppStoreButton(BuildContext context) {
    return Positioned(
      top: 10,
      left: 10,
      child: Visibility(
        visible: project.appStore != null && project.appStore!.isNotEmpty,
        child: AccountIconButton(
          account: "appstore",
          url: project.appStore ?? "",
          iconData: FontAwesomeIcons.appStore,
          isFilled: true,
        ),
      ),
    );
  }

  Widget _buildPlayStoreButton(BuildContext context) {
    return Positioned(
      top: 50,
      left: 0,
      child: Visibility(
        visible: project.playStore != null && project.playStore!.isNotEmpty,
        child: AccountIconButton(
          account: "playstore",
          url: project.playStore ?? "",
          iconData: FontAwesomeIcons.googlePlay,
          isFilled: true,
        ),
      ),
    );
  }
}
