import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {

  final Function(Settings) onSettingsChanged;
  final Settings settings;

  const SettingsScreen(this.settings, this.onSettingsChanged);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(widget.settings);
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: ListView(
             children: [
               _createSwitch(
                'Sem Glutén',
                'Só exibe refeições sem glutén!',
                widget.settings.isGlutenFree,
                (value) => setState(() => widget.settings.isGlutenFree = value),
              ),
              _createSwitch(
                'Sem Lactose',
                'Só exibe refeições sem lactose!',
                widget.settings.isLactoseFree,
                (value) => setState(() => widget.settings.isLactoseFree = value),
              ),
              _createSwitch(
                'Sem vegana',
                'Só exibe refeições sem veganas!',
                widget.settings.isVegan,
                (value) => setState(() => widget.settings.isVegan = value),
              ),
              _createSwitch(
                'Sem Vegetariana',
                'Só exibe refeições sem vegetariana!',
                widget.settings.isVegetarian,
                (value) => setState(() => widget.settings.isVegetarian = value),
              ),
             ],
            ),
          )
        ],
      ),
    );
  }
}
