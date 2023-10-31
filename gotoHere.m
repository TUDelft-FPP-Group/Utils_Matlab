function [] = gotoHere()

activeFile = matlab.desktop.editor.getActive;
cd(fileparts(activeFile.Filename));

end