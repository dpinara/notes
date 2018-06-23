# input/output/errorout
    '''
    Admin@DESKTOP-2V0SC6I MINGW64 /d/projects/github/notes (master)
    $ ls junit README.md notExists.txt 1> out.txt 2>error.txt
    
    Admin@DESKTOP-2V0SC6I MINGW64 /d/projects/github/notes (master)
    $ cat error.txt
    ls: cannot access 'notExists.txt': No such file or directory
    
    Admin@DESKTOP-2V0SC6I MINGW64 /d/projects/github/notes (master)
    $ ls junit README.md notExists.txt 1> out.txt 2>&1
    
    Admin@DESKTOP-2V0SC6I MINGW64 /d/projects/github/notes (master)
    $ cat out.txt
    ls: cannot access 'notExists.txt': No such file or directory
    README.md
    
    junit:
    images/
    README.md
    
    Admin@DESKTOP-2V0SC6I MINGW64 /d/projects/github/notes (master)
    $ cat error.txt
    ls: cannot access 'notExists.txt': No such file or directory
    
    Admin@DESKTOP-2V0SC6I MINGW64 /d/projects/github/notes (master)
    $
    Admin@DESKTOP-2V0SC6I MINGW64 /d/projects/github/notes (master)
    $ cat out1.txt
    ls: cannot access 'notExists.txt': No such file or directory
    README.md
    
    junit:
    images/
    README.md
    
    Admin@DESKTOP-2V0SC6I MINGW64 /d/projects/github/notes (master)
    $ ls junit README.md notExists.txt 2>/dev/null
    README.md
    
    junit:
    images/  README.md

    Admin@DESKTOP-2V0SC6I MINGW64 /d/projects/github/notes (master)
    $ cat <<NUMS
    > whatever you type
    > until you write nums in upper case
    > NUMS
    whatever you type
    until you write nums in upper case
    
    Admin@DESKTOP-2V0SC6I MINGW64 /d/projects/github/notes (master)
    $ cat <<NUMS >redirect.txt
    > whatever you type
    > it will get saved
    > in to the files redirect.txt
    > NUMS
    
    Admin@DESKTOP-2V0SC6I MINGW64 /d/projects/github/notes (master)
    $ cat redirect.txt
    whatever you type
    it will get saved
    in to the files redirect.txt
    
    Admin@DESKTOP-2V0SC6I MINGW64 /d/projects/github/notes (master)
    $ sudo passwd testuser --stdin <<< "testpass"
    Admin@DESKTOP-2V0SC6I MINGW64 /d/projects/github/notes (master)
    $

    Admin@DESKTOP-2V0SC6I MINGW64 /d/projects/github/notes (master)
    $ ls filenotpresent.txt
    ls: cannot access 'filenotpresent.txt': No such file or directory
    
    Admin@DESKTOP-2V0SC6I MINGW64 /d/projects/github/notes (master)
    $ echo $?
    2

    '''
# Linux 
    - Reading file
    - Reading process
    - basic loops
    - reading for array
    
    