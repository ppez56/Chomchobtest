*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource   /Users/crispy/Downloads/Chomchob Section2 Tanyapat Sowcharoensuk/locator.robot
*** Keywords ***
Open Nejavu Url
    [Arguments]    ${url}    ${browser}
    SeleniumLibrary.Open Browser    ${url}    ${browser}     
    Maximize Browser Window
    SeleniumLibrary.Wait Until Page Contains Element    ${firstpage}    timeout=10s

Close Modal If Appear   
    ${count}    SeleniumLibrary.Get Element Count    ${nejavuADSfield}
    IF    '${count}' > '0'
        SeleniumLibrary.Click Element     ${nejavuADSfield}
    ELSE
        Sleep    30ms
    END
    SeleniumLibrary.Wait Until Page Contains Element    ${cookiesaccepted}    timeout=30s
    Sleep    1s
    SeleniumLibrary.Click Element    ${cookiesaccepted}
    Sleep    5s

Click Cartoon Topic
    SeleniumLibrary.Click Element    (//span[text()='การ์ตูน'])[1]
    SeleniumLibrary.Wait Until Page Contains Element    (//a[text()='การ์ตูน'])[1]    timeout=15s
    Sleep    1s

Get Name Book Cartoon Row 1     
    #ที่ไม่ใช้loopเพราะลองแล้วแก้ไม่ออกครับ
    Scroll Element Into View    (//h5[@class='detail-title'])[1]
    Sleep    1s
    ${name1}    SeleniumLibrary.Get Text    (//h5[@class='detail-title'])[1]
    ${name2}    SeleniumLibrary.Get Text    (//h5[@class='detail-title'])[2]
    ${name3}    SeleniumLibrary.Get Text    (//h5[@class='detail-title'])[3]
    ${name4}    SeleniumLibrary.Get Text    (//h5[@class='detail-title'])[4]
    ${name5}    SeleniumLibrary.Get Text    (//h5[@class='detail-title'])[5]
    ${book_list}    Create List    ${name1}    ${name2}    ${name3}    ${name4}    ${name5}
    Log To Console    ${book_list}
    Set Global Variable    ${book_list}
    
    
Pick Up In Cart
    ${length}    Get Length    ${book_list}
    ${length}    Evaluate    ${length} + 1
    FOR    ${count}    IN RANGE    1    ${length}
        SeleniumLibrary.Wait Until Page Contains Element    (//button[contains(text(),'ใส่ตะกร้า')])[${count}]
        Sleep    1s
        SeleniumLibrary.Scroll Element Into View    (//button[contains(text(),'ใส่ตะกร้า')])[${count}]
        Sleep    1s
        SeleniumLibrary.Click Button    (//button[contains(text(),'ใส่ตะกร้า')])[${count}]
        SeleniumLibrary.Wait Until Page Contains Element    (//div[contains(text(),'เพิ่มสินค้าในตระกร้าสำเร็จ')])[1]    timeout=10s
        Sleep    2s
    END

Click Badge Cart
    SeleniumLibrary.Click Element    (//div[@id="badge-cart"])[1]
    SeleniumLibrary.Wait Until Page Contains    ตะกร้าของฉัน    timeout=10s

Verify Book In Badge Cart
    #####verify ไม่ได้เนื่องจากเป็นที่เว็ป พอโค้ดมันเก็บค่ามาที่เป็นชื่อหนังสือแล้วเหมือนกับว่าชื่อหนังสือของหน้าเว็ปการ์ตูนกับหน้าตะกร้ามันไม่เหมือนกัน +กับว่าการเว้นวรรคของชื่อหนังสือ#######
    ${length}    Get Length    ${book_list}
    FOR    ${num}    IN RANGE    0    ${length}
        ${book_name}    Get From List    ${book_list}    ${num}
        SeleniumLibrary.Wait Until Page Contains Element    (//*[contains(text(),'${book_name}')])[1]    timeout=10s
        Sleep    30s
    END

Delete Book
    ${length}    Get Length    ${book_list}
    FOR    ${count}    IN RANGE    0    ${length}
        Sleep    1s
        SeleniumLibrary.Click Element    (//a[@class="delete-item"])[1]
        SeleniumLibrary.Wait Until Page Contains Element    //button[text()='ใช่ ลบรายการ']
        Sleep    1s
        SeleniumLibrary.Click Button     //button[text()='ใช่ ลบรายการ']
        SeleniumLibrary.Wait Until Page Contains    ลบรายการสินค้าสำเร็จ
        Sleep    1s
    END

The System Delete Book In Cart Success
    SeleniumLibrary.Wait Until Page Contains Element    //div[@id="badge-cart" and text()='0']
    Sleep    1s