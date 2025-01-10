# 國泰補習班中，有五位學生期中考的成績分別為[53, 64, 75, 19, 92]，但是老師在輸入成績的時候看反了，把五位學生的成績改成了[35, 46, 57, 91, 29]，請用一個函數來將學生的成績修正。	
# "輸入: [35, 46, 57, 91, 29]
# 輸出: [53, 64, 75, 19, 92]"
def crrection_of_score(error_score_list):
    correct_score_list = []
    for i in error_score_list:
        correct_score_list.append(i%10*10+i//10)
    return(correct_score_list)


# 國泰銀行要慶祝六十周年，需要買字母貼紙來布置活動空間，文字為"Hello welcome to Cathay 60th year anniversary"，請寫一個程式計算每個字母(大小寫視為同個字母)出現次數	
# "輸出：
# 0 1
# 6 1
# A 4
# C 2
# E 5
# H 3
# ....(繼續印下去)"
def count_number_of_character_in_string(text):
    letter_dic = {}
    text = text.replace(" ", "").upper()
    for i in text:
        letter_dic[i] = text.count(i)

    for i in sorted(letter_dic.items()):
        print(str(i[0]) + " " + str(i[1]))


# QA部門今天舉辦團康活動，有n個人圍成一圈，順序排號。從第一個人開始報數（從1到3報數），凡報到3的人退出圈子。
# 請利用一段程式計算出，最後留下的那位同事，是所有同事裡面的第幾順位?
# 輸入：n值(0-100)
# 輸出：第幾順位
def find_last_one(n):
    if n <= 0 or n > 100:
        return "輸入錯誤，請輸入範圍在 1 到 100 之間的數字。"

    circle = list(range(1, n + 1))
    index = 0

    while len(circle) > 1:
        index = (index + 2) % len(circle)
        circle.pop(index)

    return f"最後留下的是第 {circle[0]} 順位的人。"

def main():
    error_score_list = [35, 46, 57, 91, 29]
    print(crrection_of_score(error_score_list))

    text = "Hello welcome to Cathay 60th year anniversary"
    count_number_of_character_in_string(text)

    n = int(input("請輸入參與活動的人數（1-100）："))
    result = find_last_one(n)
    print(result)


if __name__=="__main__":
    main()