"use strict";

document.addEventListener('submit', function(e) {
  var form = e.target;
  if (form.method != 'post') return;

  e.preventDefault();
  var formData = new FormData(form);
  post(form.action, formData, load);
}, false);

function request(method, url, formData, cb) {
  var xhr = new XMLHttpRequest;
  xhr.open(method, url);
  xhr.responseType = 'document';
  xhr.onload = function() {
    cb(xhr.response);
  }
  xhr.send(formData);
}

function post(url, formData, cb) {
  return request('POST', url, formData, cb);
}

function get(url, cb) {
  return request('GET', url, null, cb);
}

function getXML(url, cb) {
  var xhr = new XMLHttpRequest;
  xhr.open('GET', url);
  xhr.responseType = 'document';
  xhr.onload = function() {
    cb(xhr.response);
  }
  xhr.send();
}

function load(xmldoc) {
  var xslt = new XSLTProcessor();
  // <?xml-stylesheet?> を探すのは面倒なので省略
  get('/index.xsl', function(xsldoc) {
    xslt.importStylesheet(xsldoc);
    var doc = xslt.transformToDocument(xmldoc);
    // ここを React とかにできると良いんじゃないか
    document.replaceChild(
      document.importNode(doc.documentElement, true),
      document.documentElement);
  });
}

