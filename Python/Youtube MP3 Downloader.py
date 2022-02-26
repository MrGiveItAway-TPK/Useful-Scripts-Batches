#use this version 
#pip install pytube3
#if you get an error do
#python -m pip install --upgrade pytube
from pytube import YouTube
import os
import pyautogui
  
Youtube_Link=pyautogui.prompt("Paste Youtube Link:")
video = YouTube(Youtube_Link)
print("Video Name: ",video.title)
print("Length: ",video.length)
print("Downloading Video... Please Be Patient...")
mp3=video.streams.filter(only_audio=True).first()
mp3_src = mp3.download()
print("Converting To Mp3... Please Be Patient...")
base, ext = os.path.splitext(mp3_src)
file_name_mp3 = base + '.mp3'
os.rename(mp3_src, file_name_mp3)
print(video.title + " has been successfully downloaded.")