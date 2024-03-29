var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var session = require('express-session');
const redis = require('redis');
var formidable = require('formidable');
var http = require('http');
var socket = require('socket.io');

var RedisStore = require('connect-redis')(session);
var redisClient = redis.createClient({
  host: 'localhost',
  port: 6379,
  password: 'secret1234'
});
redisClient.unref()
redisClient.on('error', console.log)

var indexRouter = require('./routes/index');
var adminRouter = require('./routes/admin');

var app = express();

var http = http.Server(app);
var io = socket(http);

io.on('connection', function(socket) {
  console.log('Novo usuário conectado');
});

app.use(function(req, res, next){
 
  let contentType = req.headers["content-type"];
 
  if (req.method === 'POST' && contentType.indexOf('multipart/form-data;') > -1) {
    var form = formidable.IncomingForm({
      uploadDir: path.join(__dirname, "/public/images"),
      keepExtensions: true
    });
 
    form.parse(req, function(err, fields, files){
 
      req.body = fields;
      req.fields = fields;
      req.files = files;
 
      next();
 
    });
  } else {
    next();
  }
 
});


// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(
  session({
    store: new RedisStore({client: redisClient}),
    secret: 'secret1234',
    resave: true,
    saveUninitialized: true
  })
);

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/admin', adminRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

http.listen(3000, function() {

  console.log('servidor online');

});

