import express, { Express, Request, Response } from 'express';
import bodyParser from 'body-parser';
import cookieParser from 'cookie-parser';
import compression from 'compression';
import cors from 'cors';
import socket, { Server, Socket } from 'socket.io';
import { createServer } from 'http';

// imports from userDefine modules
import { dbConnect } from '../core/database/databse.js';

//

const port: number = 8000;
const app: Express = express();
const MONGO_URI = process.env.MONGO_URI;
app.use(cors({ credentials: true }));
app.use(compression());
app.use(cookieParser());
app.use(bodyParser.json());
const httpServer = createServer(app);
const io: Server = new Server(httpServer);
io.on('connection', async (socket: Socket) => {
  console.log(`${socket.id} connected`);
  socket.on(
    'sendMessage',
    (data: { message: String; id: String; date: Date }) => {
      console.log(data);
      io.emit('receivedMessage', data);
    }
  );
});

app.get('/', (req: Request, res: Response) => {
  res.json({ data: ' I am Working' });
});

const startFunc = async () => {
  await dbConnect(MONGO_URI ?? '');
  httpServer.listen(port, () => console.log(`App listening on port : ${port}`));
};

await startFunc();
