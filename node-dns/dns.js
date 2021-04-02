let dns = require('native-dns');
let async = require('async');
let server = dns.createServer();

server.on('listening', () => console.log('server listening on', server.address()));
server.on('close', () => console.log('server closed', server.address()));
server.on('error', (err, buff, req, res) => console.error(err.stack));
server.on('socketError', (err, socket) => console.error(err));

let authority = { address: '192.168.1.1', port: 53, type: 'udp' };

function proxy(question, response, cb) {
  console.log('proxying', question.name);

  var request = dns.Request({
    question: question, // forwarding the question
    server: authority,  // this is the DNS server we are asking
    timeout: 1000
  });

  // when we get answers, append them to the response
  request.on('message', (err, msg) => {
    msg.answer.forEach(a => response.answer.push(a));
  });

  request.on('end', cb);
  request.send();
}


function handleRequest(request, response) {
  console.log('request from', request.address.address, 'for', request.question[0].name);

  let f = []; // array of functions

  // proxy all questions
  // since proxying is asynchronous, store all callbacks
  request.question.forEach(question => {
    f.push(cb => proxy(question, response, cb));
  });

  // do the proxying in parallel
  // when done, respond to the request by sending the response
  async.parallel(f, function () { response.send(); });
}

server.on('request', handleRequest);
server.serve(53, '192.168.1.105');
console.log('listening');
