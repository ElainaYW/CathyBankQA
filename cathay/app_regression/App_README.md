# Run test cases with Robot Framework

## Emulator Devices
| Device             | Android Version |
|--------------------|-----------------|
| Simulator_Pixel_8a | 14              |

## Software Versions
| Software | Version |
|----------|---------|
| Appium | 2.12.0 |
| Robot Framework | 7.0 |
| Python | 3.11.7 |

### Directory Structure
```
├─tests
│   └─Android
│          AndroidBaseUICore.py  (裝置基本設定)
│          ├─Keyword (一連串動作封裝成function)
│          │   ├─  AndroidDeviceInfo.txt (定義裝置相關function)
│          │   └─  CommonMethod.txt (定義共用Keyword呼叫)
│          ├─TestCase (robot TC)
│          │   └─  CathyBank.robot
│          ├─Variable (xpath/變數定義)
│          │   └─ CathyBankVariable.txt
│          └─reports (存放當次執行robot產生的報告檔案)
│              ├─  20230523-173219 (當前執行的系統時間)
│              │     ├─  <Devices_name>_<Robot_name>(再依照裝置與頁面做區分)
│              │     │     ├─ log.html 
│              │     │     ├─ output.xml
│              │     │     ├─ report.html
│              │     │     ├─ logcat.txt (裝置所發送出去的api紀錄)
├─ README.md
└─ requirements.txt
```

### Steps
1. 啟動 Appium 2.x：
    ```bash
    appium -p {port_you_want} --allow-cors --allow-insecure chromedriver_autodownload --use-plugins execute-driver
    ```
2. 執行腳本 :
    ```
    robot --variable devicename:Simulator_Pixel_8a --variable port:{port_you_want} -d reports ./app_regression/tests/Android/TestCase/CathyBank.robot
    ```