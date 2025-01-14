library google_places_flutter;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_places_flutter/model/place_details.dart';
import 'package:google_places_flutter/model/place_type.dart';
import 'package:google_places_flutter/model/prediction.dart';

import 'package:rxdart/subjects.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

import 'DioErrorHandler.dart';
import 'model/place_bounds.dart';

class GooglePlaceAutoCompleteTextField extends StatefulWidget {
  final InputDecoration inputDecoration;
  final ItemClick? itemClick;
  final GetPlaceDetailswWithLatLng? getPlaceDetailWithLatLng;
  final TextStyle textStyle;
  final String googleAPIKey;
  final int debounceTime;
  final List<String>? countries;
  final TextEditingController textEditingController;
  final ListItemBuilder? itemBuilder;
  final Widget? seperatedBuilder;
  final VoidCallback? onClearData;
  final BoxDecoration? boxDecoration;
  final bool isCrossBtnShown;
  final bool showError;
  final double? containerHorizontalPadding;
  final double? containerVerticalPadding;
  final FocusNode? focusNode;
  final PlaceType? placeType;
  final String? language;
  final PlaceBounds? placeBounds;
  final String? Function(String?)? validator;

  GooglePlaceAutoCompleteTextField({
    required this.textEditingController,
    required this.googleAPIKey,
    this.debounceTime = 600,
    this.inputDecoration = const InputDecoration(),
    this.itemClick,
    this.textStyle = const TextStyle(),
    this.countries,
    this.getPlaceDetailWithLatLng,
    this.itemBuilder,
    this.boxDecoration,
    this.isCrossBtnShown = true,
    this.seperatedBuilder,
    this.showError = true,
    this.containerHorizontalPadding,
    this.containerVerticalPadding,
    this.focusNode,
    this.placeType,
    this.placeBounds,
    this.language = 'en',
    this.onClearData,
    this.validator,
  });

  @override
  _GooglePlaceAutoCompleteTextFieldState createState() =>
      _GooglePlaceAutoCompleteTextFieldState();
}

