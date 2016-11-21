
/*jshint node:true*/
'use strict';

var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var compress = require('compression');
// var cors = require('cors');
// var errorHandler = require('./utils/errorHandler')();
// var four0four = require('./utils/404')();
// var favicon = require('serve-favicon');
var bunyan = require('bunyan');
var log = bunyan.createLogger({name: 'event-view'});

var port = process.env.PORT || 7203;
var routes;

var environment = process.env.NODE_ENV;

// app.use(favicon(__dirname + '/favicon.ico'));
app.use(bodyParser.urlencoded({
    extended: true
}));
app.use(bodyParser.json());
app.use(compress());
// app.use(logger('dev'));
// app.use(cors());
// app.use(errorHandler.init);

// routes = require('./routes/index')(app);

log.info('About to crank up node');
log.info('PORT=' + port);
log.info('NODE_ENV=' + environment);

app.get('/ping', function (req, res, next) {
    log.info(req.body);
    res.send('pong');
});

log.info('** DEV **');
app.use(express.static('./src/'));
app.use(express.static('./'));
// All the assets are served at this point.
// Any invalid calls for templateUrls are under app/* and should return 404
// app.use('/app/*', function (req, res, next) {
//     four0four.send404(req, res);
// });
// Any deep link calls should return index.html
app.use('/*', express.static('./src/index.html'));

app.listen(port, function () {
    log.info('Express server listening on port ' + port);
    log.info('env = ' + app.get('env') + '\n__dirname = ' + __dirname + '\nprocess.cwd = ' + process.cwd());
});