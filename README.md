# RoasterApp

A Flutter prototype for keeping coffee bean records in one place. The current working section is **Beans**: add, edit, mark active, and delete bean types with supplier, origin, and country fields. Records are saved as JSON in the application's documents directory.

The navigation also contains Roast Sessions, Bean Lots, Costs, Maintenance, and Stats. Those screens currently show planned capabilities, not working data workflows.

## Run the prototype

You need a Flutter installation with a configured native desktop or mobile target. From this repository:

```sh
cd roaster_app
flutter pub get
flutter run
```

The Beans screen uses `dart:io` and `path_provider` for local file storage. A web storage class exists in the source, but the current Beans screen does not select it, so web support should not be assumed.

## Where to look

- `roaster_app/lib/main.dart` defines the app shell and section navigation.
- `roaster_app/lib/tabs/beans_tab.dart` contains the working bean-type interface and persistence calls.
- `roaster_app/lib/tabs/` also contains the planned sections.
- `roaster_app/lib/storage/` contains file and browser storage implementations.

This is an in-progress application. There is no published build or project license in the repository at present.
