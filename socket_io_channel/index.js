const path = require('path');
const http = require('http');
const express = require('express');
const socketIO = require('socket.io');


const app = express();
const server = http.createServer(app);
const io = socketIO(server);


app.use(express.static(path.join(__dirname, 'public')));

let users = [];


io.on('connection', (socket) => {
    users.push(socket);
    console.log("new user connect: "+ socket.id);
    socket.on("user_connected", (data) => {
        console.log(data);
        var user = {"socket": socket, "user": data};
        users.push(user);
    });

    socket.on("get_users_data", (_)=> {
        console.log("llamando los datos")
        io.emit("users_connected", "s");
    });

    socket.on("disconnect", ()=> {
        console.log("user disconnect " + socket.id);
    })
});

const PORT = process.env.PORT || 3000;

server.listen(PORT, () => console.log("Server running on port: " + PORT));