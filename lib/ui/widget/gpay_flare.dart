import 'package:flare_dart/math/mat2d.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_pay_clone/core/viewmodel/homepage_viewmodel.dart';
import 'package:provider/provider.dart';

class Flr extends StatefulWidget {
  @override
  _FlrState createState() => _FlrState();
}

class _FlrState extends State<Flr> with FlareController {
  HomepageModel model;

  @override
  Widget build(BuildContext context) {
    model = Provider.of<HomepageModel>(context);
    return FlareActor("assets/gpayAnim.flr",
        alignment: Alignment.center, fit: BoxFit.contain, controller: this);
  }

  ActorAnimation _rock;

  @override
  void initialize(FlutterActorArtboard artboard) {
    _rock = artboard.getAnimation("Untitled");
  }

  @override
  void setViewTransform(Mat2D viewTransform) {}

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    _rock.apply(model.sliderPos, artboard, .5);
    return true;
  }
}
