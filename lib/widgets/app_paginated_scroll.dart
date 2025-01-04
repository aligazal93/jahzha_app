
import 'package:flutter/material.dart';

import 'app_loading_indicator.dart';
import 'app_refresh_indicator.dart';

class AppPaginatedScroll<T> extends StatefulWidget {
  const AppPaginatedScroll({
    Key? key,
    this.enabled = true,
    required this.items,
    required this.getPaginatedItems,
    required this.builder,
    this.onRefresh,
    this.onPagesFinished,
  }) : super(key: key);

  final bool enabled;
  /// [items] are the displayed data in [builder]
  final List<T> items;
  /// [builder] displayed scrollable widget must display data from same object passed to [items] so pass by reference works
  final Widget Function(BuildContext context) builder;
  /// [getPaginatedItems] is the function that getting paginated items by page and addAll new data to [items] by passing by reference
  final Future<List<T>> Function(int page) getPaginatedItems;
  final Future<void> Function()? onRefresh;
  final void Function(int maxPage)? onPagesFinished
  ;
  @override
  State<AppPaginatedScroll<T>> createState() => _AppPaginatedScrollState<T>();
}

class _AppPaginatedScrollState<T> extends State<AppPaginatedScroll<T>> {
  int page = 1;
  bool isLoading = false;

  void rebuild() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AppRefreshIndicator(
      onRefresh: widget.onRefresh == null
          ? null
          : () async {
              if (widget.onRefresh != null) {
                page = 1;
                widget.items.clear();
                rebuild();
                return widget.onRefresh!.call();
              }
            },
      child: NotificationListener<ScrollNotification>(
        key: Key('AppPaginatedScroll'),
        onNotification: (notification) {
          if (widget.enabled &&notification.metrics.extentAfter == 0 && page != 0 && !isLoading) {
            isLoading = true;
            rebuild();
            page++;
            widget.getPaginatedItems(page).then((value) {
              if (value.isEmpty) {
                widget.onPagesFinished?.call(page - 1);
                page = 0;
              }
              widget.items.addAll(value);
              isLoading = false;
              rebuild();
            });
          }
          return false;
        },
        child: Column(
          children: [
            Expanded(
              child: widget.builder(context),
            ),
            if (isLoading)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: AppLoadingIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}
