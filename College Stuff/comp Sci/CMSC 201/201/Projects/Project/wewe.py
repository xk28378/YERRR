def test(maxi, numList, count):
    if count == len(numList):
        return maxi
    else:
        if numList[count] > maxi:
            maxi = numList[count]
        return test(maxi, numList, count+1)




def main():
    count = 1
    num = int(input("give me a number nigga"))
    List = []
    for i in range(num):
        currList = []
        count2 = 1
        while count2 <= num:
            currList.append(count)
            count += 1
            count2 += 1
        List.append(currList)
        num -= 1
    print(List)






main()
        
