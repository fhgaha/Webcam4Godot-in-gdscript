Based on https://github.com/GitKindoSaurProductionsHub/Webcam4Godot I just rewrote one file

Works on Windows 10

1. Run the ".\WebcamApp\WebcamApp\bin\Release\Webcam 4 Godot.exe", Webcam Godot 4 should open
2. In Webcam Godot 4 window click "Search For Camera", select a camera using dropdown
3. In Webcam Godot 4 window click "Test Recording", watch you camera image appear
4. In Godot run the test project from Scenes folder
5. In Webcam Godot 4 window click "Connect To Godot", watch camera image appear in Godot running game window

If something doesnt work, try to change Kilo Bytes Amount property in scenes -> Main.tsn -> Control -> Server. Multiply or divide by two.