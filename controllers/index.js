/// <reference path="../include.d.ts" />

var mvc = require("../mvc");
var db = require("../db");

/**
 * 首页跳转
 */
exports.index = function (req, data, render) {
	render(false);
};

/**
 * 首页菜单读取
 */
exports.menu = function (req, data, render) {
	var menuSql = 'select * from yatu_menu m order by m.location';
	db.query(menuSql, [], function (err, results) {
		if (err) {
			console.error("Unexpected error");
			return;
		}
		return render(true, results);
	});
};

/**
 * 获取位置对应的图片id list
 */
exports.images = function (req, data, render) {
	var imagesSql = 'select l.* from yatu_location l';
	db.query(imagesSql, [], function (err, results) {
		if (err) {
			console.error("Unexpected error");
			return;
		}

		return render(true, results);
	});
}

/**
 * 读取具体图片
 */
exports.showImages = function (req, data, render) {
	var querySql = 'select i.* from yatu_images i where i.id=?';
	// console.log(req.params.id);
	db.query(querySql, [req.params.id], function (err, results) {
		if (err) {
			console.error("Unexpected error");
			return;
		}

		return render(true, results);
	});
}

/**
 * 首页“我们的责任文字”
 */
exports.dutiesText = function (req, data, render) {
	var querySql = 'select t.content from yatu_text t where t.code=?';
	//此处ID实际上传入的是code
	db.query(querySql, [req.params.id], function (err, results) {
		if (err) {
			console.error("Unexpected error");
			return;
		}

		return render(true, results);
	});
}


exports.videoLink = function (req, data, render) {
	var querySql = 'select v.* from yatu_videos v where v.id=?';
	db.query(querySql, [req.params.id], function (err, results) {
		for(var i in req.params) {
			console.log(i + " : " + req.params[i]);
		}
		if (err) {
			console.error("Unexpected error");
			return;
		}

		return render(true, results);
	});
}
