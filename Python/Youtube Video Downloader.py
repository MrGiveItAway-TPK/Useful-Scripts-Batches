#use this version 
#pip install pytube3
#if you get an error do
#python -m pip install --upgrade pytube
from pytube import YouTube
import pyautogui

Youtube_Link=pyautogui.prompt("Paste Youtube Link:")
video = YouTube(Youtube_Link)
print("Video Name: ",video.title)
print("Length: ",video.length)
print("Downloading Video... Please Be Patient...")
video_src = video.streams.get_highest_resolution()
video_src.download()
print(video.title + " has been downloaded successfully !!!")