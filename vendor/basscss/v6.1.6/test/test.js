
var fs = require('fs');
var path = require('path');
var assert = require('assert');
var cssnext = require('cssnext');
var cssstats = require('cssstats');

var src = fs.readFileSync(path.join(__dirname, '../src/basscss.css'), 'utf8');

var css;
var stats;

describe('basscss', function() {

  it('should compile', function() {
    assert.doesNotThrow(function() {
      css = cssnext(src);
    });
  });

  it('should compile to string', function() {
    assert.equal(typeof css, 'string');
  });

  it('should be css', function() {
    assert.doesNotThrow(function() {
      stats = cssstats(css);
    });
  });

  it('should have rules', function() {
    assert(stats.rules.length > 0);
  });

  it('should have declarations', function() {
    assert(stats.aggregates.declarations > 0);
  });

  it('should have properties', function() {
    assert(stats.aggregates.properties.length > 0);
  });

});

