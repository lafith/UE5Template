# UE5Template

This is a template project for a C++ UE5 project based on [Alex Forsythe](https://www.youtube.com/c/AlexForsythe/videos)'s [tutorial](https://www.youtube.com/watch?v=94FvzO1HVzY) video.

## Building and Running
1. After Downloading this repository you can use the **rename_project.py** to change the template structure. Replace <proj_name> to your name of choice.
```
$ python3 rename_project.py --name <proj_name>
```


2. After that go into the project where a bash script named 'ue.bat' is written for various purposes.
Usage is as follows:
```
$cd <proj_name>
$./ue.bat build         [Compile the modules]
$./ue.bat editor        [Open the project in the UE5 Editor]
$./ue.bat run           [Run a playable instance of the game ]
$./ue.bat buildexe      [Build the standalone game]
$./ue.bat ship          [Cook and Build the standalone game for shipping]
```

