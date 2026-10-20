
from selenium import webdriver
from selenium.webdriver.common.by import By

# Open Chrome
driver = webdriver.Chrome()

try:
    # Open application
    driver.get("http://localhost:3001")

    # 1. Test input
    input_box = driver.find_element(By.ID, "studentName")
    input_box.send_keys("Ganga")
    print("Input test: PASS")

    # 2. Test button
    button = driver.find_element(By.ID, "addBtn")
    button.click()
    print("Button test: PASS")

    # 3. Test output and functionality
    result = driver.find_element(By.ID, "result")

    if result.text == "Student added: Ganga":
        print("Output test: PASS")
    else:
        print("Output test: FAIL")

    print("Output:", result.text)

finally:
    driver.quit()
