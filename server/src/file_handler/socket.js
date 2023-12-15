import express from 'express';
import { createServer } from 'http';
import { Server, Socket } from 'socket.io';
import { glob } from 'glob';
import jsonlFile from 'jsonl-db';
const app = express();
const httpServer = createServer(app);
const io = new Server(httpServer);

httpServer.listen(8000, () => {
  console.log('server is listening on pot asdfa');
});
// wss.on('connection', async function connection(ws, req) {
//   ws.on('ping', () => {
//     ws.pong();
//   });

// });

var timeToWait = 10000;
var prevTime = new Date('2023-05-30T14:32:40.584Z');
io.on('connection', async (socket) => {
  console.log('connected to ', socket.id);

  // on readfile
  // need to send in order as provided in the timestamps of the jsonl file

  socket.on('readFile', async () => {
    const jsfiles = await glob(`../2579048_events.jsonl`, {
      ignore: 'node_modules/**',
    });
    console.log('Emitting', jsfiles[0]);
    const eventsFile = jsonlFile(jsfiles[0]);
    eventsFile.read(async (line) => {
      timeToWait = new Date(line['occurredAt']) - prevTime;
      console.log(prevTime, line['occurredAt'], timeToWait);
      socket.emit('newData', line);
      await sleep(timeToWait == 0 ? 1 : timeToWait);
      prevTime = new Date(line['occurredAt']);
    });
  });
});
function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms || DEF_DELAY));
}
