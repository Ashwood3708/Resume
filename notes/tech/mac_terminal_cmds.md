Terminal Commands



grep -v ‘pattern’
- Inverse search
- https://geekflare.com/grep-command-examples/

chmod -R 755 [file]
- Give permissions to dir

Sudo ls
- Shows all accesses and installed libraries(ex npm)

Ln -s [/file location/name] [/new location/name]
- Copyfile to new location

ls -al ~/.ssh
- Shows ssh key pairs

  mongod --config /usr/local/etc/mongod.conf
- Run mongo db

brew services start mongodb/brew/mongodb-community
- Run mongo and have it run in bk forever


kubectl tgt auth
- Authenticate

lsof -i :8080
- Find running process on 8080

Kill <PID>
- Kill process with that PID

Cmd k
- Clear terminal

Cmd T
- New tab in terminal

Open .
- opens finder in current location

Pwd
- Current path

Whoami
- Current user

curl 10.44.8.92:8087/health
- Check health of tap clusters

“\”use escape keys\””
- Use escape key to include symbols

openssl base64 -in <infile> -out <outfile>.encoded
- Encodes a file

Which pip
- Shows what pip is referencing
- Same with pip3, python, python3

alias python=python3
- Will point to python3 when python is called

tr -d '\n' < file.txt
- Rm new lines from file



If you need to have openjdk first in your PATH, run:
echo 'export PATH="/usr/local/opt/openjdk/bin:$PATH"' >> ~/.zshrc

For compilers to find openjdk you may need to set:
export CPPFLAGS="-I/usr/local/opt/openjdk/include"

Launchctl cmds:
——————————
launchctl start <label>
* : Starts the job. This is usually reserved just for testing or debugging a particular job.
launchctl stop <label>:
* Stops the job. Opposite of start, and it's possible that the job will immediately restart if the job is configured to stay running.

launchctl remove <label>:
* Removes the job from launchd, but asynchronously. It will not wait for the job to actually stop before returning, so no error handling on this one.
launchctl load <path>:
* Loads and starts the job as long as the job is not "disabled."
launchctl unload <path>:
* Stops and unloads the job. The job will still restart on the next login/reboot.








————————————————
End
