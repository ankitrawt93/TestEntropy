# Created by ankit at 26/02/26
*** Settings ***
Library    String
Library    Collections

*** Variables ***
${BROWSER} =                            Chrome

#For basic login (using - ${var} and &{dict})
&{ValidCredentials}                     Username=student    Password=Password123
&{InvalidCredentialsWrongUsername}      Username=istudent    Password=Password123
&{InvalidCredentialsWrongPassword}      Username=istudent    Password=Wrong123

##For register (using - ${var} and &{dict})
&{user1}                                username=ankitTester${{random.randint(1000, 9999)}}    password=12345


##For multiple login / List of user profile verification (using - ${var} and @list)
@{USERS}                                standard_user    problem_user    error_user    visual_user
@{SaucePassword}                        secret_sauce

# Automated Nudge form in TVS Mexico UAT
#Will only run when connected to EVON vpn or on Prod url
${NAME} =                               Test entry
${MOBILE} =                             9999999999
${EMAIL} =                              test@test.com
${LOCATION} =                           san

