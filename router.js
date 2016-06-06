// === web request routing ===  

mvc = require("./mvc");

/*
route via express.js
*/
exports.route = function(app) {
	// --- valid mvc requests ---
	app.all('/', function(req, res, next) {
		return routeMvc('index', 'index', req, res, next);
	});
	app.all('/:controller', function(req, res, next) {
		return routeMvc(req.params.controller, 'index', req, res, next);
	});
	app.all('/:controller/:method', function(req, res, next) {
		return routeMvc(req.params.controller, req.params.method, req, res, next);
	});
	app.all('/:controller/:method/:id', function(req, res, next) {
		return routeMvc(req.params.controller, req.params.method, req, res, next);
	});
	// --- invalid requests ---
	app.use(function(err, req, res, next) {
		mvc.error('error 500: ', err.stack);
		return res.render('500', 500);
	});
	app.all('/*', function(req, res) {
		mvc.warn("error 404: ", req.url);
		res.render('404', 404);
	});
};

/*
route mvc request
*/
routeMvc = function(controllerName, methodName, req, res, next) {
	var controller, data, method;
	//根路径跳转至index
	if (!(controllerName != null)) controllerName = 'index';
	controller = null;
	try {
		//根据controllerName引入controllers目录下对应的模块
		controller = require("./controllers/" + controllerName);
	} catch (e) {
		mvc.warn("controller not found: " + controllerName, e);
		return next();
	}
	data = null;
	method = null;
	if (methodName != null) {
		//过滤特殊字符
		methodName = methodName.replace(/[^a-z0-9A-Z_-]/i, '');
		//通过eval函数直接获得对应函数例如： controller.index
		method = eval('controller.' + methodName);
	}
	if (method != null) {
		data = {};
		return method(req, data, function(isApi, results) {
			if (!(data != null)) {
				throw new Error("Controller's return value not implemented!");
			}
			//如果是api(是否为api需要再controller中给出bool值)
			if (isApi) {
				//data要在controller（及其下层）中被赋予正确的值，然后直接send返回给浏览器
				return res.send(results);
			//如果不是api
			} else {
				//同样，data在controller中处理好，并赋予更多的属性controllerName和methodName，然后进行渲染
				data.debugJs = mvc.config.DEBUG_CLIENT;
				data.controllerName = controllerName;
				data.methodName = methodName;
				//data.layout = "layout";
				return res.render(controllerName, data);
			}
		});
	}else{
		mvc.warn('method not found: ' + methodName);
		return next();
	}
}
