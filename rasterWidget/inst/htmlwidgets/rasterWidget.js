HTMLWidgets.widget({

  name: 'rasterWidget',

  type: 'output',

  initialize: function(el, width, height) {

    return {
      // TODO: add instance fields as required
    }

  },

  renderValue: function(el, x, instance) {
   var dat = x.values;

var z = 20,
    w = 80 * z,
    h = 115 * z,
    canvasX = 400,
    canvasY = 400
    x = w / z,
    y = h / z;

var svg = d3.select("body").append("svg")
    .attr("width", canvasX)
    .attr("height", canvasY)
    .call(d3.behavior.zoom().on("zoom", function () {
    svg.attr("transform", "translate(" + d3.event.translate + ")" + "   scale(" + d3.event.scale + ")")
})).append("g");

svg.selectAll("rect")
    .data(d3.range(dat.length))
    .enter().append("rect")
    .attr("transform", translate)
    .attr("width", z)
    .attr("height", z)
    .style("fill", colorize)
    .append("svg:title")
    .text(function(d) { return dat[d]; });

function translate(d) {
    return "translate(" + (d % x) * z + "," + Math.floor(d / x) * z + ")";
}

function colorize(d) {
    console.log(dat[d]);
    if(dat[d] == null)
        return "white";
    if(dat[d] < 548)
        return "yellow";
    if(dat[d] < 968)
        return "orange";
    else
        return "red";
}



  },

  resize: function(el, width, height, instance) {

  }

});
