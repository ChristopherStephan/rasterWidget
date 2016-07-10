HTMLWidgets.widget({

  name: 'rasterWidget',
  type: 'output',
  initialize: function(el, width, height) {
    return {
      // TODO: add instance fields as required
    }
  },

  renderValue: function(el, data, instance) {

    var dat = data.values;
    var classBreaks = data.classBreaks;
    var colors = data.colors;

    var z = 20,
        w = 80 * z,
        h = 115 * z,
        canvasX = data.width,
        canvasY = data.height,
        x = w / z,
        y = h / z;

    var svg = d3.select("#htmlwidget_container")
        .select("div")
        .append("svg")
        .style("border", "1px solid black")
        .attr("width", canvasX)
        .attr("height", canvasY)
        .call(d3.behavior.zoom().on("zoom", zoom))
        .append("g");

    svg.selectAll("rect")
        .data(d3.range(dat.length))
        .enter().append("rect")
        .attr("transform", translate)
        .attr("width", z)
        .attr("height", z)
        .style("fill", colorize)
        .append("svg:title")
        .text(getCellValue);

    function translate(d) {
        return "translate(" + (d % x) * z + "," + Math.floor(d / x) * z + ")";
    }

    function zoom() {
        svg.attr("transform", "translate(" + d3.event.translate + ")" + "scale(" + d3.event.scale + ")");
    }

    function colorize(d) {
      if (dat[d] === null)
        return "gray";

      for (var i = 0; i < classBreaks.length; i++) {
        if (dat[d] <= classBreaks[i+1])
          return colors[i];
      }
    }

    function getCellValue(d) {
      return dat[d];
    }
  },

  resize: function(el, width, height, instance) {
  }
});