class _GooglePlaceAutoCompleteTextFieldState
    extends State<GooglePlaceAutoCompleteTextField> {
  final subject = new PublishSubject<String>();
  OverlayEntry? _overlayEntry;
  List<Prediction> alPredictions = [];
  final focusNode = FocusNode();

  TextEditingController controller = TextEditingController();
  final LayerLink _layerLink = LayerLink();
  bool isSearched = false;

  bool isCrossBtn = true;
  late Dio _dio;

  CancelToken? _cancelToken = CancelToken();

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: widget.containerHorizontalPadding ?? 0,
          vertical: widget.containerVerticalPadding ?? 0,
        ),
        alignment: Alignment.centerLeft,
        decoration: widget.boxDecoration ??
            BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(
                color: Colors.grey,
                width: 0.6,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextFormField(
                decoration: widget.inputDecoration,
                style: widget.textStyle,
                controller: widget.textEditingController,
                focusNode: widget.focusNode ?? focusNode,
                onChanged: (string) {
                  subject.add(string);
                  if (widget.isCrossBtnShown) {
                    isCrossBtn = string.isNotEmpty ? true : false;
                    setState(() {});
                  }
                },
                validator: widget.validator,
              ),
            ),
            (!widget.isCrossBtnShown)
                ? SizedBox()
                : isCrossBtn && _showCrossIconWidget()
                    ? IconButton(onPressed: clearData, icon: Icon(Icons.close))
                    : SizedBox()
          ],
        ),
      ),
    );
  }

  Future<void> getLocation(String text) async {
    widget.focusNode?.unfocus();
    focusNode.unfocus();
    String apiURL =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$text&key=${widget.googleAPIKey}&language=${widget.language}";

    if (widget.countries != null) {
      for (int i = 0; i < widget.countries!.length; i++) {
        String country = widget.countries![i];

        if (i == 0) {
          apiURL = apiURL + "&components=country:$country";
        } else {
          apiURL = apiURL + "|" + "country:" + country;
        }
      }
    }
    if (widget.placeBounds == null && widget.placeType != null) {
      apiURL += "&types=${widget.placeType?.apiString}";
    }

    if (_cancelToken?.isCancelled == false) {
      _cancelToken?.cancel();
      _cancelToken = CancelToken();
    }

    try {
      String proxyURL = "https://cors-anywhere.herokuapp.com/";
      String url = kIsWeb ? proxyURL + apiURL : apiURL;

      Response response = await _dio.get(
        url,
        queryParameters: widget.placeBounds == null
            ? null
            : {
                // "bounds": widget.placeBounds!.toBounds(),
                // "components": "country:${widget.placeBounds!.countryCode}",
                // "componentRestrictions": {"country": widget.placeBounds!.countryCode},
                "location":
                    "${widget.placeBounds!.centerLat}, ${widget.placeBounds!.centerLng}",
                "radius": widget.placeBounds!.calculateRadius() * 1000,
                "fields": ["address_components", "geometry", "icon", "name"],
                "strictbounds": "true",
                "types": PlaceType.address.apiString,
              },
      );
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      Map map = response.data;
      if (map.containsKey("error_message")) {
        throw response.data;
      }

      PlacesAutocompleteResponse subscriptionResponse =
          PlacesAutocompleteResponse.fromJson(response.data);

      if (text.length == 0) {
        alPredictions.clear();
        this._overlayEntry!.remove();
        return;
      }

      isSearched = false;
      alPredictions.clear();
      if (subscriptionResponse.predictions!.length > 0 &&
          (widget.textEditingController.text.toString().trim()).isNotEmpty) {
        alPredictions.addAll(subscriptionResponse.predictions!);
      }

      this._overlayEntry = null;
      this._overlayEntry = this._createOverlayEntry();
      Overlay.of(context).insert(this._overlayEntry!);
    } catch (e) {
      var errorHandler = ErrorHandler.internal().handleError(e);
      _showSnackBar("${errorHandler.message}");
    }
  }

  @override
  void initState() {
    super.initState();
    _dio = Dio();
    subject.stream
        .distinct()
        .debounceTime(Duration(milliseconds: widget.debounceTime))
        .listen(textChanged);
  }

  Future<void> textChanged(String text) async {
    getLocation(text);
  }

  OverlayEntry? _createOverlayEntry() {
    if (context.findRenderObject() != null) {
      RenderBox renderBox = context.findRenderObject() as RenderBox;
      var size = renderBox.size;
      var offset = renderBox.localToGlobal(Offset.zero);
      return OverlayEntry(
        builder: (context) => Positioned(
          left: offset.dx,
          top: size.height + offset.dy,
          width: size.width,
          child: CompositedTransformFollower(
            showWhenUnlinked: false,
            link: this._layerLink,
            offset: Offset(0.0, size.height + 5.0),
            child: Material(
                child: ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: alPredictions.length,
              separatorBuilder: (context, pos) =>
                  widget.seperatedBuilder ?? SizedBox(),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () async {
                    var selectedData = alPredictions[index];
                    if (index < alPredictions.length) {
                      removeOverlay();
                      await getPlaceDetailsFromPlaceId(selectedData);
                      widget.itemClick!(selectedData);
                    }
                  },
                  child: widget.itemBuilder != null
                      ? widget.itemBuilder!(
                          context, index, alPredictions[index])
                      : Container(
                          padding: EdgeInsets.all(10),
                          child: Text(alPredictions[index].description!)),
                );
              },
            )),
          ),
        ),
      );
    }
    return null;
  }

  removeOverlay() {
    alPredictions.clear();
    this._overlayEntry = this._createOverlayEntry();
    Overlay.of(context).insert(this._overlayEntry!);
    this._overlayEntry!.markNeedsBuild();
  }

  Future<Response?> getPlaceDetailsFromPlaceId(Prediction prediction) async {
    var url =
        "https://maps.googleapis.com/maps/api/place/details/json?placeid=${prediction.placeId}&key=${widget.googleAPIKey}";
    try {
      Response response = await _dio.get(
        url,
      );

      PlaceDetails placeDetails = PlaceDetails.fromJson(response.data);

      final geometry = placeDetails.result!.geometry;
      prediction.lat = geometry!.location!.lat.toString();
      prediction.lng = geometry.location!.lng.toString();
      prediction.bounds = PlaceBounds(
        lngSW: geometry.viewport!.southwest!.lng!,
        lngNE: geometry.viewport!.northeast!.lng!,
        latSW: geometry.viewport!.southwest!.lat!,
        latNE: geometry.viewport!.northeast!.lat!,
      );

      prediction.city = placeDetails.result!.addressComponents![0].longName;
      for (var i in placeDetails.result!.addressComponents!) {
        if (i.types!.contains('administrative_area_level_1')) {
          prediction.region = i.longName;
        }
        if (i.types!.contains('country')) {
          prediction.countryCode = i.shortName;
          prediction.country = i.longName;
        }
      }
      widget.getPlaceDetailWithLatLng!(prediction);
    } catch (e) {
      var errorHandler = ErrorHandler.internal().handleError(e);
      _showSnackBar("${errorHandler.message}");
    }
    return null;
  }

  void clearData() {
    widget.textEditingController.clear();
    if (_cancelToken?.isCancelled == false) {
      _cancelToken?.cancel();
    }

    setState(() {
      alPredictions.clear();
      isCrossBtn = false;
    });

    if (this._overlayEntry != null) {
      try {
        this._overlayEntry?.remove();
      } catch (e) {}
    }
    widget.focusNode?.unfocus();
    focusNode.unfocus();
    widget.onClearData?.call();
  }

  bool _showCrossIconWidget() {
    return (widget.textEditingController.text.isNotEmpty);
  }

  void _showSnackBar(String errorData) {
    if (widget.showError) {
      final snackBar = SnackBar(
        content: Text("$errorData"),
      );

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

typedef ItemClick = void Function(Prediction postalCodeResponse);
typedef GetPlaceDetailswWithLatLng = void Function(
    Prediction postalCodeResponse);

typedef ListItemBuilder = Widget Function(
    BuildContext context, int index, Prediction prediction);
