import random

for i in range(10):
    key = random.randint(1,2)
    if key == 1:
        value = random.uniform(1.0, 10.0)
    else:
        value = random.randint(100, 200)
    
    print('key = {0};  value = {1};  type = {2}'.format(key, value, type(value)))

