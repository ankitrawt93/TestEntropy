*** Settings ***

Resource  ../PO/LandingPage.robot
Resource  ../PO/NudgeForm.robot

*** Keywords ***
Nudge Form Fill
    LandingPage.Load
    NudgeForm.Fill Nudge form and submit
    NudgeForm.Verify nudge submission






