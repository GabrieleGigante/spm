# shared_preferences_manager

## Usage

To use this plugin, add shared_preferences_manager as a dependency in your pubspec.yaml file.

### 1. Instantiate the class

```
SharedPreferencesManager spm = SharedPreferencesManager();
```

### Set Key/Value pair

```
spm.setKV('key', 'value');
```

### Get Key/Value pair

```
var result = await spm.getKV('key', 'default value');
```
