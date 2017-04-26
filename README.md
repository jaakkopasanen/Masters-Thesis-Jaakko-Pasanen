# Masters-Thesis-Jaakko-Pasanen
My master's thesis on customer support A.I.

## Ubuntu
Install texlive-full
```
sudo apt-get install texlive-full -y
```

Install Biblatex and Biber. You'll need compatible versions of Biblatex and Biber.
```
sudo apt-get install texlive-bibtex-extra biber -y
```
If there's a compatibility issue on Ubuntu 16.04, see this thread http://askubuntu.com/questions/761985/textlive-bibtex-extra-and-biber-conflict

Optionally install Texmaker
```
sudo apt-get install texmaker -y
```

## Windows
1. Install MikTex https://miktex.org/howto/install-miktex
2. Install `biblatex` and `mixtex-biber-bin` packages with MixTeX Package Manager if not already installed
3. Optionally install Texmaker http://www.xm1math.net/texmaker/download.html#windows

MikTex will propt you to install several packages during the first run, just accept everything and don't ask questions...

## Mac
1. Install MacTex http://www.tug.org/mactex/ (it should also contain BibLaTex and Biber)
2. Optionally intall Texmaker http://www.xm1math.net/texmaker/download.html#macosx

## Using Texmaker
Use LuaLaTex and View PDF for Quick build
- Options -> Configure Texmaker -> Quick Build
- Select `LuaLatex + View PDF`

Add Biber as a user command
- User -> User Commands -> Edit User Commands
- Edit command 1.
- Menu Item is `Biber`
- Command is `biber %`

Edit F2 to run LuaLatex
- Options -> Configure Texmaker -> Shortcuts
- Find LuaLaTex, click Shortcut and press F2

On the first time and every time bibliography or citations change run LuaLaTex (F2), Biber (Shift+Alt+F1) and Quick build (F1)

When changing only Tex file contents just run Quickbuild (F1)

## Using Mendeley for Bibliography
I highly recommend Mendeley for handling all your sources and generating the bibliography. It's basically better than RefWorks in every way and doesn't need TUT IP address.

1. Register at mendeley.com
2. Download and install Mendeley desktop client
3. Launch client and sign in
4. Create folder in My Library for your thesis and name it `thesis_refs`
5. Add your papers to `sources` folder
6. Add sources to Mendeley by opening dropdown on `Add Files` and selecting `Add Folder...`, select `sources` folder. Repeat every time you add papers to `sources` folder.
7. Setup BibTeX syncing (Tools -> Options -> BibTeX -> Enable BibTeX syncing). Select `Create one BibTeX file per group`. Point path to your thesis folder. If you use git, you might want to add other .bib files created by Mendeley to your .gitignore file. Optionally you can point the path to another folder on your PC, but in that case you have to copy thesis_refs.bib to your thesis folder every time the bibliography changes.

If you need to force resync of BibTex bibliography from Mendeley, you can select thesis_refs folder and toggle one of the articles as read-unread (the green of grey dot before name)
