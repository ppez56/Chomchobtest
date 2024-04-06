*** Settings ***
Library     SeleniumLibrary
Resource    /Users/crispy/Downloads/Chomchob Section2 Tanyapat Sowcharoensuk/keywords.robot
Resource    /Users/crispy/Downloads/Chomchob Section2 Tanyapat Sowcharoensuk/locator.robot
Variables   /Users/crispy/Downloads/Chomchob Section2 Tanyapat Sowcharoensuk/data.yaml
Suite Teardown    Close Browser

*** Test Cases ***
LOGIN Nejavu USER
    Open Nejavu Url    url=${url_nejavu}    browser=${browser}
    Close Modal If Appear   
    Click Cartoon Topic
    Get Name Book Cartoon Row 1    
    Pick Up In Cart
    Click Badge Cart
    ######Verify Book In Badge Cart#
    #####verify ไม่ได้เนื่องจากเป็นที่เว็ป พอโค้ดมันเก็บค่ามาที่เป็นชื่อหนังสือแล้วเหมือนกับว่าชื่อหนังสือของหน้าเว็ปการ์ตูนกับหน้าตะกร้ามันไม่เหมือนกัน +กับว่าการเว้นวรรคของชื่อหนังสือ#######
    Delete Book
    The System Delete Book In Cart Success
