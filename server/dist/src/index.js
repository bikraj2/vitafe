import express from 'express';
import bodyParser from 'body-parser';
import cookieParser from 'cookie-parser';
import compression from 'compression';
import cors from 'cors';
import { Server } from 'socket.io';
import { createServer } from 'http';
// imports from userDefine modules
import { dbConnect } from '../core/database/databse.js';
//
const port = 8000;
const app = express();
const MONGO_URI = process.env.MONGO_URI;
app.use(cors({ credentials: true }));
app.use(compression());
app.use(cookieParser());
app.use(bodyParser.json());
const httpServer = createServer(app);
const io = new Server(httpServer);
io.on('connection', async (socket) => {
    console.log(`${socket.id} connected`);
    socket.on('sendMessage', (data) => {
        console.log(data);
        io.emit('receivedMessage', data);
    });
});
app.get('/', (req, res) => {
    res.json({ data: ' I am Working' });
});
const startFunc = async () => {
    await dbConnect(MONGO_URI ?? '');
    httpServer.listen(port, () => console.log(`App listening on port : ${port}`));
};
await startFunc();
//# sourceMappingURL=index.js.map