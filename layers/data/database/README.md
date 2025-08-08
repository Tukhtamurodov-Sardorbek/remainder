flutter pub deps | grep sqlite
Checks if any other package is pulling in sqlite3_flutter_libs

flutter pub deps | grep -A 10 sqlcipher_flutter_libs
Checks what package is bringing 

flutter pub deps --style=compact | grep sqlite3_flutter_libs
Searches for sqlite3_flutter_libs's parent