import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sample/src/listCategory/bloc/list_category_bloc.dart';
import 'package:flutter_bloc_sample/src/listCategory/bloc/list_category_state.dart';

import 'bloc/list_category_event.dart';

class ListCategoryPage extends StatefulWidget {
  @override
  _ListCategoryPageState createState() => _ListCategoryPageState();
}

class _ListCategoryPageState extends State<ListCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => ListCategoryBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('List Category'),
        ),
        body: ListCategoryBody(),
      ),
    );
  }
}

class ListCategoryBody extends StatefulWidget {
  @override
  _ListCategoryBodyState createState() => _ListCategoryBodyState();
}

class _ListCategoryBodyState extends State<ListCategoryBody> {
  ListCategoryBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<ListCategoryBloc>(context);
    _bloc.dispatch(FetchListCategory());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _bloc,
        builder: (context, state) {
          if (state is ListCategoryLoaded) {
            return Stack(
              children: <Widget>[
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: _buildCategoryGridView(context, state),
                )
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 1.5,
              ),
            );
          }
        });
  }

  Widget _buildCategoryGridView(
      BuildContext context, ListCategoryLoaded state) {
    return GridView.builder(
      itemCount: state.listCate.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final featured = state.listCate[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[400], offset: Offset(1, 3), blurRadius: 2)
            ],
          ),
          child: Stack(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: "${featured.previewPhotos[0].urls.small}",
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    Center(child: Icon(Icons.error)),
              ),
              Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: Text(
                        '${featured.title}',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildListViewParent(BuildContext context, ListCategoryLoaded state) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: state.listCate.length,
      itemBuilder: (context, index) {
        final _category = state.listCate[index];
        return Container(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('${_category.title}'),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, indexHorizontal) {
                    return Container(
                      width: 100,
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://images.unsplash.com/photo-1565619454971-9d005dbf4d71?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max",
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            Center(child: Icon(Icons.error)),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
