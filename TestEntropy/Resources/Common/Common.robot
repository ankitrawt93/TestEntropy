*** Settings ***
Library  SeleniumLibrary
Library  String

*** Variables ***
${BROWSER}    chrome    # Default browser - will be overridden if specified in test file

*** Keywords ***


Begin Web Test
    ${browser_lower}=    Convert To Lowercase    ${BROWSER}
    Run Keyword If    '${browser_lower}' == 'chrome'      Open Chrome Browser
    ...    ELSE IF    '${browser_lower}' == 'firefox'     Open Firefox Browser
    ...    ELSE IF    '${browser_lower}' == 'edge'        Open Edge Browser
    ...    ELSE    Fail    Unsupported browser: ${BROWSER}

    Maximize Browser Window




Open Chrome Browser
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver

    ${prefs}=    Create Dictionary
    ...    credentials_enable_service=${False}
    ...    profile.password_manager_enabled=${False}
    ...    profile.password_manager_leak_detection=${False}

    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
#    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox

    Call Method    ${options}    add_argument    --disable-notifications
    Call Method    ${options}    add_argument    --disable-infobars
    Call Method    ${options}    add_argument    --disable-save-password-bubble
    Call Method    ${options}    add_argument    --ignore-certificate-errors
    Call Method    ${options}    add_argument    --disable-features\=PasswordLeakDetection
    Call Method    ${options}    add_argument    --disable-features\=SafetyCheck
    Call Method    ${options}    add_argument    --disable-client-side-phishing-detection
    Call Method    ${options}    add_argument    --safebrowsing-disable-download-protection
    Call Method    ${options}    add_argument    --disable-sync
    Call Method    ${options}    add_argument    --user-data-dir\=/tmp/chrome_automation
    Create Webdriver    Chrome    options=${options}

# ------------------ FIREFOX ------------------

Open Firefox Browser
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys, selenium.webdriver
    Call Method    ${options}    set_preference    signon.rememberSignons    False
    Call Method    ${options}    set_preference    signon.autofillForms    False
    Call Method    ${options}    set_preference    signon.management.page.breach-alerts.enabled    False
    Call Method    ${options}    set_preference    signon.management.page.enabled    False
    
    ${service}=    Evaluate    sys.modules['selenium.webdriver.firefox.service'].Service(executable_path='/snap/bin/geckodriver')    sys, selenium.webdriver.firefox.service
    
    Create Webdriver    Firefox    options=${options}    service=${service}

# ------------------ EDGE ------------------

Open Edge Browser
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].EdgeOptions()    sys, selenium.webdriver

    ${prefs}=    Create Dictionary
    ...    credentials_enable_service=${False}
    ...    profile.password_manager_enabled=${False}

    Call Method    ${options}    add_experimental_option    prefs    ${prefs}

    Call Method    ${options}    add_argument    --disable-notifications
    Call Method    ${options}    add_argument    --disable-infobars

    Create Webdriver    Edge    options=${options}



End Web Test
    Close Browser