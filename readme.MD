1. docker run -v $(pwd):/app -v /app/node_modules -p 3000:3000 -d  --name node-app node-app-image

This maps your host’s project folder into /app in the container.
Everything in /app (including node_modules) is replaced by what’s on your host.
If your host doesn’t have a node_modules folder, the container’s node_modules is hidden, and dependencies may be missing.
Docker creates a separate, container-managed volume for /app/node_modules.
This means: Your host’s node_modules (or lack thereof) won’t overwrite the container’s node_modules.
The container can safely run npm install and use its own dependencies, even if your host doesn’t have them or has incompatible ones.
Summary: Anonymous volumes “shield” important directories from being replaced by the host’s bind mount, ensuring the container’s dependencies remain intact and compatible
Key points:
They persist data outside the container’s filesystem.
They are not easily referenced by name (unlike named volumes).
They are useful for storing data you don’t need to access directly, but want to persist across container restarts.

without the anonymous volume : 
sathwikmadhusudan@sathwiks-MacBook-Air devops-node.js-express % docker logs node-app

> devops-node.js-express@1.0.0 dev
> nodemon index.js

sh: 1: nodemon: not found

NOTICE: after we run the above command, node-module returns back to the hosts file system, so bind mount is a 2 way street. So whatever changes made inside the container can change the hosts files, which is a security risk. We can change it to a READ-ONLY bind mount using 

docker run -v $(pwd):/app:ro -v /app/node_modules -p 3000:3000 -d  --name node-app node-app-image



