# Visit https://www.lddgo.net/en/string/pyc-compile-decompile for more information
# Version : Python 3.9

import hashlib
print('==== You found Flag 4! ====')
x = input('Enter your GTID : ')
hash_object = hashlib.sha256(x.encode())
hex_dig = hash_object.hexdigest()
hash_object2 = hashlib.sha256(b'CS6035-nOvA-Band3ir4')
hex_dig22 = hash_object2.hexdigest()
print('Combined hash   :  ', hex_dig + hex_dig22)
