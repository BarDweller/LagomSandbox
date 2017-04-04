# LagomSandbox
Play with Lagom &amp; Eclipse via Xpra without installing locally

Usage:

`git clone https://github.com/BarDweller/LagomSandbox.git`

`cd LagomSandbox`

Edit `xpra.pwd` if you don't wish to use the default password of `stilleto`

`docker build -t lagom-sandbox .`

`docker run -p7778:7777 lagom-sandbox`

Change `7778` to a free port on your local system you want to use. 

Install xpra client from https://xpra.org

Start Xpra client, and use 

- Mode: `TCP`
- Username: `root`
- Host: IP address where you can reach docker ports (linux use the machine ip, docker-engine use the docker engine ip)
- Port: `7778` (or whatever you set)
- Password: `stiletto` (or whatever you changed it to)

The console for the `docker run` command will show a new connection, and you will gain a new xterm window open on your desktop.

Use the xterm to open a couple of extra xterms =)

`xterm &`

`xterm &`

In one of the new xterms do:

`cd /lagomtest`

`mvn lagom:runAll`

In the other new xterm do:

`firefox`

In the original xterm do:

`cd /eclipse`

`./eclipse`

Then use the default for the workspace path, and tell eclipse to 'import existing maven project into workspace' and use the 
root directory `/lagomtest`

In the firefox that has opened, visit `http://127.0.0.1:9000/api/hello/Wibble`
