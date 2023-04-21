import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ods_flutter_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';

// class AboutScreen extends StatefulWidget{

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  // TODO: correct version package insertion
  // Package Version instantiation
  PackageInfo _packageInfo = PackageInfo(
      appName: 'Unknown',
      packageName: 'Unknown',
      version: 'Unknown',
      buildNumber: 'Unknown');
  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Image(image: AssetImage('assets/il_about.png')),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(AppLocalizations.of(context)!.appTitle,
                  style: Theme.of(context).textTheme.headlineLarge),
              Text(
                  'Version ${_packageInfo.version} (build ${_packageInfo.buildNumber})',
                  style: Theme.of(context).textTheme.bodySmall),
              Text(AppLocalizations.of(context)!.aboutPageAppDescription,
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ],
    ));
  }
}
