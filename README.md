# pickme

A new Flutter project.

## Getting Started

PickMe Flutter Application Handover:

This document serves to inform the receiver of the PickMe mobile application handover of the specifications that were used during the development of the PickMe mobile application. The documentation will contain information on the sdk system requirements, architectures and coding principles.

Index
1.System requirements
2.Software requirements
3.SDK requirements
4.App store credential
5.Github credentials
6.Code magic credentials
7.Application Architecture



## System requirements

The flutter project can be further developed on a Windows or Mac machine

Windows requirements:
 Operating Systems: Windows 10 or later (64-bit), x86-64 based.
 Disk Space: 1.64 GB (does not include disk space for IDE/tools).
 Tools: Flutter depends on these tools being available in your environment. Windows PowerShell 5.0 or newer (this is pre-installed with Windows 10)


Mac requirements:

Requirement
                            Minimum                               Recommended
CPU Cores                     4                                       8
Memory in GB                  8                                       16
Display resolution in pixels  WXGA (1366 x 768)                       FHD (1920 x 1080)
Free disk space in GB         36.0                                    56.0



## Software requirements

Windows and Mac OS Software requirements
    Visual Studio Code 1.77 or later with the Flutter extension for VS Code.
    Android Studio 2023.1 (Hedgehog) or later with the Flutter plugin for IntelliJ.
    IntelliJ IDEA 2023.1 or later with both the Flutter plugin for IntelliJ and the Android plugin for IntelliJ.

Mac os specific requirements
    Xcode 15 to debug and compile native Swift or ObjectiveC code. The Xcode installation includes  Git 2.27 or later to manage source code.
    CocoaPods 1.13 to compile enable Flutter plugins in your native apps.

Further instruction on how to install above software to be found on the flutter official guide: https://docs.flutter.dev/get-started/install/macos/desktop



## SDK requirements

The PickMe application was build on the following SDK and versions:

Flutter: Flutter SDK: 3.13.5
Dart: Dart 3.1.2
Android: API 34
IOS: IOS 11
Cocoapods:  1.13.0


## Application architecture

The PickMe application was built using the Clean Architecture as the project must still scale in functionality and this allows very simple maintainability.


Clean architecture:
The clean architecture description video can be found in the link below:
https://www.youtube.com/watch?v=SmJB8cy8emU

## iOS In-App Purchase
To run the app, you will need to create a .env file in the root of the project with the following:
- IOS_IN_APP_PURCHASE_PRODUCT=IOS_IN_APP_PURCHASE_PRODUCT


## To build the release app bundle for Android, You will have to create a keys.properties file which will have the following

storePassword=STORE_PASSWORD
keyPassword=KEY_PASSWORD
keyAlias=KEY_ALIAS
storeFile=FILE_ABSOLUTE_PATH

where
STORE_PASSWORD is the release store password, this should have been provided with the handover document
KEY_PASSWORD is the release key password, this should have been provided with the handover document
KEY_ALIAS is the key alias, this should have been provided with the handover document
FILE_ABSOLUTE_PATH is the absolute path to the key store file, this should have been provided with the handover document