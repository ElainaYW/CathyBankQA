import subprocess
import socket

def is_port_in_use(port):      ##找尋此systemport是否被使用
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        return s.connect_ex(('localhost', port)) == 0

def find_available_port(start_port, end_port):    ##界定systemport搜尋範圍且使用 "is_port_in_use" 監聽
    for port in range(start_port, end_port + 1):
        if not is_port_in_use(port):
            return port
    return None

def GetDeviceInfo(devicename, port):
    value = "Default"
    if(devicename == "Simulator_Pixel_8a"):
        desired_caps = {
        'platformName' : 'Android',
        'platformVersion' : '14',
        'deviceName' : 'emulator-5554',
        'appPackage' : 'com.android.chrome',
        'appActivity' : 'com.google.android.apps.chrome.Main',
        'automationName' : 'uiautomator2',
        'systemPort' : find_available_port(8140, 8199)
    }
    else:
        value = "Error devicename!"

    if value != "Error devicename!":
        webdriver_url = 'http://localhost:{}'.format(port)
        value = [webdriver_url, desired_caps['platformName'], desired_caps['platformVersion'], desired_caps['deviceName'], desired_caps['appPackage'], desired_caps['appActivity'], desired_caps['automationName'], desired_caps['systemPort']]
    return value
