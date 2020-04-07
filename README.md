a simple script to download pluralsight Courses

Thanks To https://gist.github.com/jesperorb/c14aef85735c54f479896cfa6f16a1e5 For useful helps.

In order to use this script first install youtube-dl and then run "$ bash pluralsightDlScript.sh"

Ps. We strongly recommend to use proxy while using it .
Commands to install Youtube-dl : 


Installation
For macOS/UNIX

With brew for macOS:

brew install youtube-dl

With npm:

npm install youtube-dl

Or you can curl/wget the thing:

sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

For Windows

Download with npm as above or just download the exe-file from the link below and put the exe in your PATH.

Or download with npm like above.

Source: youtube-dl download
Usage
Example: download from Pluralsigh
"$ bash pluralsightDlScript.sh"
