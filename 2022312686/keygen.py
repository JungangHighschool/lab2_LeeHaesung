import sys


def generate_serial(seed, key):
    serial = ''
    
    '''
    ####################################
    ######### <Your Code Here> #########
    ####################################

    '''
    
    return serial

if len(sys.argv) < 3:
    print("Seed and Key not provided!!!")
    exit(1)

seed = sys.argv[1]
if len(seed) != 20:
    print("Incorrect seed format")
    exit(1)
    
key = int(sys.argv[2])
if key < 17 or key > 255:
    print("Incorrect key format")
    exit(1)


serial = generate_serial(seed, key)

print(serial)
