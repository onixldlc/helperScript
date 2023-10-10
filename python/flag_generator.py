import random

alphabet="abcdefghijklmnopqrstuvwxyz"
alphabet_capital="ABCDEFGHIJKLMNOPQRSTUVWXYZ"

dictionary=[
    ["A","a","4","A"],
    ["B","b","8","6"],
    ["C","c"],
    ["D","d"],
    ["E","e","3"],
    ["F","f"],
    ["G","g","9"],
    ["H","h"],
    ["I","i","1"],
    ["J","j"],
    ["K","k"],
    ["L","l","1"],
    ["M","m"],
    ["N","n"],
    ["O","o","0"],
    ["P","p"],
    ["Q","q"],
    ["R","r"],
    ["S","s","5"],
    ["T","t","7"],
    ["U","u"],
    ["V","v"],
    ["W","w"],
    ["X","x"],
    ["Y","y"],
    ["Z","z","2"],
]

def generate_flag(flag, flag_len=16):
    new_flag=""
    for character in flag:
        if(character in alphabet):
            new_flag += random.choice(dictionary[ord(character)-97])
        elif(character in alphabet_capital):
            new_flag += random.choice(dictionary[ord(character)-65])
        else:
            new_flag += character
    if(len(new_flag)-1 < flag_len):
        new_flag+="_"
        for x in range(flag_len - len(new_flag)):
            # print(random.choice(random.choice(dictionary)))
            new_flag += random.choice(random.choice(dictionary))
    return new_flag.replace(" ","_")
            
for x in range(5):
    # input_flag = input("enter desired flag: ")
    flag = generate_flag("test_flag!")
    print(flag)
    
    flag = generate_flag("another testing flag!", 32)
    print(flag)
    
    print("")
