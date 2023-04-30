
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:web_site_ahmetozkanio/src/projects/service/projects_service.dart';

import '../../utils/custom_rect_tween.dart';
import '../model/project_model.dart';

class ProjectDetailView extends StatelessWidget {
  const ProjectDetailView(
      {Key? key, required this.project, required this.heroIndex})
      : super(key: key);
  final Projects project;
  final int heroIndex;
  Widget build(BuildContext context) {

    return Center(
      child: Padding(
        padding: EdgeInsets.all(128.0),
        child: Hero(
          tag: heroIndex,
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin!, end: end!);
          },
          child: Material(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)),
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    expandedHeight: 160.0,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              project.thumbnail ?? "",
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                
                  SliverToBoxAdapter(
                    child: 
              Container(
                child: Markdown(data: """# Markdown: Syntax
              
              *   [Overview](#overview)
                  *   [Philosophy](#philosophy)
                  *   [Inline HTML](#html)
                  *   [Automatic Escaping for Special Characters](#autoescape)
              *   [Block Elements](#block)
                  *   [Paragraphs and Line Breaks](#p)
                  *   [Headers](#header)
                  *   [Blockquotes](#blockquote)
                  *   [Lists](#list)
                  *   [Code Blocks](#precode)
                  *   [Horizontal Rules](#hr)
              *   [Span Elements](#span)
                  *   [Links](#link)
                  *   [Emphasis](#em)
                  *   [Code](#code)
                  *   [Images](#img)
              *   [Miscellaneous](#misc)
                  *   [Backslash Escapes](#backslash)
                  *   [Automatic Links](#autolink)
              
              
              **Note:** This document is itself written using Markdown; you
              can [see the source for it by adding '.text' to the URL](/projects/markdown/syntax.text).
              
              ----
              
              ## Overview
              
              ### Philosophy
              
              Markdown is intended to be as easy-to-read and easy-to-write as is feasible.
              
              Readability, however, is emphasized above all else. A Markdown-formatted
              document should be publishable as-is, as plain text, without looking
              like it's been marked up with tags or formatting instructions. While
              Markdown's syntax has been influenced by several existing text-to-HTML
              filters -- including [Setext](http://docutils.sourceforge.net/mirror/setext.html), [atx](http://www.aaronsw.com/2002/atx/), [Textile](http://textism.com/tools/textile/), [reStructuredText](http://docutils.sourceforge.net/rst.html),
              [Grutatext](http://www.triptico.com/software/grutatxt.html), and [EtText](http://ettext.taint.org/doc/) -- the single biggest source of
              inspiration for Markdown's syntax is the format of plain text email.
              
              ## Block Elements
              
              1"""),
              ))
                ],
              )),
        ),
      ),
    );
  }
}
      