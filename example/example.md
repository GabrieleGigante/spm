```
SharedPreferencesManager spm = SharedPreferencesManager();
spm.setKV('test', 'Hello world');
var test = await spm.getKV('test', 'no test value');
print(test) //"Hello world"
var test1 = await spm.getKV('test1', 'no test value');
print(test1) //"no test value"
```
