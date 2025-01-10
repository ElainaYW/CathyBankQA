*** Settings ***
Library    AppiumLibrary
Library    OperatingSystem
Library    ../AndroidBaseUICore.py
Resource    ../Keyword/CommonMethod.txt
Resource    ../Keyword/AndroidDeviceInfo.txt
Resource    ../Variable/CathyBankVariable.txt

Suite Setup    Android Open Chrome Browser

Suite Teardown    Terminate Application    com.android.chrome

*** Test Cases ***
正確開啟國泰世華網頁並截圖
    [Documentation]    1.使用Chrome App到國泰世華銀行官網(https://www.cathaybk.com.tw/cathaybk/)並將畫面截圖(./CATHAY/reports/cathy_index.png)
    Go To Url    https://www.cathaybk.com.tw/cathaybk/
    Wait Until Element Is Visible    ${cathy_text_index_title}
    Capture Page Screenshot    cathy_index.png
正確計算信用卡子項目數量並截圖
    [Documentation]    2. 點選左上角選單，進入 個人金融 > 產品介紹 > 信用卡列表，需計算有幾個項目並將畫面截圖。
        ...    計算有幾個項目 > 終端機輸出 => Number of credit card sub-item : 9
        ...    畫面截圖 => ./CATHAY/reports/cathy_credit_card_sub_item.png
    Go To Url    https://www.cathaybk.com.tw/cathaybk/
    Wait Until Element Is Visible    ${cathy_text_index_title}
    Click Element After It Is Visible    ${cathy_button_functional_icon}    5
    Click Element After It Is Visible    ${cathy_button_product_intro}    5
    Click Element After It Is Visible    ${cathy_button_credit_card}    5
    Wait Until Element Is Visible    ${cathy_button_credit_card_intro}
    ${credit_card_list} =    Get Webelements    ${cathy_list_credit_card}
    ${credit_card_num} =    Get Length    ${credit_card_list}
    Log To Console    Number of credit card sub-item : ${credit_card_num}
    Capture Page Screenshot    cathy_credit_card_sub_item.png
正確計算停發卡數量並截圖
    [Documentation]    3. 個人金融 > 產品介紹 > 信用卡 > 卡片介紹 > 計算頁面上所有(停發)信用卡數量並截圖
        ...    計算頁面上所有(停發)信用卡數量 => 停發卡數量 : 11
        ...    畫面截圖(11) => ./CATHAY/reports/stop_card_1.png ~ ./CATHAY/reports/stop_card_11.png
        ...    檢查數量一致 => stop_card_count = stop_card_point_num = 11
    Go To Url    https://www.cathaybk.com.tw/cathaybk/
    Wait Until Element Is Visible    ${cathy_text_index_title}    15
    Click Element After It Is Visible    ${cathy_button_functional_icon}    15
    Click Element After It Is Visible    ${cathy_button_product_intro}    15
    Click Element After It Is Visible    ${cathy_button_credit_card}    15
    Click Element After It Is Visible    ${cathy_button_credit_card_intro}    15
    Wait Until Element Is Visible    ${cathy_text_credit_card_intro_title}    15

    Sleep    2
    Switch To Context    WEBVIEW_chrome
    Sleep    2

    Wait Until Element Is Visible    ${cathy_text_stop_card_title}    5
    Scroll Element Into View    ${cathy_text_stop_card_title}
    Capture Page Screenshot    stop_card_list.png

    ${stop_card_name} =    Get WebElements    ${cathy_text_stop_card_name}
    ${stop_card_count} =    Get Length    ${stop_card_name}
    Log To Console    停發卡數量 : ${stop_card_count}

    ${stop_card_point} =    Get WebElements    ${cathy_list_stop_card}
    ${stop_card_point_num} =    Get Length    ${stop_card_point}

    FOR    ${counter}    IN RANGE    ${stop_card_point_num}
        ${element} =    Get WebElement    xpath=//div[@class="cubre-a-iconTitle__text" and text()='停發卡']/ancestor::div[contains(@class,'cubre-o-block__wrap')]//span[@aria-label="Go to slide ${${counter}+1}"]
        Click Element    ${element}
        Sleep    2
        Capture Page Screenshot    stop_card_${${counter}+1}.png
    END
    Should Be Equal    ${stop_card_count}    ${stop_card_point_num}