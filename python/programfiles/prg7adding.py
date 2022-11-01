list_num=[5,8,13,44,75]
print("My list"+ str( list_num))
i_list_len=len(list_num)
#print (i_list_len)
for x in range(i_list_len):
    #print (x)
    if (x == i_list_len-1):
        print(list_num[x]+list_num[0])
    else:
        print(list_num[x]+list_num[x+1])  
