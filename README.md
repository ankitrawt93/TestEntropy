# TestEntropy
---
Docker - this will run all tests with varibale browser as chrome and reports will be saved locally in reports folder

docker run --rm -it \
-e BROWSER=chrome \
-v $(pwd)/reports/$(date +%Y%m%d_%H%M%S):/app/reports imagename
---
To run below command navigate to the root folder where all the tests are present in the terminal
Commands to run file

---
This command will run all the tests present in your project and will store the results in Results folder in YYYY-MM-DD-HH:MM:SS format 

robot -d Results/$(date +%Y-%m-%d-%H:%M:%S) Tests/

---

This will run the login test

robot -d Results/$(date +%Y-%m-%d-%H:%M:%S) Tests/Login.robot

---
To exclude any test run below command with -e and followed by the test you want to run

robot -d Results/$(date +%Y-%m-%d-%H:%M:%S) -e Nudge Tests/

---
To give browser info run 

robot -d Results/$(date +%Y-%m-%d-%H:%M:%S) -v BROWSER:chrome  Tests/  
in case of no browser info, chrome will run by default

---
