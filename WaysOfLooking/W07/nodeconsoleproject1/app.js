'use strict';

const readline = require('readline');

console.log('Hello world');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('Press any key to exit...', (answer) => {
    rl.close();
});
